# End-to-end test on real hardware

`make e2e` runs the whole demo unattended on one or more real Ultimate
devices and checks what the hardware produces: the detection screen,
every scene, the music and the end screen. VICE can't do this (it doesn't
emulate the Ultimate's UCI, turbo or audio hardware). A run takes about
3.5 minutes on a 64 MHz device and 4 on a 48 MHz one; devices run in
parallel (two devices: about 4 minutes). Python 3
standard library only.

Modelled on mandelbrot-upic's `tests/e2e/` by Christian Gleissner;
`png.py` comes from there unchanged, `ultimate.py` adds the audio stream.

## Requirements

- An Ultimate 64 (any model) or C64 Ultimate with firmware 3.15 or later:
  the test uses keyboard input (`POST /v1/machine:input`) and the video
  and audio streams.
- `make deploy` has run on each device: the demo loads `4ev.mod` from
  `idi8b/ultdemo2026/` on the device's storage (`usb0`, `usb1` or `SD`;
  `make deploy ULTHOST=... ULTUSB=SD` for an SD card). The PRG itself is
  uploaded from the local build, so it doesn't need to be deployed.
- The host must receive multicast UDP from the devices: video to
  `239.0.1.64`, audio to `239.0.1.65`. Device n (0, 1, ...) uses port
  11000 + 10n for video and 11005 + n for audio, so two devices fit a
  firewall rule for UDP 11000-11010. From WSL2 this needs mirrored
  networking and a Hyper-V firewall rule; see "Running from WSL2" in
  mandelbrot-upic's `tests/e2e/README.md` (set up on this PC).
- Settings the demo needs are switched on for the run if they are off
  (not saved to flash) and restored afterwards: Command Interface, RAM
  Expansion Unit with 16 MB, Ultimate Audio mapping, and Turbo Control set
  to the product's "... Turbo Registers" value.
- With a network password, set `ULTIMATE_PASSWORD` in the environment or
  pass `--password`.

## Running

Devices come from `E2E_DEVICES` in `.env` (default: `ULTHOST`):

```
make e2e             # check against the golden images
make e2e-update      # write the captures as the new goldens
tests/e2e/run_e2e.py --device 192.168.1.148 --device 192.168.1.195
```

The PRG and its `.lbl` file must come from the same build: the script
reads the addresses of `demo_scene` and `detected_turbo_class` from it.
Every capture goes to `build/e2e/<64mhz|48mhz>/`, including one per scene
and a `-diff.png` for a golden mismatch.

## What a run checks

Per device, on one program start:

1. **Detection screen:** all result lines `[ OK ]`; the Turbo line and
   the speed probe's result (`detected_turbo_class`) match the product's
   maximum speed (`Ultimate 64`/`Elite`: 48 MHz, `Elite II`/`64-II`/`C64
   Ultimate`: 64 MHz); the screen matches `golden/<mhz>/detection.png`
   (the build's version text is blanked in screen memory first, with
   reverse spaces so the header bar stays intact: on the screen the version
   text visibly disappears just before the demo starts — that is the test,
   not the demo).
2. **Scenes:** after a key, `demo_scene` (set by `src/main.c`) goes
   through gears, palette morph, Mandelbrot, ball, vectors, plasma,
   tunnel, flower and scroller in that order, each within 90 s. In each
   scene the picture is not blank and changes within 0.5 s (not checked
   for the palette morph, which only changes the palette, invisible to
   colour indexes). From the Mandelbrot to the flower the audio stream's
   level must be above 0.005 (idle measures about 0.0001; the MOD gives
   0.09-0.14 on an Ultimate 64-II and 0.03-0.04 on an Ultimate 64 Elite). The scroller is left with a key after 8 s.
3. **End screen:** all result lines `[ OK ]`, the MHz text matches, and
   the screen matches `golden/<mhz>/end.png`.
4. A key returns to BASIC (`READY.`).

Golden images hold VIC colour indexes, so the UCI palette changes don't
affect them; the colours themselves still need an HDMI check. The scenes
are animated and time-dependent, so they are checked for progress,
motion and sound rather than against goldens.

**Audio level:** the stream carries a large constant offset per channel
even when silent (several thousand counts, different per channel and per
run), so the level is the RMS after removing each channel's mean.

## Goldens

Written on 2026-10-02 with firmware 3.15a: `golden/64mhz/` on an Ultimate
64-II, `golden/48mhz/` on an Ultimate 64 Elite. Rewrite them after any
intended change to the detection or end screen (`make e2e-update` with a
device of each kind in `E2E_DEVICES`).

**Colours in the PNGs:** the video stream carries colour indexes only, so
the demo's UCI palette changes never reach it. The PNGs are written with
a fixed standard VIC palette (`VIC_PALETTE` in `run_e2e.py`) just so they
can be viewed; they show the default C64 colours, not the demo's.
