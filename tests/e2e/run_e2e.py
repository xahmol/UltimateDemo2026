#!/usr/bin/env python3
"""End-to-end test of UltimateDemo2026 on real Ultimate hardware.

Runs build/udemo2026.prg on one or more Ultimate 64 / C64 Ultimate devices
over their REST API and checks, per device:

  1. Detection screen: every result line [ OK ], the Turbo line and the
     speed probe's result (detected_turbo_class) match the product's
     maximum speed, and the screen matches its golden image.
  2. Scenes: demo_scene steps through 1-9 in order within the time limits;
     each scene animates (two captures differ; not checked for the palette
     morph, which only changes the palette), and the audio stream is not
     silent while the MOD plays (scenes 3-8).
  3. End screen: every result line [ OK ], the MHz text matches, and the
     screen matches its golden image.
  4. A key returns to BASIC (READY.).

Golden images hold VIC colour indexes, so the UCI palette changes don't
affect them (colours themselves still need an HDMI check). Captures go to
build/e2e/<64mhz|48mhz>/.

The demo loads its MOD from idi8b/ultdemo2026/ on the device's storage, so
`make deploy` must have run on each device (the PRG itself is uploaded
from the local build). Settings the demo needs (Command Interface, turbo
registers, 16 MB REU, Ultimate Audio) are switched on for the run if off,
without saving, and put back afterwards.

Based on mandelbrot-upic's tests/e2e/run_e2e.py by Christian Gleissner
(https://github.com/xahmol/mandelbrot-upic, PR #2): device setup and
restore, parallel devices, stable-frame golden captures. Adapted: scene
sequence, animation and audio checks, text-screen checks for this demo.

Usage (or `make e2e` / `make e2e-update`, which read E2E_DEVICES from .env):

    tests/e2e/run_e2e.py --device 192.168.1.148
    tests/e2e/run_e2e.py --device 192.168.1.148 --update   # rewrite goldens

Python 3 standard library only.
"""

import argparse
import os
import sys
import threading
import time

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(HERE))
sys.path.insert(0, HERE)

import png  # noqa: E402
from ultimate import Ultimate, UltimateError  # noqa: E402

GOLDEN = os.path.join(HERE, "golden")
OUT = os.path.join(REPO, "build", "e2e")

# /v1/info "product" -> maximum speed; detected_turbo_class must match
# (ultimate_turbo_lib.h: TURBO_MAX_48MHZ = 1, TURBO_MAX_64MHZ = 2).
PRODUCTS = {
    "Ultimate 64": "48mhz",
    "Ultimate 64 Elite": "48mhz",
    "Ultimate 64 Elite II": "64mhz",
    "Ultimate 64-II": "64mhz",  # how firmware 3.15a reports an Elite II
    "C64 Ultimate": "64mhz",
}
PROBE_CLASS = {"48mhz": 1, "64mhz": 2}
MHZ_TEXT = {"48mhz": "48 MHz", "64mhz": "64 MHz"}

# Settings the demo needs: (category, item, wanted value or None = the
# product's own "... Turbo Registers" value).
SETTINGS = [
    ("C64 and Cartridge Settings", "Command Interface", "Enabled"),
    ("C64 and Cartridge Settings", "RAM Expansion Unit", "Enabled"),
    ("C64 and Cartridge Settings", "REU Size", "16 MB"),
    ("C64 and Cartridge Settings", "Map Ultimate Audio $DF20-DFFF", "Enabled"),
    ("U64 Specific Settings", "Turbo Control", None),
]

MOD_PATHS = ["/usb0/idi8b/ultdemo2026/4ev.mod", "/usb1/idi8b/ultdemo2026/4ev.mod",
             "/sd/idi8b/ultdemo2026/4ev.mod"]

SCREEN = 0x0400
DETECTION_LINES = ["UCI", "REU", "Turbo", "Audio", "Palet", "Music"]
END_LINES = ["Gear", "Fract", "Ball", "Vect", "Plas", "Tunl", "Flow", "Scrl", "Music"]

SCENES = {1: "gears", 2: "palette morph", 3: "mandelbrot", 4: "ball", 5: "vectors",
          6: "plasma", 7: "tunnel", 8: "flower", 9: "scroller", 10: "end screen"}
NO_MOTION_CHECK = {2}            # palette changes only: indexes stay the same
MUSIC_SCENES = {3, 4, 5, 6, 7, 8}
SCENE_TIMEOUT = 90.0             # longest a scene may take
SCROLLER_KEY_AFTER = 8.0         # the scroller runs until a key
AUDIO_RMS_MIN = 0.005            # AC level; idle measures about 0.0001
STABLE_FRAMES = 8

# Standard VIC-II palette ("Pepto"), only for viewing the PNGs.
VIC_PALETTE = [(0, 0, 0), (255, 255, 255), (104, 55, 43), (112, 164, 178),
               (111, 61, 134), (88, 141, 67), (53, 40, 121), (184, 199, 111),
               (111, 79, 37), (67, 57, 0), (154, 103, 89), (68, 68, 68),
               (108, 108, 108), (154, 210, 132), (108, 94, 181), (149, 149, 149)]


class Failure(Exception):
    pass


def load_symbols(prg_path):
    """Symbol addresses from the Oscar64 .lbl file next to the PRG."""
    symbols = {}
    with open(os.path.splitext(prg_path)[0] + ".lbl") as f:
        for line in f:
            parts = line.split()
            if len(parts) == 3 and parts[0] == "al":
                symbols[parts[2].lstrip(".")] = int(parts[1], 16)
    return symbols


def wait_for(predicate, timeout, interval=0.25):
    deadline = time.monotonic() + timeout
    while time.monotonic() < deadline:
        if predicate():
            return True
        time.sleep(interval)
    return predicate()


def decode_screen(raw):
    """Screen codes (lower/upper case charset) to 25 lines of text."""
    chars = []
    for b in raw:
        c = b & 0x7F                         # ignore reverse video
        if c == 0:
            chars.append("@")
        elif c <= 26:
            chars.append(chr(96 + c))        # a-z
        elif c < 32:
            chars.append("[£]^<"[c - 27])
        elif c < 64:
            chars.append(chr(c))
        elif 65 <= c <= 90:
            chars.append(chr(c))             # A-Z
        else:
            chars.append(" ")
    text = "".join(chars)
    return [text[i * 40:(i + 1) * 40].rstrip() for i in range(25)]


class DeviceRun:
    def __init__(self, host, port, prg, symbols, update, password):
        self.u = Ultimate(host, password=password)
        self.host = host
        self.video_port = port
        self.audio_port = port + 1
        self.prg = prg
        self.sym = symbols
        self.update = update
        self.failures = []
        self.mode = None
        self.restore = []

    def log(self, text):
        print("[%s %s] %s" % (self.host, self.mode or "?", text), flush=True)

    def fail(self, text):
        self.failures.append(text)
        self.log("FAIL " + text)

    # -- setup ------------------------------------------------------------
    def configure(self):
        product = self.u.info()["product"]
        if product not in PRODUCTS:
            raise Failure("unsupported product %r" % product)
        self.mode = PRODUCTS[product]
        self.log(product)
        changed = False
        for category, item, wanted in SETTINGS:
            current, values = self.u.get_config(category, item)
            if wanted is None:
                wanted = next(v for v in values if v.endswith("Turbo Registers"))
            if current != wanted:
                self.u.set_config(category, item, wanted)
                self.restore.append((category, item, current))
                self.log("%s: %s -> %s for this run" % (item, current, wanted))
                changed = True
        if changed:
            time.sleep(3)       # let the firmware apply them
        if not any(self.u.file_exists(p) for p in MOD_PATHS):
            raise Failure("4ev.mod not found on the device (run `make deploy`)")

    def unconfigure(self):
        for category, item, value in reversed(self.restore):
            try:
                self.u.set_config(category, item, value)
            except UltimateError as e:
                self.log("could not restore %s: %s" % (item, e))

    # -- program state ----------------------------------------------------
    def peek(self, name):
        return self.u.read_memory(self.sym[name], 1)[0]

    def screen(self):
        return decode_screen(self.u.read_memory(SCREEN, 1000))

    def screen_has(self, text):
        return any(text.lower() in line.lower() for line in self.screen())

    def check_results(self, what, names, extra=()):
        lines = self.screen()
        for name in names:
            line = next((l for l in lines if l.strip().startswith(name)), None)
            if line is None:
                self.fail("%s: no %s line" % (what, name))
            elif "[ OK ]" not in line.upper():
                self.fail("%s: %s" % (what, line.strip()))
        for text in extra:
            if not any(text in l for l in lines):
                self.fail("%s: %r not on screen" % (what, text))

    # -- captures ---------------------------------------------------------
    def capture_golden(self, name, video):
        frames = video.frames(STABLE_FRAMES)
        frame = frames[0]
        os.makedirs(os.path.join(OUT, self.mode), exist_ok=True)
        png.write(os.path.join(OUT, self.mode, name + ".png"), frame, VIC_PALETTE)
        if len(set(tuple(f) for f in frames)) != 1:
            self.fail("%s: frames not stable" % name)
            return
        golden = os.path.join(GOLDEN, self.mode, name + ".png")
        if self.update:
            os.makedirs(os.path.dirname(golden), exist_ok=True)
            png.write(golden, frame, VIC_PALETTE)
            self.log("%s: golden written" % name)
            return
        if not os.path.exists(golden):
            self.fail("%s: no golden image %s (run with --update)" % (name, os.path.relpath(golden, REPO)))
            return
        expected, _ = png.read(golden)
        bad = [(y, x) for y in range(min(len(frame), len(expected)))
               for x in range(len(frame[y])) if frame[y][x] != expected[y][x]]
        if len(frame) != len(expected) or bad:
            diff = [bytearray(len(row)) for row in frame]
            for y, x in bad:
                diff[y][x] = 1
            png.write(os.path.join(OUT, self.mode, name + "-diff.png"), diff, [(0, 0, 0), (255, 0, 0)])
            self.fail("%s: %d pixels differ from the golden%s" % (
                name, len(bad), ", first at row %d dot %d" % bad[0] if bad else ""))
        else:
            self.log("%s: matches golden" % name)

    def check_scene(self, scene, video, audio):
        name = SCENES[scene]
        a = video.frames(1)[0]
        if len(set(b for row in a for b in row)) < 2:
            self.fail("%s: blank picture" % name)
        if scene not in NO_MOTION_CHECK:
            time.sleep(0.5)
            b = video.frames(1)[0]
            if a == b:
                self.fail("%s: no animation (two captures 0.5 s apart are identical)" % name)
        os.makedirs(os.path.join(OUT, self.mode), exist_ok=True)
        png.write(os.path.join(OUT, self.mode, "scene%d-%s.png" % (scene, name.replace(" ", "-"))),
                  a, VIC_PALETTE)
        if scene in MUSIC_SCENES:
            level = audio.rms(0.5)
            if level < AUDIO_RMS_MIN:
                self.fail("%s: audio silent (level %.5f)" % (name, level))
            return " audio level %.3f" % level
        return ""

    # -- run --------------------------------------------------------------
    def run(self):
        try:
            self.configure()
            t0 = time.monotonic()
            self.u.run_prg(self.prg)
            if not wait_for(lambda: self.screen_has("Detection complete"), 30, 0.5):
                raise Failure("detection screen not complete after 30 s: %s" % self.screen())
            self.log("detection complete after %.1fs" % (time.monotonic() - t0))
            probe = self.peek("detected_turbo_class")
            if probe != PROBE_CLASS[self.mode]:
                self.fail("speed probe class %d, expected %d" % (probe, PROBE_CLASS[self.mode]))
            self.check_results("detection", DETECTION_LINES, [MHZ_TEXT[self.mode]])
            # Blank the build's version text (row 1, columns 20-39) so the
            # golden doesn't depend on the build time.
            self.u.write_memory(SCREEN + 40 + 20, b"\x20" * 20)
            with self.u.video_stream(self.video_port) as video, \
                    self.u.audio_stream(self.audio_port) as audio:
                time.sleep(0.2)
                self.capture_golden("detection", video)
                self.log("audio level before the music: %.5f" % audio.rms(0.5))

                self.u.tap_keys(["space"])
                expected, start = 1, time.monotonic()
                while expected <= 10:
                    if not wait_for(lambda: self.peek("demo_scene") >= expected, SCENE_TIMEOUT, 0.3):
                        raise Failure("scene %s not reached within %ds (demo_scene %d)" % (
                            SCENES[expected], SCENE_TIMEOUT, self.peek("demo_scene")))
                    scene = self.peek("demo_scene")
                    if scene != expected:
                        self.fail("demo_scene went to %d, expected %d (%s)" % (scene, expected, SCENES[expected]))
                        expected = scene
                    now = time.monotonic()
                    if scene == 10:
                        self.log("end screen after %.1fs" % (now - start))
                        break
                    time.sleep(1.5)
                    info = self.check_scene(scene, video, audio)
                    self.log("scene %d %s at %.1fs%s" % (scene, SCENES[scene], now - start, info))
                    if scene == 9:
                        time.sleep(SCROLLER_KEY_AFTER)
                        self.u.tap_keys(["space"])
                    expected = scene + 1

                if not wait_for(lambda: self.screen_has("End of Demo Sequence"), 10, 0.5):
                    raise Failure("end screen text not shown")
                time.sleep(0.5)
                self.check_results("end screen", END_LINES, ["at %s turbo" % MHZ_TEXT[self.mode]])
                self.capture_golden("end", video)

            self.u.tap_keys(["space"])
            if not wait_for(lambda: self.screen_has("READY."), 10, 0.5):
                self.fail("no READY. after leaving the end screen")
            else:
                self.log("back in BASIC")
        except (Failure, UltimateError) as e:
            self.fail(str(e))
        finally:
            try:
                self.unconfigure()
            except UltimateError as e:
                self.log("restoring settings failed: %s" % e)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--device", action="append", default=[],
                    help="host name or IP of an Ultimate (repeatable); default: $E2E_DEVICES")
    ap.add_argument("--prg", default=os.path.join(REPO, "build", "udemo2026.prg"))
    ap.add_argument("--update", action="store_true", help="write the captures as the new goldens")
    ap.add_argument("--password", default=os.environ.get("ULTIMATE_PASSWORD"))
    args = ap.parse_args()
    devices = args.device or os.environ.get("E2E_DEVICES", "").split()
    if not devices:
        ap.error("no devices: pass --device or set E2E_DEVICES")
    with open(args.prg, "rb") as f:
        prg = f.read()
    symbols = load_symbols(args.prg)
    for name in ("demo_scene", "detected_turbo_class"):
        if name not in symbols:
            ap.error("%s not in the .lbl file; rebuild" % name)
    runs = [DeviceRun(h, 11000 + 10 * i, prg, symbols, args.update, args.password)
            for i, h in enumerate(devices)]
    threads = [threading.Thread(target=r.run) for r in runs]
    t0 = time.monotonic()
    for t in threads:
        t.start()
    for t in threads:
        t.join()
    failures = ["%s: %s" % (r.host, x) for r in runs for x in r.failures]
    print("\n%d device(s), %.0fs: %s" % (len(runs), time.monotonic() - t0,
                                          "FAILED" if failures else "passed"))
    for f in failures:
        print("  " + f)
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
