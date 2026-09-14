# Firmware 3.15 Upgrade Plan

Planning document only — nothing in this file has been implemented yet.
Written 2026-09-14 to capture research and decisions before the work is
done, since we are approaching a week-long gap between sessions and the
reasoning behind each choice needs to survive that gap.

Sources consulted:
- Firmware source: https://github.com/GideonZ/1541ultimate
- Release notes: https://1541u-documentation.readthedocs.io/en/latest/howto/release_3.15.html
- Local reference implementation: `/home/xahmol/git/mandelbrot-upic` (already ships a matching `.cfg`)
- Local reference implementation: `/home/xahmol/git/UBoot64-v2` (v3.0.1, commit `96458f7`,
  already implements UCI auto-enable and has a palette API wrapper)
- `control_target.cc` on firmware `master` (fetched directly) — confirms palette commands
  exist in firmware source, U64-platform-gated

**Correction (2026-09-14, same day as initial draft):** the first draft of this plan flagged the
palette UCI commands as "firmware `master`-only, not yet in a tagged release," based on a comment
in `UBoot64-v2`'s header (`"firmware test-merge branch as of 2026-09; not yet in a tagged
release"`). The user has confirmed that comment is now stale — **firmware 3.15 and 3.15a are
released versions that include the palette commands.** Everything below has been corrected
accordingly. `UBoot64-v2`'s stale comment was itself fixed and committed there (commit `860b4f3`),
since the user asked for it directly.

**Second correction (2026-09-14, later the same day):** §3 and §5 below say ported code "requires
a credit comment per this project's attribution convention." That's wrong as of the user's later
instruction: **do not add "Source: UBoot64-v2 ..." / "Based on X's ..." attribution comments when
porting code from the user's own other repos** (confirmed for `UBoot64-v2` and `mandelbrot-upic`;
presumably extends to any other `/home/xahmol/git/*` project of theirs). The global CLAUDE.md
attribution rule is for third-party sources; this is a user-specific exception for their own work.
Already applied retroactively to §3's implementation (the attribution lines added there were
removed again once this was said) — apply it going forward too, including §8 item 4's
`CTRL_CMD_*`/palette-wrapper port. Still fine to *name* the source in planning-doc prose (as this
whole document does throughout) — just not as a code comment.

---

## 1. What firmware 3.15/3.15a actually changed (relevant to this project)

| Feature | Status | Detail |
|---|---|---|
| Per-title auto `.cfg`/`.usr` loading | **Shipped, 3.15** | Loading a `.prg` (also `.d64/.d71/.d81/.g64/.g71/.tap/.crt`) makes firmware look for a same-base-name `.cfg` or `.usr` file next to it and apply those settings automatically. No UCI call needed — purely file-presence-driven. |
| UCI auto-unlock from cartridge | **Shipped, 3.15** | Writing `$AB` to `$D038` then `$CD` to `$D036` (in that order) enables the UCI I/O mapping without the user first enabling "Command Interface" in the Ultimate menu. Undocumented in the official register PDF; confirmed by Gideon Zweijtzer and verified on real U64-II hardware by the UBoot64-v2 author. Harmless on pre-3.15 firmware (writes to unused registers, silently ignored). |
| SoftIEC partitions (CMD-HD style) | Shipped, 3.15/3.15a | Not relevant to this project — no disk browsing here. |
| Palette control (get/set/set-color/reset) | **Shipped, 3.15/3.15a** | `CTRL_CMD_GET_PALETTE` (0x51) / `SET_PALETTE` (0x52) / `SET_PALETTE_COLOR` (0x53) / `RESET_PALETTE` (0x54), target `TARGET_CONTROL` (0x04). Confirmed present in `control_target.cc` on GitHub `master`, gated `#ifdef U64`, delegating to `U64Config::set_palette_rgb()`; the release-notes page also describes it in prose. The `UBoot64-v2` header comment calling this "test-merge branch, not yet in a tagged release" is now confirmed stale — 3.15 and 3.15a both ship it. Still worth a cheap runtime check (§7) purely for backward compatibility with any pre-3.15 firmware a user hasn't updated, not because the command itself is in doubt. |
| `CTRL_CMD_LOAD_CONFIG` | Shipped (this is what unblocked the palette-status comparison above) | Not needed here — the file-based `.cfg` auto-load (row 1) is a better fit than issuing this over UCI at runtime, see §2. |

No official numeric define for `CTRL_CMD_LOAD_CONFIG` was located in either local codebase; it's referenced only in comments as a precedent, not something this project needs to call directly.

---

## 2. Ship a `.cfg` next to the `.prg`

**Status: IMPLEMENTED, 2026-09-14, extended same day.** `config/UltimateDemo2026-U64E2.cfg`
created (Turbo Control + CPU Speed 16 + Badline Timing, Command Interface=Enabled — same values as
`mandelbrot-upic`, and verified `TURBO_SPEED_MAX` in `turbo.h` matches `CPU Speed=16` exactly, so
no adjustment was needed). Makefile's `zip` and `deploy` targets copy/upload it as `$(MAIN).cfg`.
Build verified clean, then hardware-verified: deployed and run on a live U64 via FTP +
`ultimate_run_program`, confirmed booting into the demo's detection screen rather than BASIC.

**REU/Audio open question resolved same day, from `/home/xahmol/git/heartbeat-demo`'s
`config/Heartbeat-U64E2.cfg`** (a sibling project that already ships working presets): the correct
`[C64 and Cartridge Settings]` keys are `RAM Expansion Unit=Enabled`, `REU Size=16 MB`, and
`Map Ultimate Audio $DF20-DFFF=Enabled`. Added to `UltimateDemo2026-U64E2.cfg` alongside the
existing `Command Interface=Enabled` — the `.cfg` now auto-configures all four settings the README
lists, not just Turbo + Command Interface. Re-deployed and re-verified on hardware after this
change; booted cleanly.

**C64U support added same day, per user request.** `heartbeat-demo`'s dual-preset pattern was
adopted directly: `config/UltimateDemo2026-C64U.cfg` added, identical to the U64E2 file except
`Turbo Control=C64U Turbo Registers` (the only line that differs between the two hardware
variants, confirmed against `heartbeat-demo`'s own `Heartbeat-C64U.cfg`/`Heartbeat-U64E2.cfg`
pair). Distribution shape (also matching `heartbeat-demo`'s and the user's own explicit
preference): both named presets ship in a `config/` subfolder in the release ZIP/install folder,
**and** the U64E2 one is additionally copied to the install root as `udemo2026.cfg` (same base
name as the `.prg`) so firmware 3.15+ auto-load keeps working for Ultimate 64/Elite hardware
without any user action. C64U firmware doesn't yet auto-load by filename — per the user, that's
the *only* gap; the `.cfg` format itself is already known and correct — so the README documents
applying `config/UltimateDemo2026-C64U.cfg` by hand via `F2` → Configuration → **Load Settings
from File**, mirroring the exact instructions and caution language already validated in
`heartbeat-demo`'s README. Also documented: once C64U firmware adds auto-loading, a C64U owner can
rename that file to `udemo2026.cfg` at the root to get the same zero-touch behavior. Makefile's
`zip` target now creates `config/` and copies both named presets into it (in addition to the
root's renamed U64E2 copy); `deploy` uploads all three the same way — confirmed `wput` creates the
remote `config/` subfolder automatically, no pre-existing directory needed. **Untested on real
C64U hardware** — the user has none to test on; the `.cfg` content is trusted because it comes
directly from `heartbeat-demo`'s own hardware-confirmed preset pair, but the manual "Load Settings
from File" application path for *this* project's file has not itself been verified on a C64U.

**Definitive hardware proof, 2026-09-14 (same day, strongest test of this whole section):** user
manually switched UCI, Ultimate Audio, REU, and Turbo all **off** in the Ultimate's own menu
(removing any chance the earlier "it worked" was just leftover state from before), then had the
demo deployed and run again via the real filesystem path. Read back screen RAM + color RAM directly
(not just border color) and decoded the actual detection-screen text: `UCI: [ OK ]` (Ultimate-II
DOS v1.2, device Ultimate 64-II), `REU: [ OK ] 16 MB`, `Turbo: [ OK ] 64 MHz`, `Audio: [ OK ] v16` —
all four green, all four at full correct values, despite every one having been off moments before.
User confirmed: "Works fine, every setting is OK in detection screen even though all were switched
off." This is conclusive: the `.cfg` auto-load + UCI unlock genuinely re-enable everything before
the `.prg` runs, not just coasting on prior manual configuration.

**Recommendation: do this. It's the highest-value, lowest-risk item here.**

`mandelbrot-upic` already does exactly this — `config/MandelbrotUpic-U64E2.cfg` gets copied to
`build/<install path>/mandelupic.cfg` at build time, matching `mandelupic.prg`'s base name, and
the Makefile comment confirms it's hardware-verified: firmware auto-loads it with no manual
"load config" step.

For this project:

- Add `config/UltimateDemo2026-U64E2.cfg` (name pattern matches the sibling project) containing
  at minimum:
  ```
  [U64 Specific Settings]
  Turbo Control=U64 Turbo Registers
  CPU Speed=16
  Badline Timing=Enabled

  [C64 and Cartridge Settings]
  Command Interface=Enabled
  ```
  `CPU Speed=16` is the config-file index for the turbo speed this demo actually uses — confirm
  the index-to-MHz mapping against `TURBOCONTROLMANUAL.md` / hardware before finalizing (mandelbrot-upic
  chose 16 for its own needs; this demo's `turbo_fast()` target may differ and the value must match it,
  not be copy-pasted blind).
- Also enable the Ultimate Audio module in the same file (`[C64 and Cartridge Settings]` — need to
  confirm the exact key name for the audio module toggle; grep the Ultimate's own exported `.cfg`
  after enabling it once by hand, same way the Turbo/Command-Interface keys above were presumably
  discovered).
- Makefile changes (mirroring `mandelbrot-upic`'s pattern):
  - `CONFIGFILE = config/UltimateDemo2026-U64E2.cfg`
  - `zip` target: `cp $(CONFIGFILE) build/$(INSTALL_PATH)/$(MAIN).cfg`
  - `deploy` target: `wput -u $(CONFIGFILE) $(ULTFTP)$(ULTPATH)$(MAIN).cfg`
- README: add a line near the existing hardware-requirements section noting the shipped `.cfg`
  auto-configures Turbo + Command Interface on firmware 3.15+, and that on older firmware these
  still need manual menu setup (current README wording stays correct as a fallback path).

This item has no dependency on the palette work and no firmware-version risk — worth doing
regardless of what happens with the rest of this plan.

---

## 3. Enable UCI programmatically (cartridge-side unlock)

**Status: IMPLEMENTED, 2026-09-14.** `uci_unlock1`/`uci_unlock2` macros and `uii_enable()` ported
into this project's `ultimate_common_lib.h`/`.c` (credited to UBoot64-v2), called at the top of
`detect_uci()` in `src/detect.c` before its existing 10-second poll loop. Build verified clean.
**Not done as part of this pass:** the broader `ultimate_common_lib.h` sync against UBoot64-v2's
newer `CTRL_CMD_*` table (including the palette command defines) — deliberately deferred to when
§5/§6 (palette work) is actually picked up, to keep this pass scoped to the unlock sequence only.

**Recommendation: do this as a defense-in-depth complement to §2, not a replacement for it.**

The `.cfg` auto-load (§2) already sets `Command Interface=Enabled` before the `.prg` starts
running, so on 3.15+ it should already be on by the time `main()` runs. The cartridge-side
unlock sequence is a second, independent path that:

- Costs two register writes, is harmless on firmware that doesn't implement it, and needs no
  config file at all — so it's a reasonable belt-and-braces addition even with §2 in place.
- Is the *only* path that works on 3.15+ if the demo is ever launched from a source that skips
  the `.cfg` mechanism (e.g. run from within a menu/launcher that doesn't propagate the sidecar
  file, or copied without its `.cfg`).
- Does **not** help on pre-3.15 firmware at all — those still require the user to have enabled
  Command Interface by hand, exactly as today.

Implementation, ported from `/home/xahmol/git/UBoot64-v2/include/ultimate_common_lib.h` (credit
comment required per this project's attribution convention — source file, what's being adapted):

```c
// In ultimate_common_lib.h, near uii_reg_read/uii_reg_write:
#define uci_unlock1 (*(volatile char *)0xd038)
#define uci_unlock2 (*(volatile char *)0xd036)

// In ultimate_common_lib.c:
void uii_enable(void)
// Based on UBoot64-v2's uii_enable() (include/ultimate_common_lib.c,
// github local repo). Firmware 3.15+ UCI unlock sequence, per Gideon
// Zweijtzer: both writes required in order; a single write to $D038 alone
// does not work. Harmless no-op on pre-3.15 firmware.
{
    uci_unlock1 = 0xab;
    uci_unlock2 = 0xcd;
}
```

Then call `uii_enable()` at the top of `detect_uci()` in `src/detect.c`, before the existing
poll loop — this project's `detect_uci()` currently only polls `uii_detect()` with a 10-second
CIA1 TOD timeout and never attempts to enable UCI itself, unlike UBoot64-v2's
`uii_wait_for_uci()` which sends the unlock first. Port that ordering, not necessarily the whole
`uii_wait_for_uci()` wrapper (this project already has its own timeout-loop shape in `detect.c`
and there's no reason to duplicate it).

While porting, also pull forward the newer `CTRL_CMD_*` table from UBoot64-v2's header — this
project's `ultimate_common_lib.h` is a materially older snapshot (missing `uci_unlock1/2`, the
palette command block, and whatever else has landed upstream since this file was last copied
across). Worth a side-by-side diff against UBoot64-v2's copy as its own small housekeeping pass,
independent of the palette work in §5.

---

## 4. Is the detection screen still needed?

**Decision, 2026-09-14 (user override of the original recommendation): keep the full itemized
screen and its required keypress, unchanged.** Reasoning given: without the keypress gate,
detection may complete too fast for a viewer to actually see the screen, and the itemized list is
useful confirmation both that the machine was correctly detected and that the `.cfg` auto-load (§2)
actually took effect. **No implementation change made for this item** — `main.c`'s detection
sequence stays exactly as it was before this plan. The proposal below is preserved for the record
but is not being acted on.

Reasoning:

- §2 and §3 together mean that on firmware 3.15+, Turbo and Command Interface should already be
  correctly configured *before* `main()` even starts — the two config items the current screen
  spends the most visual real estate confirming. Auto-configuration removes the *reason* a user
  would need to read and confirm those two lines by eye.
- What the detection code genuinely still needs to check didn't change: REU size (a real,
  variable hardware fact — no `.cfg` key sets "how much REU is installed"), Ultimate Audio module
  presence (also a real hardware/menu fact this project can't force via `.cfg` the way it can
  force Turbo, unless the audio-module toggle turns out to have a `.cfg` key — see the open
  question in §2), and Turbo/UCI as a *fallback* verification in case the `.cfg` didn't apply
  (older firmware, or the demo run from somewhere that dropped the sidecar file).
- A demo is judged partly on how fast it gets to the actual content. A five-line report screen
  that requires a keypress before anything visually interesting happens is dead weight once most
  of what it's reporting is expected to already be correct by construction.

Proposed shape:

- Run all four checks (UCI, REU, Turbo, Audio) exactly as now, silently.
- If everything passes: show a **single-line, non-blocking** status flash (e.g. "U64 64MHz / 16MB
  REU / Audio vN — OK") for roughly 1–2 seconds, then proceed straight into `gears_run()` with no
  keypress gate. This keeps the diagnostic value (a screenshot/stream viewer can still see it
  passed) without making every run wait on a human.
- If anything fails: fall back to exactly today's behavior — the full itemized screen,
  `screen_error_exit()` / `screen_hint()`, and a required keypress — since a failure is precisely
  the moment a user needs to read and act on detail, not skip past it.
- Music loading (`Loading music...` / `screen_result("Music", ...)`) is a similar case: keep it
  silent-on-success, visible-on-failure.

This is a UX decision, not a technical one — flagging it as a recommendation to confirm before
implementing, since it changes the demo's opening moments, which is exactly the kind of judgment
call worth pausing on rather than just doing.

---

## 5. Palette control — where it helps in the existing demo

**Status note carried over from §1: this is shipped in released firmware 3.15/3.15a, not an
unreleased feature — the initial draft of this plan was wrong about that (see the correction at
the top of this document). It's still good practice to runtime-detect the command (§7) rather than
assume it, purely so the demo degrades gracefully on any pre-3.15 firmware still in the wild, not
because the command's existence on 3.15+ is in question.**

Ported wrapper functions (from `/home/xahmol/git/UBoot64-v2/include/ultimate_common_lib.c`,
credited the same way as §3):

```c
void uii_getpalette(void);                              // $04 $51 → uii_data[0..47], 16×RGB
void uii_setpalette(const char *rgb48);                  // $04 $52 <48 bytes>
void uii_setpalettecolor(char index, char r, char g, char b); // $04 $53 <idx><r><g><b>
void uii_resetpalette(void);                             // $04 $54
```

### Where it would help in the current scenes

- **`mandel.c` (Mandelbrot fractal, MC hires) — primary candidate.** The scene already hand-picks
  4×4×4 per-cell colour palettes (`CPal pal[4][4]`, `src/mandel.c:62-73`) purely from the 16 fixed
  VIC colours, because that's all standard C64 hardware offers. A custom palette lets those same
  16 *indices* point at hand-chosen RGB values instead of the stock ones — e.g. a smooth
  deep-blue → cyan → white ramp for the "outside the set" bands instead of the nearest available
  stock hues. This is the one scene in the demo whose entire visual identity is "map iteration
  count to colour," which is exactly what a custom palette improves most: today it's constrained
  to 16 fixed hues chosen decades ago for general-purpose use, not for this fractal's gradient.
- **`tunnel.c` (texture-mapped tunnel, MC hires, climax scene) — co-primary candidate, and
  arguably the best-structured fit in the whole demo for this.** It already has exactly the
  scaffolding this feature wants: `pal_sc[4]`/`pal_cr[4]` (`src/tunnel.c:303-308`) define four
  named theme swaps — stone/ice/fire/alien — cycled every 200 of the scene's 800 frames
  (`tunnel_run()`, `src/tunnel.c:328-335`) by rewriting the screen/colour-RAM nibbles, the same
  "reassign what a fixed MC index points at" trick `plasma.c` uses. Each theme is already
  hand-labelled by what colour mood it's going for (comment block at `src/tunnel.c:305-308`) but
  is stuck picking the *nearest available stock hue* for each — "ice" only has light-blue/cyan to
  work with, no deep icy blue; "fire" only has orange/red, no ember-orange-to-white-hot gradient.
  A real palette swap lets these four indices point at colours actually chosen for each theme
  instead of whatever the fixed 16 happen to offer, and — more interestingly than `mandel.c`'s
  case — lets the *existing* 200-frame cycle boundary become a smooth RGB crossfade from one
  theme's palette to the next over the last second or so of each window, rather than the current
  hard cut. Because this is the demo's designated climax scene (`main.c`'s comment: "texture-mapped
  tunnel ... climax scene") and runs for 16 seconds (800 frames @ 50 Hz) with four already-distinct
  visual acts, it's a strong candidate to prioritize alongside or even ahead of `mandel.c` — it
  doesn't just improve a static look, it improves a transition the scene already performs on a
  schedule that comfortably fits the few-updates-per-second cadence discussed in §6.
- **`plasma.c` (sine interference, MC) — secondary candidate.** Already does a mid-scene palette
  swap today (`src/plasma.c:112-126`: cyan/purple/yellow/white for 350 frames, then switches to
  an orange/red/yellow set), but it does this the only way currently possible — by rewriting
  colour RAM (`c3`) to point 4 fixed colour-cell values at different stock VIC colours. A real
  palette swap would let it keep the *same* colour RAM/index assignments and instead redefine
  what those 4 indices mean, e.g. crossfading the RGB values across several palette updates for a
  genuine colour *morph* between the two moods instead of a hard cut. Lower priority than
  `mandel.c`/`tunnel.c` because the effect it already has is good and the improvement here is a
  polish item, not a capability the scene currently lacks — it's the same idea as `tunnel.c`'s
  case but on a shorter, less prominent scene.
- Not a good fit: `gears.c`/`vectors.c`/`ball.c` — these lean on XOR draw/undraw or fixed-colour
  wireframe rendering where the colour palette isn't the expressive bottleneck; `flower.c`/
  `scroller.c` are text-mode PETSCII scenes with their own established look. (`tunnel.c` was
  originally miscategorized here in the first draft of this plan without having actually read its
  source — corrected above once its existing 4-theme cycling structure was found.)

---

## 6. A new scene to actually show the feature off

**Recommendation: a dedicated "Palette Morph" scene**, placed as its own item in the sequence
(candidate slot: right after `gears.c`'s speed-ramp intro and before `mandel.c`, so the demo
establishes "look what custom colour can do" before the fractal scene leans on it — or as a
closing "reveal" scene before `flower.c`'s cooldown; either works, this is a sequencing choice to
make at implementation time, not now).

**Concept:** show something the real Commodore 64 hardware has never been able to do — a smooth
colour gradient across all 16 palette slots, not the 16 fixed hues every other C64 production is
stuck with. A bank of solid colour bars (or concentric rings, cheap to fill in MC/hires) covering
all 16 colour-RAM indices, held on screen, while every index's *RGB value* is slowly swept through
a gradient (e.g. a full HSV hue rotation, or a "cold → hot" ramp) by repeated `uii_setpalette()`
calls a few times per second. No pixel data changes at all — the entire effect is the palette
update, which is exactly the point: this cannot be done, at any speed, on a real C64.

A strong opening beat for this scene: render the bars in the **standard VIC palette** first (a
few seconds, so the viewer registers "this is normal C64 colour"), then cut to the custom
palette and start the sweep — the contrast sells the feature better than starting already in the
custom palette.

### Timing assessment (answering the "how far can we push this" question directly)

Your instinct is correct, and the research confirms it structurally, not just as a guess:

- `uii_setpalette()` goes through the same command-queue path as every other UCI command
  (`uii_settarget()` → `uii_sendcommand()` → `uii_readdata()`/`uii_readstatus()`/`uii_accept()`).
  That path is a request/response round-trip through the ARM co-processor's firmware, which is
  running its own scheduler independent of the C64's raster beam — there is no register or command
  that ties a UCI response, or the moment the ARM side actually applies `set_palette_rgb()`, to a
  specific raster line or even a specific frame boundary.
- The `control_target.cc` handler (fetched from firmware `master`) shows no vblank/frame
  synchronization in the set-palette path — it decodes the 48 bytes and calls
  `U64Config::set_palette_rgb()` directly. Whatever latency exists is queue/scheduling latency on
  the ARM side, not a deliberate frame-aligned commit.
- Conclusion: **treat every `uii_setpalette()`/`uii_setpalettecolor()` call as "commits sometime in
  the next unknown-but-probably-small number of frames," never as "commits at this exact raster
  line" or even reliably "commits within this exact frame."** This rules out any per-scanline or
  per-character-row palette trick (the classic "more than 16 colours on screen via raster-split
  palette tricks" idea) — there's no synchronization primitive exposed to make that safe. It does
  **not** rule out anything that only needs "eventually consistent within a fraction of a second,"
  which covers every use in §5 and §6: full-screen colour holds, slow gradient sweeps, and
  scene-to-scene transitions.
- Practical cadence: for the Palette Morph scene, update at most a few times per second (e.g. every
  10–20 frames = roughly 5–2.5 updates/sec at 50 Hz), not every frame — this keeps the visible
  motion smooth to the eye (colour sweeps read fine at that rate) while giving the command queue
  comfortable slack rather than racing it.
- Before returning control anywhere the stock palette is assumed — end-of-demo cleanup in
  `main.c` (the existing `vic.color_border = VCOL_LT_BLUE; vic.color_back = VCOL_BLUE;` block just
  before `return 0`) and any error-exit path — a changed palette must be explicitly restored with
  `uii_resetpalette()` first. A custom palette persists past program exit (it's an ARM-firmware/VIC
  LUT state, not something BASIC or the KERNAL resets), so without this, "index 14" no longer
  means the stock light-blue after this demo runs, silently breaking whatever runs next on the
  machine. This is a correctness requirement, not a nice-to-have, and should gate any palette work
  going in at all — it needs to run on *every* exit path (normal end screen, both hardware-check
  `screen_error_exit()` early-outs, and ideally the NMI-triggered RESTORE-key path too, though the
  current NMI handler is a no-op stub so that last one is an existing gap unrelated to this plan).

### Is more possible than "between full frames"?

Two things worth flagging, neither is a full mid-screen raster trick but both go a bit further
than "only between scenes":

- **`uii_setpalettecolor()` (single-index update, 6-byte command) is cheaper per-call than the
  full 48-byte `uii_setpalette()`.** For an effect that only needs to sweep one or two colour
  indices (e.g. just the "outside the set" gradient colours in `mandel.c`, leaving the other 14
  indices alone), issuing several small single-colour updates spread across a scene's frame budget
  is lower command-queue pressure than repeatedly pushing all 16. Still subject to the same
  no-raster-guarantee above, but it lowers the data volume per update, which likely lowers
  worst-case latency too (untested — flag as something to actually measure on hardware once this
  is built, e.g. by toggling a border colour immediately before/after the UCI round-trip and
  eyeballing how many frames the border stays "busy").
- **A full-screen colour cycle across an entire scene's runtime (not just a transition) is
  plausible** — e.g. `mandel.c` doing a slow continuous 10–20-frame-interval sweep of its gradient
  colours for the scene's whole duration rather than only at scene-boundary. That's still "between
  frames" in the sense that no single call needs to land on a specific raster line, but it's a
  bigger claim than "one swap at a transition point" and is worth prototyping early (§7) rather
  than assuming it'll look smooth — 350 dot-crawl-free MC pixels changing hue underneath a static
  fractal render could look great or could look like flicker depending on how the ARM-side commit
  latency actually distributes in practice, and that's only answerable on real hardware.

---

## 7. Required guardrails before writing any palette code

1. **Runtime capability detection, not a firmware-version assumption.** The palette commands are
   shipped in released firmware (3.15/3.15a — see the correction in §1), so this is no longer
   about hedging against an unreleased feature; it's the same reasoning already applied to REU and
   Audio elsewhere in this codebase — some users will still be on pre-3.15 firmware, and detection
   is cheap. Detect at startup (e.g. attempt `uii_getpalette()` and check `UII_SUCCESS`/the status
   byte, the same pattern `detect_uci()`/`detect_audio()` already use for optional hardware) and
   fully skip the Palette Morph scene — falling back to something else, or simply omitting it from
   the sequence — when unavailable. Never gate on a version string; gate on the command actually
   working.
2. **Always pair a palette change with a guaranteed reset on every exit path** (see §6's timing
   section) — this is the one item in this whole plan that can leave the machine in a worse state
   than before the demo ran if skipped.
3. **Measure real hardware latency before committing to a specific update cadence.** The 10–20
   frame interval suggested in §6 is a reasoned starting point, not a measured constant — this
   project has MCP tooling (`mcp__ultimate64__*`) that can drive a real U64 directly, which should
   be used to prototype the timing empirically rather than guessing further in a planning doc.
4. **Update `UCILIBMANUAL.md`** (this project's copy) with the ported command wrappers, their wire
   formats, and the "unreleased firmware feature, detect at runtime" caveat, mirroring how
   `TURBOCONTROLMANUAL.md` documents the turbo API today — so this plan's research doesn't have to
   be re-derived from scratch later.

---

## 8. Suggested implementation order

1. ~~§2 — ship the `.cfg`~~ **DONE, 2026-09-14.**
2. ~~§3 — port `uii_enable()`/unlock sequence into `detect_uci()`~~ **DONE, 2026-09-14** (the
   broader `CTRL_CMD_*` header sync was deliberately deferred to step 4 below, not done here).
3. ~~§4 — condensed detection screen~~ **DECIDED, 2026-09-14: no change.** User opted to keep the
   full itemized screen + required keypress as-is; see §4's decision note.
4. ~~§7.1 — capability-detection plumbing for the palette commands~~ **DONE, 2026-09-14.**
   `CTRL_CMD_GET/SET/SET_COLOR/RESET_PALETTE` + `UCI_PALETTE_COLORS`/`BYTES` and the four
   `uii_*palette*()` wrapper functions ported into `ultimate_common_lib.h`/`.c` (no attribution
   comment, per the correction above). `detect_palette()` added to `detect.c`/`.h` (read-only
   probe: `uii_getpalette()` + `UII_SUCCESS` check, same pattern as `detect_uci()`/`detect_audio()`)
   and wired into `main.c`'s detection screen as a new non-blocking "Palet" line, right after Audio.
   Build verified clean; hardware-verified on the live U64E2 (screen/color RAM decode + user
   screenshot): `Palet : [ OK ] UCI palette OK`. Confirms the palette commands genuinely work on
   this specific installed firmware, not just in theory from source-reading.
5. §5/§6 — palette wrappers + the tunnel/mandel work + the new Palette Morph scene, gated behind
   #4's detection, once §7.3's hardware timing prototype confirms the update cadence looks good on
   real hardware. **Not started — deliberately deferred past this session** (approaching a
   week-long gap; this is the riskiest item to leave partially built, since it needs real-hardware
   prototyping before the design is even settled).

Items 1–4 are done and hardware-verified. Item 5 rests on firmware that's actually shipped
(3.15/3.15a) — the only remaining open question is the update-cadence timing in §6/§7.3, which
needs a real-hardware measurement. **Pick up at item 5 next session.**

---

## 9. Unplanned fix found and made this session: Turbo speed display

Not part of the original plan — found while testing §8 item 4 on hardware, and directly relevant to
this plan's hwinfo-string research (§1), so recorded here rather than left undocumented.

**Bug:** `main.c`'s Turbo detection line could show a bare "Turbo" instead of an actual MHz figure.
Root cause: `turbo_detect()` (`include/turbo.c:67`) resets `$D031` back to 1 MHz before returning
(documented, intentional — "restore original speed settings to avoid side effects"), but `main.c`
then read `turbo_get()` *after* that reset to pick a sub-speed label for the `TURBO_48MHZ`
classification branch — always reading index `0`, which matches none of the hardcoded cases, always
falling through to the generic "Turbo" text. That branch was dead code from the day it was written.
It only went unnoticed because the CIA-TOD timing measurement usually classifies genuinely-64MHz
hardware as `TURBO_64MHZ` (a different code path that doesn't read `turbo_get()` at all and always
correctly shows "64 MHz") — but on one test run this session, the *same* Ultimate 64-II measured
into the `TURBO_48MHZ` bucket instead, exposing the dead branch. Confirmed by the user on-screen.

**User's insight, directly applicable:** since `CTRL_CMD_GET_HWINFO`'s product-name string
("Ultimate 64" / "Ultimate 64 Elite" = 48MHz-class; "Ultimate 64-II" = 64MHz-class) is a
compile-time-fixed hardware-identity fact — confirmed via `gh search code`/`gh api` against
`GideonZ/1541ultimate`: `software/system/product.cc`'s `product_name[]` table (exactly seven
entries: Ultimate, Ultimate II, Ultimate II+, Ultimate II+L, Ultimate 64, Ultimate 64 Elite,
Ultimate 64-II — no separate Commodore 64 Ultimate/C64U entry anywhere in the repo, so C64U likely
reports as "Ultimate 64-II" too, unconfirmed on real C64U hardware), unchanged since a 2025-01-06
refactor commit, **long predating firmware 3.15** — it's a far more reliable source for MHz
classification than a real-time benchmark, which is subject to run-to-run jitter as just
demonstrated.

**Fix implemented, scoped to `main.c` only:** the Turbo detail branch now calls `uii_get_hwinfo(0)`
again and checks the returned string for `"64-II"` (via a small identity-charmap raw-ASCII pattern,
`hwtype_64ii[]`, needed for the same reason `mod_file`/`demo_path` already do this — `petscii.h`'s
charmap transforms *all* string literals at compile time, and `uci_to_upper()`'s output is raw
ASCII, so a charmap-transformed literal wouldn't match it; caught this exact bug in the first pass
of this fix via the same hardware-verify-don't-assume discipline, before it shipped). Falls back to
the old `TURBO_64MHZ` timing classification if the hwinfo query itself fails. Hardware-verified
twice: first confirmed the bug existed by decoding screen RAM, then confirmed the fix (both the
charmap-bug-yielding-wrong-"48 MHz" intermediate version, and the corrected version showing "64 MHz")
via repeated deploy/run/decode cycles, cross-checked against a screenshot from the user.

**Deliberately not done, per user's own question and my answer to it:** `turbo_detect()`/`turbo.c`
itself was left untouched. Its CIA-TOD measurement still serves a real, distinct purpose the hwinfo
string cannot replace — confirming turbo is *actually engaged right now* (a live register/config
fact), not just what MHz ceiling the board model supports (a static fact). hwinfo answers "what
could this reach if turbo engages"; the timing test answers "did it actually engage" — both are
genuinely needed for an honest OK/FAIL badge, since a register write can "succeed" (readable back)
even when the firmware's own Turbo Mode menu setting isn't honoring it. **Follow-up opportunity,
not done:** `turbo_detect()`'s two-threshold (`THRESHOLD_FAST`/`THRESHOLD_SLOW`) classification
could likely collapse to a single "accelerated or not" threshold now that `main.c` no longer needs
its fine-grained output — probably also more robust (single wide guard-band vs. two thresholds that
can misclassify, exactly as observed). Not done this session because `turbo.c`/`.h` is a shared
library file also used by `mandelbrot-upic`, `heartbeat-demo`, and `UBoot64-v2` — a behavior change
there has cross-project blast radius and deserves dedicated time, not a rushed fit into this
session's remaining budget before the week-long gap.
