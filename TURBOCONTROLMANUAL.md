# Turbo Control Library Manual

**Ultimate 64 CPU Speed Control for Oscar64**

Library files: `include/turbo.h` / `include/turbo.c`

---

## Contents

1. [Overview](#1-overview)
2. [Hardware Background](#2-hardware-background)
3. [Firmware Prerequisites](#3-firmware-prerequisites)
4. [Register Reference](#4-register-reference)
5. [Constants and Defines](#5-constants-and-defines)
6. [Function Reference](#6-function-reference)
7. [Detection Method](#7-detection-method)
8. [Typical Usage Patterns](#8-typical-usage-patterns)
9. [Limitations and Known Issues](#9-limitations-and-known-issues)

---

## 1. Overview

The turbo control library provides a simple API to:

- **Detect** whether the U64 turbo speed registers are active and classify the speed.
- **Set** any of the 16 speed steps from 1 MHz to the hardware maximum.
- **Get** the current speed register value.

The primary control register is `$D031`. Detection is measurement-based: `turbo_detect()` ramps the CPU to maximum speed, runs a calibrated timing loop, and measures elapsed real time via CIA1 TOD (Time Of Day), which advances at the real 50/60 Hz mains frequency regardless of CPU speed. See §7 for the full method.

---

## 2. Hardware Background

### Ultimate 64 CPU speed

The Ultimate 64 (U64) FPGA replaces the C64's 6510 CPU with a re-implementation that can run at higher clock multiples. The actual maximum depends on the hardware revision:

| Hardware | Maximum CPU speed |
|----------|------------------|
| Ultimate 64 (original) | ~48 MHz |
| Ultimate 64 Elite I | ~48 MHz |
| Ultimate 64 Elite II | ~64 MHz |
| C64U | ~64 MHz |

The FPGA presents a standard 6510-compatible 8-bit CPU to software; timing-sensitive code (SID register timing, raster IRQs, etc.) must be rewritten for turbo speeds.

### Why most timers do not work for speed detection on U64

CIA1 timer A and B, and the VIC-II raster counter, are clocked at the CPU frequency on U64.  A tight benchmark loop always takes the same number of timer ticks regardless of turbo setting — the ratio is 1:1 and carries no speed information.

**CIA1 TOD (Time Of Day) does work.** TOD advances at the real 50/60 Hz mains frequency, independent of the CPU clock.  A short, hand-written assembly counting loop (`benchmark_delay()`) with a fixed, precisely computable cycle cost runs long enough in real time for TOD tenths to accumulate, even at turbo speed.  See §7 for the full method.

### Badlines

At 1 MHz the VIC-II "steals" the CPU bus for ~40 cycles every 8 raster lines (badlines). Setting bit 7 of `$D031` suppresses badline CPU stalls. Strongly recommended when running at turbo speed. The VIC-II continues to render normally; only the CPU stall is removed.

---

## 3. Firmware Prerequisites

The U64 firmware exposes turbo control through a **menu setting**:

**Menu path:** `F2` → `C64 and cartridge settings` → `Turbo Mode`

| Setting | Behaviour |
|---------|-----------|
| `Off` | Turbo disabled; `$D031` reads `$FF` |
| `Turbo Enable Bit` | `$D030` bit 0 enables turbo at the firmware-configured speed |
| `U64 Turbo Registers` | `$D031` bits 0–3 directly set the speed index |

**Recommended: "U64 Turbo Registers" mode.**

In "Turbo Enable Bit" mode, `$D031` reads as `0x00` and the speed is controlled by `$D030` bit 0 + the firmware CPU Speed menu. `turbo_detect()` handles this case by checking `$D030` bit 0 as a fallback when `$D031 == 0x00`.

---

## 4. Register Reference

### `$D031` — U64 Turbo Control (read/write)

| Bits | Name | Description |
|------|------|-------------|
| 3–0 | Speed index | 0 = 1 MHz, 1–14 = intermediate speeds, 15 = maximum |
| 6–4 | Reserved | Write 0 |
| 7 | Badline mask | 0 = normal VIC-II badline CPU stalls; 1 = suppress |

**Detection:** Reading `$D031` returns `$FF` when turbo registers are unavailable. Any non-`$FF` value confirms U64 turbo registers are present.

**Speed index approximate frequencies (both Elite-I and Elite-II):**

| Index | Approximate speed |
|-------|------------------|
| 0 | 1 MHz |
| 1–13 | 2–40 MHz (intermediate) |
| 14 | 48 MHz |
| 15 | 48 MHz (Elite I) or 64 MHz (Elite II / C64U) |

Index 15 is the hardware maximum. On Elite-I this is ~48 MHz; on Elite-II / C64U it is ~64 MHz. Software cannot distinguish these cases from the register value alone — both report index 15.

### `$D030` — Turbo Enable Bit (conditional)

| Bit | Description |
|-----|-------------|
| 0 | In "Turbo Enable Bit" firmware mode: 1 = enable turbo at firmware-configured speed |

In "U64 Turbo Registers" mode, `$D030` reads as `$FF` (open bus) and bit 0 is always 1.

---

## 5. Constants and Defines

All constants are in `include/turbo.h`.

### Detection result constants

| Constant | Value | Meaning |
|----------|-------|---------|
| `TURBO_NOT_PRESENT` | 0 | Turbo not genuinely engaged ($D031==$FF, or the CIA-TOD benchmark shows no real speedup) |
| `TURBO_DETECTED` | 1 | Turbo genuinely engaged and accelerating the CPU — confirms *that*, not *how fast*; see §9 |

### Speed index constants

| Constant | `$D031` bits 0–3 | Speed |
|----------|-----------------|-------|
| `TURBO_SPEED_1MHZ` | `0x00` | 1 MHz |
| `TURBO_SPEED_2MHZ` | `0x01` | 2 MHz |
| … | … | … |
| `TURBO_SPEED_48MHZ` | `0x0E` | 48 MHz |
| `TURBO_SPEED_MAX` | `0x0F` | Hardware maximum |

### Badline and convenience constants

| Constant | Value | Effect |
|----------|-------|--------|
| `TURBO_BADLINES_ON` | `0x00` | Normal badline stalls |
| `TURBO_BADLINES_OFF` | `0x80` | Suppress badline stalls |
| `TURBO_FULL` | `0x8F` | `TURBO_SPEED_MAX \| TURBO_BADLINES_OFF` |

### Detection calibration constants

| Constant | Value | Description |
|----------|-------|-------------|
| `COUNT` | `0xFFFF` | 16-bit down-counter value passed to `benchmark_delay()` |
| `THRESHOLD_DETECT` | 6 | Elapsed tenths at or above which the CPU is classified as 1 MHz (no turbo) |

2026-09-20: replaced the deliberately-unoptimised C loop (`ITERS=300`, 300 × 200 = 60,000 nop-loop
passes) with a hand-written 6502 assembly loop (see §7 and `turbo.c`) — guidance from Bart van
Leeuwen (private correspondence, 2026-09-20) was that a short, fixed-cycle-cost assembly loop has
far less timing jitter than compiler-generated `-O0` code, needing far less safety margin around
`THRESHOLD_DETECT`. `COUNT=0xFFFF` (the full 16-bit range, one pass) was originally a **computed**
estimate from the loop's known, cycle-accurate cost (~20.016 cycles/count):

- ~1,311,738 cycles/pass → ~13.1 tenths at 1 MHz (no turbo)
- ~0.27 tenths at 48 MHz, ~0.21 tenths at 64 MHz (turbo engaged)

2026-09-23: empirically re-measured on real Ultimate 64-II hardware — 1 MHz baseline read 12 tenths
(close to the ~13.1 estimate), turbo-engaged read 0 (well under threshold). `THRESHOLD_DETECT=6`
sits roughly halfway, well clear of both sides — confirmed correct as-is. The same session found
and fixed a real, separate bug in `turbo_detect()` itself: an unclean speed transition when an
auto-loaded `.cfg` leaves `$D031` pre-set to a non-zero speed index (see the fix note under
`turbo_detect` below) — a transition-settling bug, not a miscalibration of these constants.

If `turbo_detect()` misclassifies your hardware, call `benchmark_delay(COUNT)` directly and print
the return value (with and without turbo enabled) to re-derive `THRESHOLD_DETECT` empirically.

---

## 6. Function Reference

### `benchmark_delay`

```c
int benchmark_delay(unsigned int count);
```

Run a short, hand-written 6502 assembly counting loop and return elapsed time in CIA1 TOD tenths of a second. Used internally by `turbo_detect()`.

The loop is a standard borrow-based 16-bit decrement-to-zero counter (`#pragma optimize(0)`, `__noinline`, `volatile unsigned char` hi/lo bytes — see `turbo.c` for why `volatile` is required here, not just habit). Each count costs a fixed, precisely computable number of cycles (~20.016 average), giving CIA TOD enough real time to advance with far less run-to-run jitter than a compiler-generated loop.

Resets CIA1 TOD to `00:00.0` on entry and reads it on exit. Wraps with SEI/CLI. `count` is destroyed by the loop.

**Direct use:** call `benchmark_delay(COUNT)` and print the return value to calibrate `THRESHOLD_DETECT` for your hardware.

---

### `turbo_detect`

```c
char turbo_detect(void);
```

Confirm turbo is genuinely engaged via CIA TOD timing. Forces a clean 1 MHz baseline first (its own
settle pass), then sets CPU to maximum speed and calls `benchmark_delay(COUNT)` twice more — once
as a throwaway pass to let the FPGA clock-domain change settle, once to measure. The elapsed tenths
are compared against a single threshold. Does **not** classify the MHz ceiling — see §9 for why,
and how to get that from `CTRL_CMD_GET_HWINFO` instead.

**Returns:** `TURBO_NOT_PRESENT` or `TURBO_DETECTED`.

| Result | Condition |
|--------|-----------|
| `TURBO_DETECTED` | elapsed < `THRESHOLD_DETECT` (genuinely accelerated) |
| `TURBO_NOT_PRESENT` | elapsed ≥ `THRESHOLD_DETECT` (6 tenths — running at ~1 MHz) |

**2026-09-23 fix, confirmed on real Ultimate 64-II hardware via c64bridge:** an auto-loaded `.cfg`'s
own Turbo Control setting can leave `$D031` already at a non-zero speed index before this function
ever runs. Jumping directly from that pre-existing state to max speed (the original implementation)
settled unreliably — intermittent false `TURBO_NOT_PRESENT` roughly half the time, reproducible
across repeated soft resets of the identical binary. Forcing a genuine 1 MHz baseline first (a real
`$D030` enable-bit transition, with its own settle pass) before jumping to max fixed it: confirmed
reliable across multiple consecutive real-hardware runs afterward.

Restores `$D031` to 1 MHz after measuring. Call once at startup; worst case (no turbo present)
takes ~3.9s at 1 MHz across the three `benchmark_delay()` passes now used, ~0.05s if turbo is
genuinely engaged. See §7 for full method description and threshold calibration.

---

### `turbo_set`

```c
void turbo_set(char control);
```

Write a control byte to `$D031` and enable via `$D030`.

```c
turbo_set(TURBO_FULL);                           // max speed, no badlines
turbo_set(TURBO_SPEED_24MHZ | TURBO_BADLINES_ON);// 24 MHz, keep badlines
turbo_set(TURBO_SPEED_1MHZ);                     // 1 MHz
```

Speed change takes effect on the very next CPU cycle.

---

### `turbo_fast`

```c
void turbo_fast(void);
```

Shorthand: `turbo_set(TURBO_SPEED_MAX | TURBO_BADLINES_OFF)`.

---

### `turbo_slow`

```c
void turbo_slow(void);
```

Shorthand: `turbo_set(TURBO_SPEED_1MHZ)`.

---

### `turbo_get`

```c
unsigned char turbo_get(void);
```

Read the current `$D031` value. Returns `0xFF` if registers unavailable.

---

## 7. Detection Method

### Overview

`turbo_detect()` first forces a clean 1 MHz baseline (its own settle pass, fixing a real transition
bug — see below), then sets the CPU to maximum speed and runs `benchmark_delay(COUNT)` twice more —
once as a throwaway pass purely to let the FPGA clock-domain change settle, once to measure. The
result is compared against a single empirical threshold — confirming turbo is genuinely engaged, not
classifying how fast:

| Result | Condition |
|--------|-----------|
| `TURBO_DETECTED` | elapsed < `THRESHOLD_DETECT` (~0.2–0.3 tenths) |
| `TURBO_NOT_PRESENT` | elapsed ≥ `THRESHOLD_DETECT` (~13.1 tenths at 1 MHz) |

**Transition bug, fixed 2026-09-23:** an auto-loaded `.cfg`'s own Turbo Control setting can leave
`$D031` already at a non-zero speed index before `turbo_detect()` ever runs. The original
implementation jumped directly from that pre-existing state to max speed, which settled unreliably
on real Ultimate 64-II hardware — an intermittent false `TURBO_NOT_PRESENT` roughly half the time,
reproducible across repeated soft resets of the identical binary. Forcing a genuine 1 MHz baseline
first (a real `$D030` enable-bit transition, with its own settle pass) fixed it.

For the MHz ceiling (48 vs 64), don't extend this measurement — query `CTRL_CMD_GET_HWINFO`'s product-name string at the application level instead. An earlier version of this library tried a second, finer threshold to tell 48 MHz from 64 MHz from the same timing measurement; that was removed (2026-09-14/16) after it was confirmed unreliable on real hardware — the same genuinely-64MHz board classified differently across two consecutive runs, because the measurement sits too close to that boundary to trust. **Revisited once more, 2026-09-23**, this time trying a much longer, continuous multi-second measurement specifically to see if a longer loop could resolve the two tiers — it made things worse, not better: elapsed times for nominally-identical settings were themselves inconsistent run to run, and both tiers measured far below their labeled MHz for any multi-second continuous pass. Closed permanently — timing-based MHz classification is not coming back. hwinfo's product-name string is a compile-time-fixed hardware-identity fact, not a measurement, so it doesn't have this failure mode; Gideon Zweijtzer also confirmed this specific field of `GET_HWINFO` stays supported long-term (only the command's separate SID-ID subpart is deprecated). See `src/main.c` in UltimateDemo2026 for a worked example, including Commodore 64 Ultimate (C64U): it runs its own separate, non-public firmware fork, and — confirmed on real hardware, 2026-09-20 — reports plain `"Ultimate 64"`, not a distinct `"C64 Ultimate"` string as an earlier REST-API-sourced claim (2026-09-16) had it. That example now only trusts the distinct, unambiguous `"Ultimate 64 Elite"` string for 48 MHz, defaulting everything else — including the ambiguous bare `"Ultimate 64"` string — to 64 MHz, accepting that genuine non-Elite U64 owners will see an optimistic label as the tradeoff.

### Why simple timers do not work on U64

CIA timer B and VIC raster counter are both clocked at the CPU frequency on U64: they track CPU *cycles*, not real time.  A tight benchmark loop always takes the same number of timer ticks regardless of turbo setting, making them useless for speed measurement.

### Why CIA TOD timing does work

CIA1 TOD (Time Of Day) advances at the real 50/60 Hz mains rate.  The key is that the measured loop must run long enough in *real time* for TOD tenths to accumulate.

`benchmark_delay()` (2026-09-20) is a short, hand-written 6502 assembly loop — a standard borrow-based 16-bit decrement-to-zero counter — not compiler-generated code. Per guidance from Bart van Leeuwen (private correspondence, 2026-09-20): a short, tight, hand-written loop with a fixed, precisely computable cycle cost per iteration has far less run-to-run timing jitter than even deliberately-unoptimised `-O0` C, so far less safety margin is needed around `THRESHOLD_DETECT`. Each count costs ~20.016 cycles on average (confirmed against the compiled `.asm`); at `COUNT=0xFFFF` that's ~1,311,738 cycles per pass. At turbo speed the loop completes in a fraction of a tenth; at 1 MHz it takes ~1.3 s. CIA TOD therefore advances measurably during the loop at any speed.

An earlier version of this loop (pre-2026-09-20) deliberately used unoptimised C (`#pragma optimize(0)`, `volatile int` counters, inline `nop`) to burn cycles instead — functionally similar in spirit, but with compiler-dependent, less predictable per-iteration cost.

### Threshold calibration

The defaults (`COUNT=0xFFFF`, `THRESHOLD_DETECT=6`) were originally a **computed** estimate from the loop's known cycle cost, confirmed by real-hardware measurement 2026-09-23 (1 MHz baseline read 12 tenths, turbo-engaged read 0) — see §5. If `turbo_detect()` misclassifies your hardware, call `benchmark_delay(COUNT)` directly (with and without turbo enabled) and print the return value, then adjust `THRESHOLD_DETECT` to bracket the observed values.

---

## 8. Typical Usage Patterns

### Basic detect-and-run

```c
#include "turbo.h"

void main(void) {
    char cls = turbo_detect();
    if (cls != TURBO_NOT_PRESENT) {
        turbo_fast();
        run_demo();
        turbo_slow();
    } else {
        show_error_no_turbo();
    }
}
```

### Speed-adaptive code paths

`turbo_detect()` only tells you *whether* turbo is engaged, not *how fast* — for that, classify from `CTRL_CMD_GET_HWINFO`'s product-name string instead (a hardware-identity fact, not a measurement):

```c
char cls = turbo_detect();
if (cls == TURBO_NOT_PRESENT) {
    // 1 MHz fallback
} else {
    // Turbo engaged. For the MHz ceiling, classify hwinfo's device-type
    // string ("Ultimate 64-II" = 64 MHz-capable; "Ultimate 64 Elite" =
    // 48 MHz-capable) at the application level -- see src/main.c in
    // UltimateDemo2026 for a worked example, including the C64U caveat:
    // C64U reports plain "Ultimate 64", identical to the original
    // non-Elite U64's string, so that specific ambiguous string should
    // default toward the newer/faster tier (C64U is both the more common
    // case today and documented as 64 MHz-capable) rather than guessing 48.
}
```

### Selective turbo (computation fast, I/O at 1 MHz)

```c
void update_frame(void) {
    turbo_fast();
    compute_effects();

    turbo_slow();          // drop before timing-sensitive I/O
    update_sid();

    turbo_fast();
    render_screen();
    turbo_slow();
}
```

### Speed label from $D031 index (careful: not after turbo_detect())

```c
turbo_set(TURBO_SPEED_24MHZ | TURBO_BADLINES_ON);
unsigned char idx = turbo_get() & 0x0F;   // 0x09 -- reads back what you just set
```

`turbo_get()` reads whatever `$D031` currently holds, so this only reflects a speed *you* set. It does **not** work after `turbo_detect()`: that function restores `$D031` to `TURBO_SPEED_1MHZ` before returning (see §7), so `turbo_get()` immediately afterward always reads index `0`, regardless of what turbo speed was actually detected. Mixing the two was a real, confirmed bug in an earlier version of this pattern — see §9.

---

## 9. Limitations and Known Issues

### Firmware setting dependency

- **Off**: `$D031 == $FF` → `TURBO_NOT_PRESENT`.
- **Turbo Enable Bit**: `$D031 == 0x00`; detection uses `$D030` bit 0 fallback.
- **U64 Turbo Registers**: full support, recommended.

### 48 vs 64 MHz not classified by this library

Speed index `0x0F` is the maximum on all U64 variants but maps to different absolute frequencies, and this library deliberately does not try to tell them apart from timing — an earlier version did, via a second finer threshold, and that was removed (2026-09-14/16) after real-hardware testing confirmed it unreliable: the *same* genuinely-64MHz Ultimate 64-II classified differently across two consecutive runs, because the elapsed-time measurement sits too close to the 48-vs-64 boundary to trust. Classify from `CTRL_CMD_GET_HWINFO`'s product-name string at the application level instead — a compile-time-fixed hardware-identity fact, not a measurement:

| hwinfo product-name string | MHz ceiling |
|---|---|
| `"Ultimate 64 Elite"` (Elite I) | ~48 MHz, unambiguous |
| `"Ultimate 64-II"` (Elite II) | ~64 MHz, unambiguous |
| `"Ultimate 64"` (bare — original non-Elite U64 *or* C64U) | classified 64 MHz (see below) |

Gideon Zweijtzer confirmed this specific field of `GET_HWINFO` stays supported long-term (only the command's separate SID-ID subpart is deprecated). C64U runs its own separate, non-public firmware fork; an earlier claim that it reports a distinct `"C64 Ultimate"` string (via the REST API's `/v1/info`, per Fredrik Aberg, 2026-09-16) turned out to be wrong. **Confirmed on real C64U hardware, 2026-09-20** (Commodore firmware "1.1", forum report + screenshot): C64U reports plain `"Ultimate 64"` — the exact same string the original non-Elite U64 reports. `GET_HWINFO` alone genuinely cannot tell these two apart.

Since C64U is both the far more common case in practice today and documented as 64 MHz-capable everywhere else, `src/main.c`'s classification treats the ambiguous bare `"Ultimate 64"` string as 64 MHz. The accepted tradeoff: a genuine (older, rarer) non-Elite U64 will show an optimistic 64 MHz label it can't actually reach. All strings are matched case-insensitively/uppercased in practice (see `src/main.c`). Any other, genuinely unrecognized string also defaults to 64 MHz — that default stops being safe the day a >64MHz variant ships and needs a real string check added then. See `src/main.c` in UltimateDemo2026 for the worked implementation.

### Speed changes are instantaneous

`turbo_set()` takes effect on the very next cycle. Arrange timing-critical code so `turbo_slow()` is called *before* entering the critical section.

### Non-U64 hardware

On standard C64/C128/SuperCPU, `$D031 == $FF` → `TURBO_NOT_PRESENT` immediately.
