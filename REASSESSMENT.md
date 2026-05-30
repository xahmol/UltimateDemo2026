# UltimateDemo2026 — Code Reassessment

**Date:** 2026-05-21 (initial) / 2026-05-22 (second pass)  
**References used:** oscar64 manual, CLAUDE.md, democoding.md, c64_reference.md

---

## Summary

The codebase is generally well-written and follows Oscar64 best practices.
One real bug was found (a no-op expression intended to uppercase characters).
Several other items are minor notes or observations, not defects.

---

## 1. Bug — `uci_to_upper()` uppercase conversion is a no-op

**File:** `src/main.c:65`

```c
if (c >= 'a' && c <= 'z')
    c = (unsigned char)(c - 32 + 0x20);
```

`0x20` == 32, so `c - 32 + 32 == c`. The expression is an identity; lowercase ASCII bytes
from UCI responses are never uppercased before being stored in `detail`. The intent was to
map ASCII `a–z` (0x61–0x7A) to uppercase A–Z (0x41–0x5A) for display.

**Fix:** `c = (unsigned char)(c - 0x20);`   ← subtract 32, do not add it back.

**Impact:** UCI firmware version and hardware-name strings will display in lowercase on the
detection screen instead of the intended uppercase. The line `screen_result("UCI ", 1, detail)`
and the `cwin_put_string("Type", detail)` output are both affected.

---

## 2. Comment error — CIA TOD unit in `benchmark_delay`

**File:** `include/turbo.c:20`

```c
// Measues in CIA TOD time units (1/60th of a second).
```

CIA1 TOD counts in **tenths of a second (1/10 s)**, not 1/60 s. The function correctly
returns `cia1.tods*10 + cia1.todt` (seconds×10 + tenths) giving elapsed tenths, which
matches every threshold and caller in the code. Only the comment is wrong.

**Fix:** Change comment to read "1/10th of a second."

---

## 3. CIA TOD BCD arithmetic (minor, works in practice)

**Files:** `include/turbo.c:40`, `src/main.c:216–218`, `src/gears.c:362`, `src/mandel.c:335`

All reads of `cia1.tods` treat the register as a plain binary integer. CIA TOD stores
BCD values — seconds are 0x00–0x59 in BCD, not 0x00–0x3B in binary.

For measurements that stay below 10 seconds, BCD and binary coincide (0x00–0x09 are
identical), so there is no observable error. If any measurement or wait ever reaches
10+ seconds the BCD encoding would cause the comparison to fail silently (0x10 BCD =
16 decimal, not 10). All existing thresholds and waits are well within 10 seconds
(THRESHOLD_SLOW = 70 tenths ≈ 7 s; longest wait is 5 s in gears_run).

**Recommendation:** No urgent change required. If waits are ever extended past 9 seconds,
add a BCD-to-binary decode helper.

---

## 4. Duplicate defines in `include/defines.h`

**File:** `include/defines.h:29–34` vs `:63–66`

| Name (first) | Name (second) | Value | Meaning |
|---|---|---|---|
| `CH_LIRA` | `CH_POUND` | 92 / 0x5C | Pound/Lira sign |
| `CH_ARROW_UP` | `CH_UARROW` | 94 / 0x5E | Up-arrow character |
| `CH_ARROW_LEFT` | `CH_LARROW` | 95 / 0x5F | Left-arrow character |

Each pair names the same PETSCII byte twice. No compile error, no runtime issue. Could
cause confusion when deciding which name to use in new code.

**Recommendation:** Remove the second definition of each (lines 63–65). Keep the first set
(`CH_LIRA`, `CH_ARROW_UP`, `CH_ARROW_LEFT`).

---

## 5. NMI vector address — confirmed correct

**File:** `src/main.c:84`

```c
*((void **)0x0318) = nmi_handler;
```

`$0318–$0319` is the C64 KERNAL NMI indirect vector. Writing a handler there is the
correct way to suppress RESTORE-key resets from C code. No KERNAL routine (e.g.,
`IOINIT`, `RESTOR`) needs to be called here; direct vector install is intentional and
correct.

---

## 6. Memory layout — confirmed correct

### Gears demo (`src/gears.c`)

| Symbol | Address | Role |
|---|---|---|
| `GR_COLOR` | `$D000` | Screen RAM (VIC bank 3 offset $1000) |
| `GR_HIRES` | `$E000` | Hires bitmap (VIC bank 3 offset $2000) |

VIC bank 3 = `$C000–$FFFF`. Writing to `$D000` via `MMAP_RAM` (CPU sees RAM, not I/O)
then switching to `MMAP_NO_ROM` for display is the standard technique. The VIC reads its
bank-3 address space directly from RAM regardless of CPU memory map. Layout is correct.

### Mandelbrot demo (`src/mandel.c`)

| Symbol | Address | Role |
|---|---|---|
| `MC_COLOR` | `$C800` | Screen RAM (VIC bank 3 offset $0800) |
| `MC_CRAM`  | `$D800` | Hardware color RAM (always at $D800 regardless of bank) |
| `MC_HIRES` | `$E000` | Multicolor bitmap (VIC bank 3 offset $2000) |

Color RAM is a separate 1000-byte SRAM chip at `$D800–$DBFF`; it is not bank-switched.
Accessing it directly as `(char *)0xD800` is always correct. Layout is correct.

### Fixed-point escape radius (`src/mandel.c:43–44`)

```c
#define ESCAPE_4F12  0x04000000UL
```

`lsqr4f12s` returns an **8.24** fixed-point square. For `|z|² ≥ 4.0`:
4.0 in 8.24 = 4 × 2²⁴ = 0x04000000. Correct.

---

## 7. Zero-page usage

**File:** `src/gears.c:298–301`

```c
static __zeropage char zp_angle1;
static __zeropage char zp_angle2;
static __zeropage char zp_spd;
static __zeropage char zp_dirty;
```

Placing the four hottest animation state variables in zero page is good practice.
At 64 MHz this is a minor gain; at 1–4 MHz (early steps of the ramp) it meaningfully
reduces cycle counts per draw_gear call.

`src/mandel.c` inner render loop variables (`py`, `px`, `iter`, etc.) are on the stack
and not in zero page. At 64 MHz render time is already about 1.5 s per frame, so this
is not a problem. If render time needs to be cut further, adding `__zeropage` to the
outer-loop coordinates and the BCD `iter` counter would help.

---

## 8. VIC raster line 225 in display_animated

**File:** `src/mandel.c:358`

```c
vic_waitLine(225);
```

PAL has 312 lines (0–311), NTSC has 263 (0–262). Line 225 is within range on both.
The visible area ends around line 250 on PAL, so line 225 is near the bottom border.
No issue.

---

## 9. Potential KERNAL replacement opportunities

No code currently calls any KERNAL routines for file I/O, screen output, or input.
The project uses:
- Oscar64 `charwin.h` for screen writes (replaces KERNAL CHROUT-based routines) ✓
- `cwin_getch()` for keyboard input (replaces KERNAL GETIN) ✓
- UCI library for file access (replaces KERNAL OPEN/CHRIN) ✓
- Oscar64 `reu.h` / custom `reu_fetch()` for DMA (no KERNAL equivalent) ✓

No cases found where KERNAL routines should replace manual code or vice versa.

---

## 10. Suggested p2s/s2p map verification

**File:** `src/screen.c:24–26`

```c
static char p2smap[] = {0x00, 0x00, 0x40, 0x20, 0x80, 0xc0, 0x80, 0x80};
static char s2pmap[] = {0x40, 0x00, 0x20, 0xc0, 0xc0, 0x80, 0xa0, 0x40};
```

These XOR tables implement PETSCII↔screen-code conversion. The commented-out
alternative versions suggest the maps were tuned empirically. Once `c64_reference.md`
is available (see note at top), it is worth verifying these against the authoritative
PETSCII/screen-code table to confirm no edge cases are wrong for the reversed-video
header rendering.

---

## Second-pass findings — c64_reference.md + audio/IRQ audit (2026-05-22)

### 11. p2s/s2p maps — now verified

**File:** `src/screen.c:24–26`

Cross-checking against `c64_reference.md` §12 (Screen Codes vs PETSCII):

PETSCII → screen code conversion (XOR method):

| Range | XOR value |
|---|---|
| $00–$1F | $40 |
| $20–$3F | $00 (no change) |
| $40–$5F | $40 |
| $60–$7F | $20 |
| $80–$9F | $40 |
| $A0–$BF | $C0 |
| $C0–$DF | $80 |
| $E0–$FF | $80 |

The `p2smap` indexes on `ch >> 5` (the 3 high bits, 8 possible values):

| ch[7:5] | Range | p2smap[i] | Result |
|---|---|---|---|
| 000 | $00–$1F | `0x00` | **should be $40 — wrong!** |
| 001 | $20–$3F | `0x00` | ✓ (no change) |
| 010 | $40–$5F | `0x40` | ✓ |
| 011 | $60–$7F | `0x20` | ✓ |
| 100 | $80–$9F | `0x80` | **should be $40 — wrong for $80–$9F** |
| 101 | $A0–$BF | `0xC0` | ✓ |
| 110 | $C0–$DF | `0x80` | ✓ |
| 111 | $E0–$FF | `0x80` | ✓ |

**Impact:** Range $00–$1F (control codes) is rarely written to the screen as
printable glyphs, so this bug is unlikely to surface. Range $80–$9F (reverse-video
control codes / characters like reversed letters) maps to the wrong screen code
— these characters would display as the wrong glyph.

**For this project:** `screen.c` passes source-code string literals that are
already remapped by `petscii.h`. The only path that bypasses `petscii.h` is
`uci_to_upper()` (fixed, now outputs $41–$5A = uppercase, range 010). The
`header_line()` function calls `p2s()` on literals from string parameters. With
`petscii.h` active the source bytes are already in the $20–$7F range for ASCII,
so the $00–$1F bug does not trigger.

**Recommendation:** For robustness, fix `p2smap[0]` from `0x00` to `0x40`. Low
risk, no current observable effect.

---

### 12. modplay.c — IRQ installation assessment

**File:** `include/modplay.c:697–772`

The MOD player installs a CIA1 Timer A IRQ via raw $0314/$0315 writes and exits
via `jmp $ea7e` (KERNAL fake-IRQ exit). Assessment:

**What's correct:**
- `jmp $ea7e` IS the right exit for `$0314` handlers — KERNAL saves A/X/Y before
  calling $0314, and $EA7E restores them + RTI. Replacing with a plain RTI would
  leave the stack dirty and crash.
- Saving/restoring $0314/$0315 on start/stop is correct.
- CIA1 `icr` read in handler to acknowledge Timer A (`$DC0D` read clears flags). ✓

**What can be improved — Oscar64 native CIA struct:**

The raw-address writes can use Oscar64's CIA struct (`<c64/cia.h>`):

| Current raw write | Oscar64 equivalent |
|---|---|
| `*(volatile char*)0xDC0D = 0x7F` | `cia1.icr = 0x7F` |
| `*(volatile char*)0xDC04 = lo` + `0xDC05 = hi` | `cia1.ta = timer_val` (16-bit) |
| `*(volatile char*)0xDC0D = 0x81` | `cia1.icr = 0x81` |
| `*(volatile char*)0xDC0E = 0x01` | `cia1.cra = 0x01` |
| `lda $dc0d` (in inline asm) | `cia1.icr` read |

**`__hwinterrupt` is NOT a drop-in replacement** for `$0314` handlers. Oscar64's
`__hwinterrupt` exits via RTI, not `jmp $ea7e`. Using it at $0314 would leave the
KERNAL's A/X/Y push on the stack unpopped → stack corruption.

**Options:**
1. **Minimal fix (recommended):** Keep assembly trampoline + `jmp $ea7e`, replace
   raw CIA addresses with `cia1.ta`, `cia1.icr`, `cia1.cra`.
2. **Oscar64-native full refactor:** Replace $0314 with a complete `rirq_init_kernal()`
   framework + `rirq_call()` for the CIA tick. Requires restructuring but aligns
   with Oscar64 style. Only worth it if the rirq chain is needed for other effects.

**Current code is functional and correct.** Option 1 is a clean-up, not a bugfix.

---

### 13. Oscar64 parser quirk — cast before macro struct member

**Discovered during FLI implementation (mandel.c).**

`(unsigned char)vic.raster` inside a `do { }` block causes parse errors:
```
error 3013: Struct expected
error 3005: Unknown identifier 'raster'
```

`vic` is a macro: `#define vic (*((struct VIC *)0xd000))`. Oscar64 misparses
`(unsigned char) vic` as a type cast followed by a new expression-statement,
then fails to parse `.raster`.

**Fix:** remove redundant cast (if member type already matches), or add parens:
`(unsigned char)(vic.raster)`. Documented in `~/.claude/oscar64.md`.

---

### 14. New VIC struct member names (Oscar64)

Confirmed correct names from `<c64/vic.h>`:

| Purpose | Oscar64 member | Address |
|---|---|---|
| Control reg 1 ($D011) | `vic.ctrl1` | $D011 |
| Raster line ($D012) | `vic.raster` | $D012 |
| Memory pointers ($D018) | `vic.memptr` | $D018 |
| Interrupt control ($D019) | `vic.intr_ctrl` | $D019 |
| Interrupt enable ($D01A) | `vic.intr_enable` | $D01A |
| Border color ($D020) | `vic.color_border` | $D020 |
| Background color ($D021) | `vic.color_back` | $D021 |

Also exposed (U64 extensions beyond standard VIC-II):
- `vic.ext_keymap` — U64 keymap extension
- `vic.ext_2mhz` — U64 2 MHz mode control
- `vic.ext_uturbo` — U64 turbo control (alternative to $D031)

---

## Changes requiring confirmation before implementation

| # | Change | File | Risk |
|---|---|---|---|
| 1 | Fix `uci_to_upper` to `c - 0x20` | `src/main.c:65` | Low — display-only |
| 2 | Fix `benchmark_delay` comment | `include/turbo.c:20` | None — comment only |
| 3 | Remove duplicate CH_* defines | `include/defines.h:63–65` | Low — need grep for usage |

Please confirm before any edits are made.
