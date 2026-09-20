# Emulator smoke test (UE2-C64U-Emulator)

Headless functional smoke test for this project against
[UE2-C64U-Emulator](https://github.com/Jondalar/UE2-C64U-Emulator), which
emulates the actual Ultimate 64 hardware model (UCI, REU, turbo, Ultimate
Audio DMA) by running the real firmware app code — not a generic C64
emulator. Confirmed 2026-09-18 against both U64E2 firmware 3.15a and C64U
firmware 1.1.0.

## What's tested

`smoke-paltest.ctl` drives `build/paltest.prg` — the standalone Palette
Morph test harness (`src/test_palette.c`: UCI enable, `turbo_fast()`,
`palette_morph_run()`, skips the hardware-detection screen and gears
scene entirely). It deliberately does NOT drive the full `udemo2026.prg`:
that binary's hardware-detection screen calls `turbo_detect()`
(`include/turbo.c`), a benchmark-based busy loop (two
`benchmark_delay(1000)` calls, ~7s worst-case each at real 1MHz-equivalent
speed per `THRESHOLD_DETECT`) that was found to take excessively long
against this emulator build — still running after ~3 minutes wall-clock
at 99% CPU (not deadlocked, just far slower than expected; not
root-caused further, flagged as a known gap rather than worked around).
`paltest.prg` never calls `turbo_detect()`, so it avoids this entirely
while still exercising UCI, turbo, and the full palette-morph scene
(the idi8b logo, per-scanline raster ink, UCI hue cycling, and the
palette-driven fade-out).

## Result summary (2026-09-18)

| Firmware | Result |
|---|---|
| U64E2 3.15a | Full pass: logo scene renders, `palette_morph_run()` completes its loop, clean return to BASIC (`READY.`) |
| C64U 1.1.0 | Graceful no-op: UCI unlock isn't supported pre-3.15, so `uii_detect()` times out after ~10s (`cia1.tods < 10` in `test_palette.c`) and `palette_morph_run()` is correctly never called — no hang, no crash, just the harness's own fallback border/background colour. Confirmed via the two screenshots being byte-identical (nothing ever drew), versus U64E2's two screenshots differing (real progression). |

## Prerequisites

- `UE2-C64U-Emulator` built (`cargo build --release -p ue2emu`) — needs `libslirp` (`apt install libslirp-dev` normally; this session built it from source into a user prefix when apt wasn't available, see the earlier investigation's notes).
- A `roms/` directory with `kernal.bin`, `basic.bin`, `characters.901225-01.bin` (renamed from a standard 1541ultimate ROM set), **and a copy/symlink of `characters.901225-01.bin` also named `chars.bin`** — the `--c64-roms` flag and the `.ctl` script's own `png` font loader expect different filenames for the same file.
- The firmware `.ue2` update file itself (pass straight to `--firmware`; no separate `install` step needed — `ue2emu run --firmware some.ue2` accepts it directly).

## Running it

```sh
export LD_LIBRARY_PATH=/path/to/libslirp/lib:$LD_LIBRARY_PATH   # only if not apt-installed

cd /home/xahmol/git/UltimateDemo2026
make paltest   # build/paltest.prg

USB=/tmp/ue2-smoke-usb   # or wherever
mkdir -p "$USB/idi8b/ultdemo2026"
cp build/paltest.prg "$USB/idi8b/ultdemo2026/"

/path/to/ue2emu run --headless --speed max \
  --firmware <path-to-firmware.ue2> \
  --roms <path-to-roms-dir> \
  --flash /tmp/ue2-smoke-flash.bin \
  --c64-roms <path-to-roms-dir> \
  --usb-dir "$USB" --usb-dir-work /tmp/ue2-smoke-work \
  --script tests/emulator/smoke-paltest.ctl
```

Produces `run/paltest-logo.png` and `run/paltest-ready.png` (paths are
relative to wherever `ue2emu` is invoked from, not this project — the
script's `png` lines can be edited to an absolute path if that's
inconvenient). Compare them (`cmp` is enough for a smoke pass/fail; open
them to actually look at the logo) — different on a real pass, identical
if UCI never came up (e.g. against pre-3.15 firmware).

Re-run once per firmware variant you want to check (U64E2 and C64U), each
with its own `--flash`/`--usb-dir-work` scratch paths so runs don't
interfere with each other.

## UPDATE (2026-09-18): the `turbo_detect()` "hang" above was a missing-config artifact, not an emulator bug — the full demo DOES work

Confirmed via the emulator repo's own `docs/status/xander-tests.md` — the
maintainer's own survey, run **against this exact project**
(`UltimateDemo2026 v1.0.1`, 2026-09-16, second pass, TRX64 0.7.1 pin).
Full detection screen, verbatim from that log:

```
  UCI   : [ OK ]  UCI Ok
  Type  : ultimate 64-ii
  REU   : [ OK ]  16 MB
  Turbo : [ OK ]  64 MHz
  Audio : [Fail]  Module not found
```

`turbo_detect()` completes fine — the gears scene reaches "64 MHz ULTIMATE
SPEED!!" by 20s emulated, matching real-hardware behaviour, and the whole
demo runs through to the scroller (Audio is the only failure, a genuine
emulator gap — see below — and it doesn't block the demo, which
continues silently).

**The fix needed no menu navigation and no CLI flag for REU/turbo at
all**: the maintainer's run used `Run` from the file browser on
`udemo2026.prg` sitting *next to its shipped `udemo2026.cfg`*
(`config/UltimateDemo2026-U64E2.cfg` in this repo, auto-deployed by
`make deploy`/`make zip` under the same base name as the `.prg`). That
file is:

```ini
[U64 Specific Settings]
Turbo Control=U64 Turbo Registers
CPU Speed=16
Badline Timing=Enabled

[C64 and Cartridge Settings]
RAM Expansion Unit=Enabled
REU Size=16 MB
Map Ultimate Audio $DF20-DFFF=Enabled
Command Interface=Enabled
```

Firmware 3.15+ auto-loads a same-named `.cfg` when a `.prg` runs
(`CTRL_CMD_LOAD_CONFIG` over UCI) and applies every setting in it —
REU, turbo, Command Interface — in one shot, no F2 menu required. This
is confirmed working in the emulator exactly as designed. **The earlier
"hang" almost certainly happened because that test's `--usb-dir` didn't
include the matching `.cfg` next to the `.prg`** (only `paltest.prg` was
staged, which has no `.cfg` and doesn't need one since it calls
`turbo_fast()` directly, skipping `turbo_detect()` and REU detection
entirely) — with REU/turbo left at their flash defaults (REU disabled),
`turbo_detect()`'s benchmark loop was measuring genuinely-unaccelerated
1 MHz-equivalent speed, which is slow but should still finish in a few
seconds per its own code comment, not exceed 3 minutes — the remaining
gap between "REU/turbo off" and "3+ minutes, still running" was never
fully explained and is worth a real re-test (see below), but the
"is this an emulator bug" question is answered: **no**, per the
maintainer's own successful run of this identical binary.

**To smoke-test the full `udemo2026.prg` (not just `paltest.prg`)**:
stage the whole `make zip`/`make deploy` output tree as the `--usb-dir`
(`idi8b/ultdemo2026/` with `udemo2026.prg` AND `udemo2026.cfg` AND
`4ev.mod` together, not just the `.prg` alone), matching the maintainer's
own recipe:

```sh
cd /home/xahmol/git/UltimateDemo2026
make            # build/udemo2026.prg + build/idi8b/... zip staging tree

/path/to/ue2emu run --headless --speed max \
  --firmware <path-to-firmware.ue2> --roms <path-to-roms-dir> \
  --flash /tmp/ue2-full-flash.bin --c64-roms <path-to-roms-dir> \
  --usb-dir build/idi8b --usb-dir-work /tmp/ue2-full-work \
  --script <a .ctl that browses to and Runs udemo2026.prg>
```

This has not yet been re-run end to end in this project's own test setup
to get a fresh, first-party confirmation (the finding above is from
reading the emulator repo's own survey doc, not a new run performed
here) — worth doing before relying on it unattended.

## Configuring machine settings (REU/turbo/etc.) without the overlay menu

**Short answer: for THIS project specifically, you don't need to** — see
above, the shipped `.cfg` auto-load does it. For other cases (a program
with no auto-load config, or testing raw hardware-detection behaviour
against an unconfigured machine on purpose), `ue2emu run`/`install` have
**no CLI flags for REU size, turbo mode, or Ultimate Audio** — checked
`ue2emu run --help`/`ue2emu install --help` directly (2026-09-18, same
release build as above). Those are firmware-side persistent settings
(the "C64 and Cartridge Settings" / "Memory Configuration" config store
written to flash, `docs/hw/06-spi-flash-config.md` /
`docs/status/reu.md`), not emulator launch parameters — same as on real
hardware, where they're also set once through the firmware menu, not a
command-line switch.

If you do need to configure them via the menu (scripted, not
interactive), `docs/status/reu.md` gives the maintainer's own **verified**
recipe: the config browser's cursor skips blank separators and typed
letters don't seek, so navigate with `down` alone — `F2`, `down`×4 reaches
"Memory Configuration", `right` enters it, `down`×4 reaches "RAM
Expansion Unit". (Verified there against real firmware in this exact
emulator; the analogous path for Turbo Mode inside the same "Memory
Configuration"/"C64 and Cartridge Settings" screens wasn't separately
re-verified here — same submenu, different row, per this project's own
`CLAUDE.md`: "F2 → C64 settings → REU" and "Turbo Mode → U64 Turbo
Registers".) Once saved, the flash image carries the setting for every
future run with `--flash` pointed at that same file — build one seed
image this way, then reuse (copy) it per test run rather than
reconfiguring from scratch each time.

## C64U configuration (2026-09-18)

**C64U 1.1.0's overlay has an extra menu layer that U64E2 3.15a doesn't.**
Pressing `button` on C64U lands on a top-level category list (`DISK FILE
BROWSER`, `COMMOSERVE FILE SEARCH`, `MEMORY & ROMS`, `TURBO BOOST`, `VIDEO
SETUP`, ...) rather than the device browser directly. All of this
project's working `.ctl` scripts (`smoke-paltest.ctl` included) were
written against the U64E2 shape and skip straight to `down`×3/`right`×3
assuming the device browser (`SD`/`Flash`/`Temp`/`USB0`) is already
showing — on C64U that same `down`×3 instead lands inside `TURBO BOOST`
(confirmed via the emulator's own log: `State Turbo Settings reloaded. #
of children = 4`), and the run silently does nothing useful. **Fix:**
press `key return` once, right after `button` (with its own settle wait),
to enter `DISK FILE BROWSER` first — after that the device list and
directory navigation are identical in shape to U64E2 (confirmed via a
step-by-step `screen`-dump probe: `SD`/`Flash`/`Temp`/`USB0`, cursor on
`SD`, same `down`/`right` conventions, same Run/Load/DMA/View/Rename/
Delete context menu).

This means the **`C64U 1.1.0: graceful no-op` row in the Result Summary
above is now suspect** — it was produced by `smoke-paltest.ctl`, which
lacks the extra `return` and likely never reached `paltest.prg` at all
(same silent-no-launch failure, not necessarily proof of anything about
`uii_detect()`'s own timeout behaviour). Retested here with the
corrected navigation, using a minimal `uii_enable()`/`uii_detect()`/
`uii_get_hwinfo()`-only probe program (no REU/turbo dependency, to
isolate the UCI question specifically) against a **freshly-erased**
C64U 1.1.0 flash: the file browser's `Run` action was reached
correctly (context menu confirmed via `screen` dump, `Run` highlighted
first), but the C64 screen goes black for a couple of seconds and then
reverts to a plain `**** COMMODORE 64 BASIC V2 ****` boot banner within
~7s — indicating a reset back to BASIC rather than the probe program's
own screen (which should still be showing, blocked on a keypress, even
in its worst case UCI-not-detected path). **Inconclusive**: this looks
like either a C64U-specific `Run`/DMA-load reliability gap in this
emulator build, or a genuine crash in the probe on this firmware —
not yet distinguished, and not chased further here (out of scope for
this pass; flagging as an open question rather than a confirmed
finding). What IS now confirmed: the previous "UCI unlock isn't
supported pre-3.15" conclusion should be treated as **unverified**
until re-tested with the corrected navigation and a probe run that's
confirmed (via a `screen`/`c64screen` dump immediately after launch) to
have actually reached user code.

**No CLI/config-file path exists for C64U either** — same answer as the
general section above. `ue2emu run --config <FILE>` is a TOML file of
the *emulator's own* CLI flags (firmware path, ROMs dir, speed, etc.),
not a way to inject the C64U's REU/turbo/UCI settings; `ue2emu run
--help` confirms there's still no flag for those. `ue2emu run` does have
`--no-overlay-ui` ("do not seed the overlay user interface into blank
flash config") — implying a **blank** flash gets the overlay UI
auto-seeded by default, which is unrelated to REU/turbo/UCI state but
worth knowing if a bare/no-UI boot is ever wanted.

**Practical recommendation for C64U** (mirrors the U64E2 approach): seed
one flash image once via the corrected menu navigation above (or
interactively), save it, and reuse it (`cp`) as the `--flash` base for
every subsequent C64U test run — same pattern as
`flash_u64e2_run5.bin` for U64E2. Note this only carries
REU/turbo/audio persistent settings forward; per the project's own
firmware-maintainer forum thread (lemon64), C64U firmware doesn't yet
auto-load `config/UltimateDemo2026-C64U.cfg` by filename the way
U64E2 3.15+ does — that file still has to be applied via the overlay's
"Load Settings from File" menu action manually, on both real hardware
and in this emulator, until a future C64U firmware adds the same
auto-load-by-filename behaviour 3.15+ has.

## C64U headless config: resolved (2026-09-19)

Follow-up to the two open questions above (the `Run`/DMA-load reset, and
whether config can be set headlessly on C64U at all). Both are now
resolved, using a fresh probe (`probe.c`, a standalone `uii_enable()`/
`uii_detect()`/`CTRL_CMD_LOAD_CONFIG` test — never a project file) and a
from-scratch settings-menu walkthrough, both against a freshly-erased
C64U 1.1.0 flash.

### The `Run`/`Load`-then-reset-to-BASIC symptom is real, and it's a menu-exit bug, not a launch-reliability gap

Retested `Run` (previous inconclusive finding) and separately tried
`Load` instead — **both fail the same way, and the emulator's own log
proves why.** Selecting `Load` on `probe.prg` logs:

```
Action set was: Load
PRG Select: 2202
DMA Load.. probe.prg
About to execute a command in subsys C64 Machine (...)
Failed to load KERNAL ROM; loading default.
...
U64 reset handler. Resetting Settings
...                                          <- reset #1: boot_cart (type 41, 1272 bytes) reinitialized — normal
___________________________________________________________Failed to load KERNAL ROM; loading default.
...
Cartridge definition: Name: None Type: 0 Custom: 00000000 (Length: 0)
...
U64 reset handler. Resetting Settings
...
Object level 1 returned -2.
MENU HIDE / EXIT.
```

The DMA load genuinely happens (data lands in C64 RAM — the earlier
"PROBE" string briefly visible via `c64screen` was real), but it's
followed by **two** consecutive machine resets: one to reinitialize the
boot cart (expected), then immediately a second reset to a blank
`Type: 0` cartridge, coinciding with `MENU HIDE / EXIT`. That second
reset is what wipes the freshly-loaded program before it ever executes,
landing back at plain BASIC `READY.` within ~3s. This reproduces
identically for `Run` and `Load`. Not chased further (fixing an
emulator-internal reset-ordering bug is out of scope here) — logged as a
known limitation: **don't rely on launching a `.prg` via the C64U
overlay's file browser in this emulator build; it won't reach `main()`.**
This blocks avenue 1 (`CTRL_CMD_LOAD_CONFIG` issued from a running C64
program) — the probe never gets far enough to call `uii_enable()`, so
that avenue is **untested and unusable** here, not confirmed unsupported.

### Confirmed (2026-09-19): the Run/Load reset bug also blocks the REAL demo, not just the tiny probe

Retested with `udemo2026.prg` itself (37 KB, not a minimal probe) against
a properly-configured C64U flash (the avenue-3 recipe below, `flash
-final3.bin`), staged next to its `.cfg`/MOD file exactly like a real
deploy. Navigated `button` → `key return` (DISK FILE BROWSER) →
`down`×3 → `right` (USB0) → `return`×2 (Enter into `idi8b`, then
`ultdemo2026`) → `down`×4 → `return` (opens Run/Load/DMA/View/Rename/
Delete context menu on `udemo2026.prg`, confirmed via `screen` dump
showing the menu box aligned with that exact row) → `return` (selects
`Run`, the default-highlighted option).

The emulator's own log is unambiguous:

```
Action set was: Run
PRG Select: 2201
DMA Load.. udemo2026.prg
...
Begin of cart init: Type: 41. REU: 01. REU_SZ: 07, UCI: 01 (DF18), ...   <- reset #1, expected
...
Cartridge definition: Name: None Type: 0 ... (Length: 0)
Begin of cart init: Type: 00. REU: 01. REU_SZ: 07, UCI: 01 (DF18), ...
...
Object level 1 returned -2.
MENU HIDE / EXIT.                                                        <- reset #2, unexpected
```

`c64screen` (the actual emulated display, as opposed to `screen`'s
overlay-menu dump) polled every 2s for 22s afterward shows nothing but
plain `**** COMMODORE 64 BASIC V2 ****` / `READY.` the whole time —
`main()` never runs, `detect_uci()`'s own screen never appears. **This
is not a probe-specific artifact**: the same two-reset sequence, at the
same point (menu-exit), reproduces byte-for-byte with a real 37 KB
program. Confirms the bug is in the C64U overlay's own Run/Load
menu-exit handling (independent of what was loaded), not anything about
program size, memory footprint, or content. **Practical conclusion:
this emulator build cannot currently be used to smoke-test `udemo2026
.prg` (or anything else) via the C64U overlay's file browser at all** —
U64E2 remains the only firmware variant this project can headlessly
smoke-test end-to-end in this emulator today. Worth filing upstream
(the maintainer offered on the lemon64 forum thread to look into a
detailed report) rather than working around further here.

### Avenue 3 (scripted settings-menu navigation) works — full recipe, verified end-to-end including flash persistence

The `docs/status/reu.md` recipe (`down`×4 → "Memory Configuration" →
`right` → `down`×4 → "RAM Expansion Unit") is for U64E2's shape, which
has no top-level category screen. For **C64U**, the equivalent settings
all live on one screen reachable via `MEMORY & ROMS`:

1. `button` → top-level category list.
2. `key down` ×2, `key right` → enters `MEMORY & ROMS`. Screen:
   `Kernal ROM / BASIC ROM / Character ROM / Cartridge / (blank) / RAM
   Expansion Unit / Size / (blank) / Command Interface / Ultimate Audio /
   (blank) / Drive A / ...` — cursor starts on `Kernal ROM`, and (as
   `reu.md` notes for U64E2) `down` skips blank separator rows.
3. `key down` ×4 from the top of that list lands on **RAM Expansion
   Unit**. `key return` opens an `Enabled`/`Disabled` popup (cursor
   starts on the current value); `key down`, `key return` selects
   `Enabled`. Cursor returns to the `RAM Expansion Unit` row afterward
   (does **not** auto-advance).
4. `key down` ×1 → **Size**. `key return` opens a `128 KB`…`16 MB`
   popup, cursor starts on the current size (`2 MB` by default — 3
   `down`s reaches `16 MB`); `key return` selects it.
5. `key down` ×1 → **Command Interface**. `key return` → popup →
   `key down`, `key return` → `Enabled`.
6. `key down` ×1 → **Ultimate Audio**. Same pattern → `Enabled`.
7. **Must explicitly back out and confirm to persist** — this is the
   part that's easy to miss and silently lose all changes: `key left`
   at the settings list triggers a `Save changes to Flash? Yes / No`
   popup (cursor defaults to `Yes`); `key return` confirms. The
   emulator log then shows `Writing config store 'C64 and Cartridge
   Settings' to flash..Page: 3 done.` — that line is the only reliable
   confirmation the write happened. Simply making the changes and
   `quit`-ing the emulator (or backing out without confirming, e.g. a
   second `key left` inside the dialog instead of `key return`)
   **discards them** — verified by relaunching against the same
   `--flash` file and finding all four settings back at
   `Disabled`/`2 MB` defaults.
8. **Persistence verified**: relaunching a third time against the saved
   flash image (no `--c64-roms`, no erase) and re-navigating to
   `MEMORY & ROMS` shows `RAM Expansion Unit: Enabled`, `Size: 16 MB`,
   `Command Interface: Enabled`, `Ultimate Audio: Enabled` — all four
   survived the restart.

This is the full, confirmed-working, scriptable recipe for headlessly
reproducing `config/UltimateDemo2026-C64U.cfg`'s settings on C64U 1.1.0
in this emulator (Turbo Mode/CPU Speed, under the separate `TURBO BOOST`
top-level category, wasn't re-walked step-by-step here but follows the
identical popup-and-confirm pattern). **Bottom line: avenue 3 is the
answer for C64U** — build one seeded flash image this way, `cp` it as
the `--flash` base for every subsequent C64U smoke-test run, exactly as
already recommended above for the pre-this-finding state. Avenue 1
(UCI `CTRL_CMD_LOAD_CONFIG`) remains an open question for C64U, blocked
by the Run/Load reset bug above, not by any confirmed lack of firmware
support. Avenue 2 (direct flash-image binary manipulation) was not
investigated — unnecessary now that avenue 3 has a confirmed recipe.

## Retested 2026-09-19 against emulator v0.3.3 (S21, `--settings`): issue #1 still reproduces

Pulled two new upstream commits (`b10542b` "core: firmware settings from
a .cfg file (S21)", `d452121` "Release 0.3.3") and rebuilt. S21 adds
`ue2emu run --settings FILE.cfg`, which writes firmware settings into
the flash's config pages before boot, reading the firmware's own native
`.cfg` text format — this project's own
`config/UltimateDemo2026-C64U.cfg` is already in exactly that format.

**This genuinely replaces avenue 3's manual settings-menu walkthrough.**
Booting a fresh C64U 1.1.0 flash with
`--settings config/UltimateDemo2026-C64U.cfg` and no menu navigation at
all, the boot log shows the settings applied and taking effect
immediately:

```
settings: [U64 Specific Settings] Turbo Control=C64U Turbo Registers
settings: [U64 Specific Settings] CPU Speed=16
settings: [U64 Specific Settings] Badline Timing=Enabled
settings: [C64 and Cartridge Settings] RAM Expansion Unit=Enabled
settings: [C64 and Cartridge Settings] REU Size=16 MB
settings: [C64 and Cartridge Settings] Map Ultimate Audio $DF20-DFFF=Enabled
settings: [C64 and Cartridge Settings] Command Interface=Enabled
...
Begin of cart init: Type: 00. REU: 01. REU_SZ: 07, UCI: 01 (DF18), Mode: 04, Sampler: 01
```

`REU: 01` / `UCI: 01` right at the first cart init, with zero menu
interaction — the whole avenue-3 recipe above (steps 1-8) is no longer
needed to get a correctly-configured C64U flash. One correction to the
recipe above while retesting: entering a **directory** in the file
browser (`idi8b`, then `ultdemo2026`) is itself two keypresses, not one —
`key return` first opens that row's own `Enter / Rename / Delete`
context menu (confirmed via a `c64screen` capture showing the popup
aligned on the directory's row), and a second `key return` selects
`Enter` to actually descend. This was previously masked because two
directories in a row (`idi8b` then `ultdemo2026`) happened to need
exactly two `key return` presses each anyway; it only became visible
retesting step by step. The down×4-to-select-the-file step must come
**after** actually being inside the target directory, not before.

**Issue #1's bug is unaffected by S21 and still reproduces exactly as filed.** Corrected full navigation, `button` → `key return`×2 (into
`idi8b`) → `key return`×2 (into `ultdemo2026`) → `key down`×4 (highlight
`udemo2026.prg`) → `key return` (opens its Run/Load/DMA/View/Rename/
Delete context menu) → `key return` (selects `Run`, the
default-highlighted option) — against the S21-configured flash:

```
Action set was: Run
PRG Select: 2201
DMA Load.. udemo2026.prg
...
Begin of cart init: Type: 41. REU: 01. REU_SZ: 07, UCI: 01 (DF18), ...   <- reset #1, expected
...
Cartridge definition: Name: None Type: 0 ... (Length: 0)
Begin of cart init: Type: 00. REU: 01. REU_SZ: 07, UCI: 01 (DF18), ...
U64 reset handler. Resetting Settings
MENU HIDE / EXIT.                                                        <- reset #2, unexpected
```

`c64screen` afterward (immediately, +5s, +15s) shows only
`**** COMMODORE 64 BASIC V2 ****` / `READY.` throughout — byte-for-byte
the same failure as the original report. **Conclusion: S21 is a real,
useful fix for the settings-configuration problem (avenue 3 is now
obsolete — `--settings` replaces it), but it is unrelated to and does
not fix the Run/Load menu-exit double-reset bug filed as
[issue #1](https://github.com/Jondalar/UE2-C64U-Emulator/issues/1).
That issue is still open and still valid as filed.**

## Retested 2026-09-19 against emulator v0.3.4: issue #1 is FIXED

Updated the local checkout to release **v0.3.4** (commit `3c75f24`,
includes `1b7c427` "c64: the cartridge ROM where the firmware puts it
(issue #1)" — the maintainer's diagnosed fix: firmware 3.15 moved the
boot cartridge ROM to a new DDR address, and the emulator was only
serving it from the new address while pre-3.15 firmware lines (C64U
1.x, and real U64-II on 3.14) still copy it to the old one, so the DMA
load handshake never completed and a second unexpected reset wiped the
just-loaded program). Rebuilt with `cargo build --release -p ue2emu -p
ue2-mcp`; `ue2emu --version` confirms `ue2emu 0.3.4`.

Retested the exact repro (fresh flash, `--settings
config/UltimateDemo2026-C64U.cfg`, navigate to and Run the real 37 KB
`udemo2026.prg` via the file browser). Along the way, discovered the
`.ctl` script's `expect <text> [ms]` command (waits for the text to
appear on screen, instead of guessing a fixed `wait` duration) and the
`screen` command (a legible text dump of the overlay menu, unlike
`c64screen`'s PNG which renders the overlay's custom charset as
unreadable noise — only the actual C64 program screen renders legibly
via PNG). Using `expect` to gate every step eliminated a whole class of
intermittent misnavigation (a `return` sent before the previous
popup/transition had settled would occasionally get silently dropped
or land on the wrong popup item, e.g. `Delete` instead of `Enter` —
this was **not** navigation-recipe error, it was a genuine host-timing
race under `--speed max` headless; short **and** long fixed `wait`s
both hit it intermittently, `expect` did not).

Confirmed navigation recipe (each directory level needs **two**
`key return`s — the first opens that row's own `Enter`/`Rename`/`Delete`
popup, confirmed via a `screen` text dump showing the popup with
`Enter` already default-highlighted at the top; the second confirms
`Enter`):

```
button
expect "DISK FILE BROWSER"
key return                    # open DISK FILE BROWSER
expect "USB0"
key down / key down / key down
key return                    # open USB0's Enter popup
expect "Enter"
key return                    # confirm Enter -> into /USB0/
expect "idi8b"
key return                    # open idi8b's Enter popup
expect "Enter"
key return                    # confirm Enter -> into /USB0/idi8b/
expect "ultdemo2026"
key return                    # open ultdemo2026's Enter popup
expect "Enter"
key return                    # confirm Enter -> into the deploy folder
expect "config"
key down x4                   # config, 4ev.mod, README.md, udemo2026.cfg, udemo2026.prg
key return                    # open the .prg's Run/Load/DMA/View/Rename/Delete popup
expect "Run"
key return                    # confirm Run (default-highlighted)
```

Result — the bug is gone:

```
Action set was: Run
PRG Select: 2201
DMA Load.. udemo2026.prg
...
Begin of cart init: Type: 41. REU: 01. REU_SZ: 07, UCI: 01 (DF18), ...   <- reset #1, expected
..._Load address: 0801...Now loading...DMA load complete: $0801-$9B65
Resuming..
Null command.
Cart got disabled, now restoring.
Cartridge definition: Name: None Type: 0 ...
Begin of cart init: Type: 00. REU: 01. REU_SZ: 07, UCI: 01 (DF18), ...
MENU HIDE / EXIT.
```

That "Type: 0" cart-restore + `MENU HIDE / EXIT` looks identical to the
old bug's signature at first glance, but this time it's the *boot
cart's own normal restore-after-DMA-load step* (comes right after `DMA
load complete` and `Resuming..`), not a second unexpected machine
reset — and critically, `udemo2026.prg` itself now actually starts
executing immediately after: `c64screen` right after `MENU HIDE / EXIT`
shows

```
            UltimateDemo2026
Hardware Detection  v1.0.1-20260919-0920

Waiting for Ultimate firmware...
  UCI   : [ OK ]  UCI Ok
Checking REU...
  REU   : [ OK ]  16 MB
Checking turbo mode...
```

i.e. the demo's own boot screen, correctly detecting UCI and the 16 MB
REU from the injected `--settings` — not BASIC `READY.`. Confirmed
visually via `png` too (renders cleanly, unlike the overlay).

**Conclusion: v0.3.4 fixes issue #1.** `udemo2026.prg` now runs
correctly on C64U 1.1.0 via the file browser. Filed issue closed.

Side observation, not part of issue #1: the capture stayed on
"Checking turbo mode..." for the rest of the run (screenshots at +8s,
+15s, +25s after Run are byte-identical). Unconfirmed whether this is
the emulator not modeling the U64 turbo-speed registers the demo's
`turbo_detect()` polls for (a TRX64/emulator limitation, in the same
family as [[feedback_vice_no_ultimate]] — VICE not emulating Ultimate
hardware) or something else; not investigated further since it's
outside this issue's scope.

## `hw_info()` "Type :" line on emulated C64U (v0.3.4) — 2026-09-19

Investigated whether `uii_get_hwinfo(0)` on the emulator's C64U 1.1.0
firmware reports the same `"C64 Ultimate"` string previously confirmed
on real hardware (see project memory `project_firmware315_plan.md`:
"C64U hwinfo string confirmed 'C64 Ultimate'" — that confirmation was
on real hardware, not this emulator).

Method: reused the known-good `flash.bin` (C64U 1.1.0, seeded via
`--settings config/UltimateDemo2026-C64U.cfg`) and the confirmed
navigation recipe from the v0.3.4 retest above, but replaced the
post-`Run` capture step with ten `c64screen` calls spaced 50 ms apart
(the emulator's own `c64screen` command dumps PETSCII-to-ASCII text
directly to stdout — no `png`/font-resource dependency needed for this
kind of check).

Result: **the "  Type  : " line never appears at all**, in any of the
50 ms-spaced captures immediately after boot, nor after the demo has
settled and is stuck at "Checking turbo mode..." (confirmed still
absent even after 17.9 s of emulated runtime — no amount of extra wait
makes it appear). The captured sequence goes straight from

```
  UCI   : [ OK ]  UCI Ok
Checking REU...
  REU   : [ OK ]  16 MB
Checking turbo mode...
```

with no `Type` line in between, even though `src/main.c` (around line
182-188) unconditionally attempts to print it right after the UCI
check succeeds and *before* the REU check begins:

```c
uii_get_hwinfo(0);
if (UII_SUCCESS && uci_to_upper(detail, 24) > 0)
{
    cwin_put_string(&cw, "  Type  : ", COL_LABEL);
    ...
}
```

Since execution demonstrably reaches and passes the REU check
correctly, the `if` block above was evaluated and its condition was
false — i.e. `uii_get_hwinfo(0)` either failed (`UII_SUCCESS` false)
or returned an empty/unusable string on this emulator target for the
C64U machine type. This is a **silent no-op in the code**, not a
crash — the demo just skips the line and moves on, which is why no
earlier capture (all of which used 3s+-granularity `wait`s) ever
caught it: there was never a moment where it was present to catch.

### Follow-up — wire-level root cause, both firmware variants (2026-09-19)

Initial hypothesis was that this might be a C64U/3.14-generation-specific
gap (C64U 1.1.0 is built on the 3.14 firmware line, and its `.cfg` needs
a different `Turbo Control` key name than U64E2's, so *something* about
C64U's firmware surface genuinely differs). That hypothesis is now
**refuted**: `CTRL_CMD_GET_HWINFO` is a long-standing command, not a
3.15+ addition, and the real firmware source
(`software/io/command_interface/control_target.cc`, `device == 0`
branch) has no `#ifdef`/build-conditional guards at all — it's an
unconditional `strcpy(data, getProductString()); *status = &c_status_ok;`.

Built a standalone probe (`hwinfo_probe.c`, scratch-only, not committed)
that calls `uii_get_hwinfo(0)` — the same project function `main.c`
uses — and dumps the raw hex bytes of `uii_status[0..1]` and
`uii_data[0..1]` directly, instead of just the pass/fail boolean. Ran it
against **both** firmware variants in the emulator (fresh flash each
time, seeded via `--settings`, same USB layout, same `.ctl` navigation):

| Firmware | Result |
|---|---|
| C64U 1.1.0 | `S=00,00 D=00,00` — `uii_get_hwinfo FAILED (status)` |
| U64E2 3.15a | `S=00,00 D=00,00` — `uii_get_hwinfo FAILED (status)` (identical) |

Both status and data bytes come back as raw `0x00` — not the ASCII
`"00"` success code `UII_SUCCESS` checks for, and not any other value
either. Given `uii_readstatus()`/`uii_readdata()`
(`include/ultimate_common_lib.c`) initialize both buffers to empty and
only append bytes while `uii_isstatusdataavailable()`/data-available
status bits are set, an all-zero result means those bits were never
observed set at all — the emulator's UCI command channel never
signalled a response to this specific command, for either firmware.
(One early U64E2 run appeared to hang past a short capture window with
no output at all; re-run with a much longer window showed it was just
slower to reach the same `S=00,00 D=00,00` result, not an infinite
stall — same outcome, more polling iterations.)

This directly rules out both original leads (device=0 being a
3.15+-only addition; C64U's differing `Turbo Control` naming implying
differing UCI command support by generation) — the failure is
**identical and firmware-generation-independent**. Every other UCI
command exercised elsewhere this session (UCI detect, REU size query,
file-browser DMA load, `--settings` config injection) works correctly
against both firmware variants in this same emulator, which narrows the
gap specifically to `CTRL_CMD_GET_HWINFO`'s dispatch/handling.

**Superseded — see reconciliation below.** The "firmware-generation-
independent" observation held up, but "genuine UE2-C64U-Emulator gap,
full stop" was incomplete: the real trigger is narrower and was found
by reconciling this result against an earlier, contradictory success
from the same session.

### Reconciliation — the real trigger is `--settings` flash-seeding, not firmware or core dispatch (2026-09-19)

This session had *already* obtained a genuine, successful
`uii_get_hwinfo(0)` round-trip on U64E2 3.15a earlier the same day —
the real `udemo2026.prg` demo (not a standalone probe) printed
`Type : ultimate 64-ii` on screen and continued correctly into the REU
and turbo checks (`/tmp/ue2-test/latest4-run.log`, captured 2026-09-18
21:04, emulator at commit `edd5976`/v0.3.2 per `git reflog` — the repo
wasn't pulled to `d452121`/v0.3.3 until 2026-09-19 07:50). That directly
contradicts the "always empty, both firmwares" conclusion above, which
was captured the next morning against v0.3.4 (`3c75f24`). Bisected to
find out which was right:

| Emulator build | Flash seeding | `uii_get_hwinfo(0)` result |
|---|---|---|
| v0.3.2 (`edd5976`) | reused pre-seeded flash (old menu-navigation method) | **works** — `S=30,30 D=55,6C`, `"ULTIMATE 64-II"` |
| v0.3.3 (`d452121`) | fresh flash via `--settings config.cfg` | **hangs forever** — stuck inside `uii_sendcommand()`'s busy-wait, polling for the cmd-busy status bits to clear; never reaches the response at all |
| v0.3.3 (`d452121`) | reused pre-seeded flash (**not** `--settings`) | **works** — identical good result |
| v0.3.4 (`3c75f24`, current HEAD) | reused pre-seeded flash (**not** `--settings`) | **works** — identical good result |
| v0.3.4 (`3c75f24`, current HEAD) | fresh flash via `--settings config.cfg` | **fails silently** — `S=00,00 D=00,00` (this section's original result) |
| v0.3.4 (`3c75f24`), flash previously seeded via `--settings`, **rebooted a 2nd time without** `--settings` | same broken flash, no reseed | **still fails** — `S=00,00 D=00,00`, does not self-heal |

This isolates the trigger precisely: **a flash image seeded through the
`--settings` feature (S21, introduced in commit `b10542b`, "core:
firmware settings from a .cfg file", first released as v0.3.3) leaves
the UCI/control interface unable to complete a `CTRL_CMD_GET_HWINFO`
(device=0) round-trip — durably, written into the flash image itself,
not a one-time fresh-boot artifact.** Every other UCI command exercised
this session (detect, REU size, file-browser DMA load, and `--settings`
injection itself) keeps working fine against the very same
`--settings`-seeded flash; only this one command's response never
arrives. The *symptom* differs cosmetically by emulator version on such
a flash (v0.3.3: infinite hang in the busy-wait; v0.3.4: instant empty
response) but the trigger — flash state written by `--settings` — is
identical in both.

Both the original session's "Ultimate 64-II" success and this section's
"always empty, both firmwares" result were genuine, correctly-observed
data, not a misread or methodology error — they just tested different
flash-seeding paths without that variable being controlled for at the
time.

**Conclusion**: this is a genuine **UE2-C64U-Emulator regression**,
narrower than first thought — it is not firmware-independent in the
sense of "always broken everywhere," it is **`--settings`-seeding-path-
dependent**: any flash written by `ue2emu run --settings FILE.cfg`
breaks `CTRL_CMD_GET_HWINFO(device=0)` from that point on, regardless of
firmware (C64U or U64E2) or which subsequent emulator version boots it;
flash images configured the old way (manual menu navigation, or reused/
persisted across boots without `--settings`) are unaffected on every
version tested (v0.3.2 through current v0.3.4). Worth filing upstream
with this precise repro (a `--settings`-seeded flash + the
`hwinfo_probe.c` hex-dump probe, contrasted with the same probe against
a non-`--settings` flash on the identical binary) — this is much more
actionable for the maintainer than the original "GET_HWINFO returns
nothing" framing. Not filed yet — pending user decision. No change made
to `src/main.c` — the existing `if (UII_SUCCESS && ...)` guard already
degrades gracefully on real hardware too, so this remains purely a
testing-fidelity gap, not a correctness risk for the shipped demo. Note
this project's own emulator smoke-testing has used `--settings`
throughout since it was discovered (it's far more convenient than menu
navigation) — worth knowing that any *other* per-session UCI probing
done against a `--settings`-seeded flash could hit this same gap for
this one command, even though the demo itself only calls
`uii_get_hwinfo(0)` for a cosmetic detail line and degrades gracefully.

Filed upstream as
[issue #2](https://github.com/Jondalar/UE2-C64U-Emulator/issues/2).

### Follow-up (2026-09-19): maintainer couldn't reproduce — retested on v0.3.5, and via his exact launch method

Jondalar tried v0.3.4/v0.3.5, both firmwares, both CPU speeds, a minimal
and a full 207-setting `.cfg`, and a REST-launched probe
(`POST /v1/runners:run_prg` sending `04 28 00` right at start) — every
run got a valid answer. Retested to see whether either of the two
variables he used but we hadn't (v0.3.5, REST launch) explained the gap:

- **v0.3.5** (`e7e87e2`, checked out fresh, built locally): still fails,
  `S=00,00 D=00,00`, identical to v0.3.4. `git log v0.3.4..v0.3.5` shows
  only one unrelated commit (`0cf1302`, REU-enable-toggle survival), so
  this is expected.
- **REST launch** (`curl -X POST -F file=@hwinfo_probe.prg
  http://127.0.0.1:PORT/v1/runners:run_prg`, his exact method): tried
  against the same `--settings`-seeded flash, in place of the
  file-browser DMA-load `.ctl` script used throughout this
  investigation. **Still fails identically.** This rules out launch
  method as the explanation — the file-browser-vs-REST distinction isn't
  it.

So the trigger is still isolated to *how the flash was seeded*
(`--settings` vs. the overlay's own settings menu), not the firmware
version or the launch path. Since the maintainer can't reproduce on
paper-identical settings, the remaining delta is presumably something
about the seeding *mechanism* itself, not the setting values — gathered
concrete artifacts to narrow it further and posted a follow-up comment
with them: the exact `.cfg`, the probe source + built PRG, the `.ctl`
launch script, full command lines for both launch methods, and both flash
images (a `--settings`-seeded one that fails and a menu-seeded one that
works, same firmware/settings, gzipped) — saved under
`tests/emulator/artifacts/` in this repo (not committed to git; kept
alongside this README as reference in case a future session needs them
again). Comment drafted at
`issue2_followup_comment.md` in the scratchpad — not yet posted, pending
user confirmation (same pattern as the original filing and issue #1's
follow-up).

### Fix confirmed (2026-09-19): issue #2 is FIXED on main (`83b5b62`)

Jondalar diagnosed and fixed the actual root cause, using the artifacts
from the follow-up comment above. **It was never about `--settings`** —
that was a correlated red herring (our two comparison flashes happened to
also differ in CPU speed). The real trigger: `uii_detect()` writes ABORT
to the UCI control register immediately before `uii_get_hwinfo()` sends
its command; at high CPU speed (`Turbo Control=U64 Turbo Registers` +
`CPU Speed=16`+) the emulator's C64-runs-up-to-1ms-ahead-of-firmware
batching let the late ABORT handling reset the command buffer after the
command bytes were written but before the firmware read them — the
firmware logged `Null command.` and answered with nothing. Fixed by
making the C64 side wait (up to 10ms) for the firmware to actually
process register-write events before continuing.

**Independently verified here**, fetched `origin/main` to `83b5b62`,
built fresh (`cargo build --release -p ue2emu -p ue2-mcp`, same
`LD_LIBRARY_PATH`/`RUSTFLAGS -L` workaround for `libslirp` as before —
note this time plain `LD_LIBRARY_PATH` wasn't enough for the *linker* to
find `-lslirp`, needed `RUSTFLAGS="-L /tmp/libslirp-install/lib/x86_64-linux-gnu"`
too):

1. **Isolated probe, exact original repro conditions** (fresh flash,
   `--settings UltimateDemo2026-U64E2.cfg` — `Turbo Control=U64 Turbo
   Registers`/`CPU Speed=16`, U64E2 3.15a firmware): `hwinfo_probe.prg`
   now returns `S=30,30 D=55,6C`, `"ultimate 64-ii"` — a genuine `00,OK`
   response, not `S=00,00 D=00,00`. Repeated across 3 independent
   fresh-flash runs (9 total probe launches), 100% pass, no
   intermittency.
2. **The real demo binary**, fresh `make clean && make`, tested against
   the same fixed emulator + `--settings` + high-speed U64E2 3.15a:
   **full detection pass**, all six lines `[ OK ]` —
   `UCI`/`Type`/`REU`/`Turbo`/`Audio`/`Palet`/`Music` — including `Type`
   (the line that silently never appeared before, the original symptom)
   and `Palet` (this project's own UCI palette-detection call, a
   different UCI command than `GET_HWINFO` but exercising the same
   ABORT-then-command sequence path). Also incidentally confirms the
   session's own shortened `turbo_detect()` loop
   (`ITERS=300`/`THRESHOLD_DETECT=10`) still correctly reports
   `Turbo : [ OK ] 64 MHz` under this emulator.
3. **C64U 1.1.0** (own `.cfg`, own firmware): `Type : ultimate 64` now
   appears (previously silently skipped, same root symptom). `Palet :
   [Fail] Not available (older fw)` is the correct, designed fallback for
   pre-3.15 firmware — not a regression.

**Caveat, out of scope for this issue**: C64U 1.1.0's reported string
uppercases to `ULTIMATE 64`, not `C64 ULTIMATE` as project memory
recorded from a real-hardware REST-API check
(`project_firmware315_plan.md`, 2026-09-16). Worth reconciling separately
sometime — doesn't affect this issue's fix, which is specifically about
the UCI round-trip completing at all, not the string's exact content.

**Conclusion: fix holds under independent testing, both the isolated
probe and the real demo, both firmware variants. Safe to close issue #2.**
Confirmation comment drafted at `issue2_confirmation_comment.md` in the
scratchpad, not yet posted — pending user go-ahead (same pattern as
issue #1's close).

## v0.4.0: the debug monitor (S23) — smoke test upgraded, old "hang" note retired

UE2-C64U-Emulator 0.4.0 ships a full debug monitor for both processors
(`docs/status/monitor.md`) — the firmware's RISC-V and the C64 behind
it, plus a VICE-compatible binary monitor (`--vice-monitor`) for
third-party 6502 debuggers. Reached with `monitor <command>` on the
same `--control` connection the scripted `.ctl` commands already use —
no separate connection, no new flag needed beyond `--control` (already
required for any of this project's scripting).

**Rebuilding**: `cargo build --release --features trx64` needed two
things beyond a plain `git pull` in this environment: `cargo` wasn't on
`PATH` (`~/.cargo/bin`), and the `trx64` git dependency
(`git@github.com:Jondalar/TRX64`) needed
`git config --global url."https://github.com/".insteadOf "git@github.com:"`
+ `gh auth setup-git` + `net.git-fetch-with-cli = true` in
`~/.cargo/config.toml`, since SSH auth wasn't set up for it. The final
link step also needed `LIBRARY_PATH=/path/to/libslirp/lib` (not just
`LD_LIBRARY_PATH`, which only covers the *runtime* loader, not the
linker) pointed at wherever `libslirp` was built per the Prerequisites
section above.

**New test script**: `smoke-udemo2026-monitor.ctl` — the real
`udemo2026.prg` (not `paltest.prg`), driven through the proven
file-browser navigation, but now bracketed with direct monitor
verification instead of trusting the boot log or menu screen text
alone:

- `monitor config "C64 and Cartridge Settings" "RAM Expansion Unit"` /
  `"REU Size"` / `monitor config "U64 Specific Settings" "Turbo
  Control"` — confirms the `.cfg` passed via `--settings` actually
  landed in the flash and is what the *running firmware* reports back,
  not just that `ue2emu` printed a `settings:` line at boot (the two
  are not the same thing — see the whole `--settings`-vs-`GET_HWINFO`
  saga above, where flash state and boot-log text genuinely diverged).
- `monitor dir /Usb0/idi8b/ultdemo2026` — confirms the USB staging tree
  has the files it's supposed to, before ever touching the menu. This
  replaces eyeballing a `screen` dump of the file browser to confirm
  staging, which this README's own history shows is exactly where
  navigation-recipe assumptions have broken before (the C64U
  extra-menu-layer gotcha, the two-`key return`-per-directory
  discovery).
- `monitor m 0400 04ff` after the detection screen is reached — a raw
  screen-RAM byte dump, independent of font rendering or `png`
  comparison. Confirmed working (real bytes come back, not zeros) but
  used here as a diagnostic capture rather than a hand-decoded
  assertion — this project's screen library uses a custom identity
  charmap (`petscii.h`, see project memory), so byte-for-byte semantic
  decoding wasn't worked out in this pass; a future session wanting
  strict memory-level assertions should start from a captured known-good
  baseline (`monitor m` output from a confirmed-clean run) and diff
  against that, rather than hand-decoding screen codes.
- `monitor status` / `monitor clock` at the end — confirms neither CPU
  is halted/hung, complementing (not replacing) the existing `c64screen`
  pass/fail check.

**Verified live, 2026-09-20**, against the current `udemo2026.prg`
(v1.1.0-20260920, including this session's `turbo.c` rewrite to a
hand-written assembly counting loop — see `include/turbo.c`/
`TURBOCONTROLMANUAL.md`): full clean pass, all six lines `[ OK ]`,
reached in a few seconds of emulated time, not the multi-minute
near-hang the March/September-18 note below used to describe. That
note (`turbo_detect()`'s old benchmark-based loop taking "excessively
long... not root-caused further") is now **obsolete** — it describes
the pre-rewrite `benchmark_delay()`, not current code, and the
live-verified run above supersedes it:

```
            UltimateDemo2026
Hardware Detection  v1.1.0-20260920-1423

Waiting for Ultimate firmware...
  UCI   : [ OK ]  ultimate-ii dos v1.2
  Type  : ultimate 64-ii
Checking REU...
  REU   : [ OK ]  16 MB
Checking turbo mode...
  Turbo : [ OK ]  64 MHz
Checking Ultimate Audio...
  Audio : [ OK ]  v16
Checking palette control...
  Palet : [ OK ]  UCI palette OK
Loading music...
  Music : [ OK ]  4ev.mod

Detection complete.
Press any key to start the demo.
```

`smoke-paltest.ctl` remains useful as a fast, minimal-dependency check
(no monitor, no `--settings`, exercises UCI/turbo/palette without the
full detection screen) — the two scripts serve different purposes, not
a replacement relationship.

**Not yet done, worth a future pass**: a `.lbl`-driven variant using
`-g` (a separate debug build target, so the shipped `.prg`'s flags stay
untouched) to resolve monitor memory reads to actual C symbol names/
addresses instead of raw hex ranges, and `monitor c64 halt` / `step` /
`bk` (breakpoints) to turn open questions like the C64U Run/Load
double-reset investigation above into a single scripted repro instead
of log-timing archaeology, should a similar bug turn up again.
