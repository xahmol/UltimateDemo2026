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

## Important: `c64_graphics.capture_frame` and `c64_sound.capture_samples` may not work at all, depending on your network setup

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
