# Real-hardware smoke test (c64bridge)

Runbook for testing `udemo2026.prg` against the actual Ultimate 64 at
`192.168.1.148`, via the [c64bridge](https://github.com/chrisgleissner/c64bridge)
MCP server, instead of UE2-C64U-Emulator. This is a companion to
`tests/emulator/`, not a replacement: the emulator is better for fast,
repeatable, no-hardware iteration and catching things like the C64U
Run/Load reset bug or the overlay dimming/positioning gaps found this
session; this is for ground truth on the real device, and for the two
things the emulator could never confirm at all -- audio actually playing,
and true palette-recoloured colour output.

**Validated end-to-end 2026-09-23** against real Ultimate 64-II hardware
(firmware 3.15a). Full detection pass (all six `[ OK ]` lines), all nine
end-screen result lines, clean return to `READY.`, all confirmed for real.
Two corrections below came directly out of that run, not guesswork.

## Prerequisites

- `c64bridge` connected: `claude mcp list` shows `c64bridge ... Connected`.
  If not, `u64` (alias, see `~/.bashrc`) re-registers it and checks
  `192.168.1.148` is reachable.
- `~/.c64bridge.json` has `c64u.host = 192.168.1.148` (already set up).
- **`make deploy` has been run recently** against the real device, so
  `/usb0/idi8b/ultdemo2026/udemo2026.prg` (+ `.cfg`, `config/`, `4ev.mod`)
  reflects the current build. `c64_program.run_prg` runs from
  Ultimate-visible storage, not from a local file upload -- it does not
  build or deploy anything itself. **Hit this gap for real on 2026-09-23**:
  tested the scroller's 38-column fix against a stale deploy (confirmed
  jumpy on real hardware, as expected for the *old* build) before
  realising `make deploy` had never been run that session. `c64_disk.file_info`
  on the deployed path is a cheap sanity check -- compare its reported
  `size` against the local `build/udemo2026.prg` size before trusting a
  run to reflect your latest source changes.
- Real U64/U64E2 firmware "Turbo Mode" set to "U64 Turbo Registers" (per
  project CLAUDE.md) -- same prerequisite as always, c64bridge doesn't
  change this.

## Important: `c64_graphics.capture_frame` and `c64_sound.capture_samples` need the WSL2 network setup below

**Update 2026-10-02: fixed on this PC.** WSL2 now runs with
`networkingMode=mirrored` (`C:\Users\xande\.wslconfig`) and the
Hyper-V firewall has two persistent inbound rules: `C64VideoStream`
(UDP 11000-11010, for fixed-port listeners) and `C64BridgeCapture`
(UDP 44620-48715 from the U64 IPs). The second one matters for
c64bridge: its captures do **not** use port 11000 but let Linux pick a
random ephemeral port, and 44620-48715 is WSL's ephemeral range in
mirrored mode (`/proc/sys/net/ipv4/ip_local_port_range`; if a WSL
update changes it, captures time out again until the rule is widened).
`capture_frame` returned complete 384x272 frames after this. Close
**OBS Studio** first if it is receiving the U64 stream: in mirrored
mode it shares port numbers with WSL, and the device streams to one
destination at a time anyway. Full setup notes: the "Running from
WSL2" section of `~/git/mandelbrot-upic/tests/e2e/README.md`.

**Update 2026-10-02 (later): stream start fails until the U64 knows this
PC's MAC address.** `capture_samples` (and `capture_frame`) failed with
`Request failed with status code 404`. The firmware's actual answer to
`PUT /v1/streams/audio:start?ip=<this PC>:<port>` is 404
`{"errors":["Network Host Resolve Error"]}`, for any unicast target that
isn't in the Ultimate's ARP cache. Incoming REST traffic doesn't add the
PC to that cache, so a capture that worked earlier fails again once the
entry expires. **Fix: `ping -c1 192.168.1.148` from WSL first**, then
retry; or use a multicast target (always accepted). Reported as
chrisgleissner/c64bridge#151.

**`c64_sound record_analyze` is not the Ultimate's audio:** it records the
PC's default microphone through naudiodon/PortAudio ("Audio backend not
available" when PortAudio is missing). Installing PortAudio in WSL doesn't
help; check the demo's music with `capture_samples` (after the ping) or
with `tests/hardware/audio_capture.py`, which joins the multicast group
itself and prints RMS/peak (2026-10-02: RMS 0.12 while the MOD played).

**Repeated-start test:** `tests/hardware/rest_starts.py [prg] [n]` starts a
PRG over REST n times and checks each start reaches "Detection complete"
within 20 s (used for issue #1: 30/30 with the new UCI library; the old
library also passed 20/20, so the hang didn't reproduce here). It retries
the U64's REST interface when it stops answering for a few seconds, which
happened twice in 50 starts.

The history below explains the original failure:


**Confirmed 2026-09-23, from a WSL2 client with default (NAT) networking,
no `networkingMode=mirrored` in `.wslconfig`:** both `capture_frame` and
`capture_samples` timed out consistently (1000-1500ms) every time, while
every plain REST-based tool (`c64_program`, `c64_memory`, `c64_config`,
`c64_system`, `c64_input`) worked fine, fast (12-30ms typical). Root
cause, not chased to certainty but well supported: these two read the
Ultimate's **UDP streams**, initiated *back* from the device to whatever
client/port asked for them -- plain HTTP REST calls are client-initiated,
which NAT handles transparently, but an inbound UDP stream to a NAT'd
WSL2 guest generally needs explicit routing (mirrored networking, or a
port-proxy) that isn't there by default. If you're on a client where
these two ops also time out, don't burn time retrying -- check your
network path first (native Linux, macOS, or WSL2 with mirrored networking
should all be fine; default-NAT WSL2 is the known-bad case).

**Practical fallback, used successfully in the 2026-09-23 run:** have a
human watching the real screen call out scene transitions as they happen,
and drive verification off `wait_for_text`/`read_screen` for the
text-mode parts (detection screen, end screen) in between. Slower than
automated capture, but it worked, and it's still much less manual
navigation than the file-browser dance this whole doc was written to
avoid.

**Separately, even where `capture_frame` does work**, it reads the
network video stream, which does not route through custom UCI palette
changes. Since most of this demo's scenes recolour via palette control
(`mandel.c` by escape depth; `tunnel.c`, `plasma.c`, `ball.c`, `flower.c`
all have custom-palette colour-pulse/gradient treatments -- see project
memory `project_firmware315_plan.md`), a working `capture_frame` at those
checkpoints would still only confirm **timing and that something is
rendering**, not that the colours are correct -- pair those with an
actual manual HDMI screenshot when colour correctness specifically needs
checking, same method used throughout the issue #3 investigation.

## New options (2026-10-02), and an automated example to borrow from

- **Physical keyboard and joystick input** (`c64_input keyboard` /
  `joystick`, firmware 3.15+ `machine:input`): real C64 matrix events,
  including chords (`["left_shift", "inst_del"]`), `run_stop` and
  `restore` -- works for programs that scan the CIA directly instead of
  the KERNAL buffer. A tap holds the key about 60 ms and the REST call
  returns before that, so wait about 0.5 s before reading program state
  (`c64_input state` still lists the key right after a tap).
- **Ultimate menu screen** (`c64_system read_menu_screen`, 3.15+).
- **Automated end-to-end test as a model**: mandelbrot-upic's
  `tests/e2e/` (Python 3 standard library only, `make e2e`) starts the
  PRG over REST, presses keys with `machine:input`, receives the VIC
  video stream itself (multicast 239.0.1.64, port 11000 + 10 per
  device, several devices in parallel), waits for 8 identical frames
  and compares them pixel for pixel with golden PNGs of **colour
  indexes**. Comparing indexes sidesteps the palette caveat above: a
  UCI palette change doesn't alter the indexes, so only the colours
  themselves still need an HDMI check. It also switches needed
  settings on for the run and restores them afterwards.

## Procedure

1. **Confirm target and baseline.**
   - `c64_select_backend.select` `{backend: "c64u"}` -- explicit, in case
     another backend was left active from a prior session.
   - `c64_config.info` -- log firmware version, confirm reachable.
   - `c64_config.snapshot` `{path: "/tmp/c64bridge-baseline.cfg"}` --
     baseline before touching anything, for the `diff` at the end.

2. **Clean reset, then run.**
   - `c64_system.reset`
   - `c64_program.run_prg` `{path: "/usb0/idi8b/ultdemo2026/udemo2026.prg"}`
     -- firmware 3.15+ auto-loads the co-located `.cfg`
     (`CTRL_CMD_LOAD_CONFIG`), so REU/turbo/UCI settings apply without any
     separate `c64_config.set` calls, same as the emulator testing this
     session relied on.

3. **Detection screen.**
   - `c64_memory.wait_for_text` `{pattern: "Detection complete", timeoutMs: 15000}`
     -- real hardware's UCI round-trips should be far faster than the
     emulator's (no `--settings`-seeding regressions, no ABORT-timing race
     from issue #2); 15s is a generous ceiling, tighten once a real run
     shows the actual figure.
   - `c64_memory.read_screen` -- assert all of `UCI`, `Type`, `REU`,
     `Turbo`, `Audio`, `Palet`, `Music` show `[ OK ]` (or the known-correct
     fallback text for `Palet`/`Music` if UCI palette or the MOD file is
     genuinely unavailable -- see `tests/emulator/README.md` for what a
     legitimate non-`[ OK ]` result looks like there).

4. **Advance into the demo.**
   - **Use `c64_input.keyboard` (physical matrix tap), not `c64_input.key`.**
     `key` hit a "keyboard queue did not drain" error against this demo and
     left the machine paused; `keyboard` `{inputs: ["space"], transition:
     "tap"}` worked reliably every time in the 2026-09-23 run. `screen_wait_key()`
     accepts any key.
   - **Always follow with `c64_system.resume`.** Every `keyboard` tap in
     that run left the CPU paused afterward (success response notwithstanding);
     `resume` was needed every single time before the next check would see
     any change. Treat "tap, then resume" as one atomic step, not two
     independent ones.

5. **Scene checkpoints.** If `capture_frame` works on your network path,
   use it at each of these (structural confirmation only, per the palette
   caveat above -- don't assert on colour). If it doesn't (the 2026-09-23
   WSL2-NAT case), the confirmed working fallback is a human watching the
   real screen and calling out transitions, matched against this order:
   gears (ramping to 64 MHz) -> mandelbrot -> ball + wireframe floor ->
   vectors (3D wireframe cube) -> plasma -> tunnel -> flower (PETSCII
   rose) -> scroller. Total real-hardware time from detection-complete to
   entering the scroller was well under a minute in the validated run --
   much faster than the emulator's equivalent, no need to pace long waits
   defensively; a single generous `wait_for_text {pattern: "End of Demo
   Sequence", timeoutMs: 60000}` spanning several scenes at once is fine.
   The scroller specifically is worth a manual HDMI screenshot regardless
   of `capture_frame` working: it's where the 38-column fix from this
   session should show a clean left edge, and the emulator A/B test only
   confirmed the border-width *change* in principle, not how it looks
   against real HDMI scaling.

6. **Audio -- the check the emulator could never do, if your network path
   supports it.**
   - `c64_sound.record_analyze` `{durationSeconds: 5}` sometime during the
     gears-onward window (music starts after gears per `main.c`). Confirm
     non-silent output and roughly-expected spectral content, not exact
     values. **Same UDP-stream caveat as `capture_frame` above** --
     `capture_samples`/`record_analyze` timed out identically from
     default-NAT WSL2 in the 2026-09-23 run, never actually exercised.

7. **End screen and clean exit.**
   - `c64_memory.wait_for_text` `{pattern: "End of Demo Sequence", timeoutMs: 20000}`
   - `c64_memory.read_screen` -- assert the eight `screen_result` lines
     (`Gear`, `Fract`, `Ball`, `Vect`, `Plas`, `Tunl`, `Flow`, `Scrl`,
     `Music` if `mod_ok`) are present.
   - `c64_input.keyboard` `{inputs: ["space"], transition: "tap"}` + `c64_system.resume`
   - `c64_memory.wait_for_text` `{pattern: "READY.", timeoutMs: 5000}` --
     confirms the clean `return 0` path back to BASIC (the exact thing
     the `feedback_redundant_uci_call_hang.md` regression this session's
     memory tracks used to break).

8. **Config drift check.**
   - `c64_config.diff` `{path: "/tmp/c64bridge-baseline.cfg"}` -- confirm
     nothing was left in an unexpected state after the run. **Confirmed
     useful in the 2026-09-23 run**: caught a real diff, `[U64 Specific
     Settings] CPU Speed` changed `16`->`64` between baseline and
     end-of-run. Not chased to a conclusion -- plausibly just the config
     store mirroring the live turbo register state the demo sets rather
     than a real persisted drift, but worth understanding properly before
     trusting this check to mean "clean" when it reports a diff.

## What this replaces vs. complements from `tests/emulator/`

- Replaces entirely: the file-browser navigation dance (`button` / `key
  down` / `key right` / `expect` sequences), since `run_prg` loads
  directly from Ultimate storage.
- Complements: `smoke-udemo2026-monitor.ctl`'s `monitor dir`/`monitor
  config` verification -- `c64_config.get`/`c64_disk.file_info` are the
  real-hardware equivalents, worth adding here once this procedure is
  validated once for real.
- New capability, no emulator equivalent: audio verification (step 6),
  and true palette-correct screenshots (manual HDMI, not automatable via
  `capture_frame`).
