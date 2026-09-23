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

**Written 2026-09-23, not yet executed.** `c64bridge` was registered with
Claude Code mid-session (`claude mcp add c64bridge --scope user`), and MCP
servers only attach at session start, so this procedure is grounded in
c64bridge's documented API (fetched from its README) but has not been run
end-to-end yet. Run it in a fresh Claude Code session (so `c64bridge`'s
tools are actually live) and correct anything that doesn't match reality
before trusting this as a real regression suite.

## Prerequisites

- `c64bridge` connected: `claude mcp list` shows `c64bridge ... Connected`.
  If not, `u64` (alias, see `~/.bashrc`) re-registers it and checks
  `192.168.1.148` is reachable.
- `~/.c64bridge.json` has `c64u.host = 192.168.1.148` (already set up).
- **`make deploy` has been run recently** against the real device, so
  `/usb0/idi8b/ultdemo2026/udemo2026.prg` (+ `.cfg`, `config/`, `4ev.mod`)
  reflects the current build. `c64_program.run_prg` runs from
  Ultimate-visible storage, not from a local file upload -- it does not
  build or deploy anything itself.
- Real U64/U64E2 firmware "Turbo Mode" set to "U64 Turbo Registers" (per
  project CLAUDE.md) -- same prerequisite as always, c64bridge doesn't
  change this.

## Important: `c64_graphics.capture_frame` does not reflect custom palette

`capture_frame` reads the Ultimate's **network video stream**, which does
not route through custom UCI palette changes. Since most of this demo's
scenes recolour via palette control (`mandel.c` by escape depth;
`tunnel.c`, `plasma.c`, `ball.c`, `flower.c` all have custom-palette
colour-pulse/gradient treatments -- see project memory
`project_firmware315_plan.md`), `capture_frame` at those checkpoints
confirms **timing and that something is rendering**, not that the colours
are correct. Treat every capture below as structural-only unless noted
otherwise, and pair the palette-dependent scenes (gears' colour ramp,
mandel, tunnel, plasma-in-ball-scene-background, flower, and the
`Palet`-line palette_morph check itself) with an actual manual HDMI
screenshot when visual/colour correctness specifically needs checking --
same method used throughout this session's issue #3 investigation (a
real photo of the real screen).

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
   - `c64_input.key` `{key: "space"}` -- `screen_wait_key()` accepts any
     key.

5. **Scene checkpoints** (structural only, per the palette caveat above).
   Space these by real elapsed time, not the emulator's ~500s+ emulated
   time -- expect the whole sequence to run close to real-time speed here,
   so pace `wait`s accordingly once a first run gives real numbers:
   - Gears ramping to 64 MHz -- `c64_graphics.capture_frame`, confirm a
     gear shape is present (don't assert on colour: this is the ramp that
     changes colour with speed).
   - Mandelbrot -- `capture_frame`; flag for manual HDMI check (palette
     recolouring).
   - Ball + wireframe floor -- `capture_frame` (shape/motion only).
   - Tunnel -- `capture_frame`; flag for manual HDMI check (palette).
   - Flower (PETSCII rose) -- `capture_frame`; flag for manual HDMI check.
   - Scroller -- `capture_frame`; this is also where the 38-column fix
     from this session should show a clean left edge, worth a manual
     screenshot specifically to confirm on real hardware (the emulator
     test only confirmed the border-width *change*, not that it looks
     right against real analog-ish HDMI scaling).

6. **Audio -- the check the emulator could never do.**
   - `c64_sound.record_analyze` `{durationSeconds: 5}` sometime during the
     gears-onward window (music starts after gears per `main.c`). Confirm
     non-silent output and roughly-expected spectral content, not exact
     values -- this is a first pass at something genuinely new, not a
     tuned assertion.

7. **End screen and clean exit.**
   - `c64_memory.wait_for_text` `{pattern: "End of Demo Sequence", timeoutMs: 20000}`
   - `c64_memory.read_screen` -- assert the eight `screen_result` lines
     (`Gear`, `Fract`, `Ball`, `Vect`, `Plas`, `Tunl`, `Flow`, `Scrl`,
     `Music` if `mod_ok`) are present.
   - `c64_input.key` `{key: "space"}`
   - `c64_memory.wait_for_text` `{pattern: "READY.", timeoutMs: 5000}` --
     confirms the clean `return 0` path back to BASIC (the exact thing
     the `feedback_redundant_uci_call_hang.md` regression this session's
     memory tracks used to break).

8. **Config drift check.**
   - `c64_config.diff` `{path: "/tmp/c64bridge-baseline.cfg"}` -- confirm
     nothing was left in an unexpected state after the run.

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
