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

The primary control register is `$D031`. Detection reads this register directly — measurement-based detection (CIA timer, VIC raster, CIA TOD) is not feasible on U64 because all C64-visible hardware timers are clocked at the CPU frequency and cannot provide an independent real-time reference.

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

### Why software timing does not work on U64

All C64-visible hardware timers (CIA1 timer A and B, CIA TOD, VIC-II raster counter) are clocked at the CPU frequency on U64.  This means a CPU loop always takes the same number of timer ticks regardless of the turbo setting — the ratio is always 1:1 and carries no speed information.  Timing-based detection that works on real hardware or other FPGA implementations does not apply to U64.

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
| `TURBO_NOT_PRESENT` | 0 | Turbo not active ($D031==$FF, or speed index 0 with $D030 bit 0 clear) |
| `TURBO_48MHZ` | 1 | Turbo active at speed index 0x01–0x0E, or Turbo-Enable-Bit mode |
| `TURBO_64MHZ` | 2 | Speed index 0x0F (maximum — assumed 64 MHz on Elite-II/C64U) |

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

---

## 6. Function Reference

### `turbo_detect`

```c
char turbo_detect(void);
```

Reads `$D031` and classifies the active speed. No timing, no SEI/CLI, no side effects.

**Returns:** `TURBO_NOT_PRESENT`, `TURBO_48MHZ`, or `TURBO_64MHZ`.

**Algorithm:**
1. If `$D031 == $FF` → `TURBO_NOT_PRESENT`.
2. `speed_index = $D031 & 0x0F`.
3. `speed_index == 0x0F` → `TURBO_64MHZ`.
4. `speed_index >= 0x0E` → `TURBO_48MHZ`.
5. `speed_index > 0` → `TURBO_48MHZ` (turbo at intermediate speed).
6. `speed_index == 0` and `$D030 bit 0 set` → `TURBO_48MHZ` (Turbo-Enable-Bit mode).
7. Otherwise → `TURBO_NOT_PRESENT`.

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

Detection is register-based: read `$D031`, extract bits 0–3 (speed index), and classify. The firmware writes the configured speed to `$D031` at boot; software reads it back.

### 48 MHz vs 64 MHz limitation

Both Elite-I (48 MHz max) and Elite-II / C64U (64 MHz max) set `$D031` to speed index `0x0F` at maximum speed. The hardware maximum cannot be determined from software registers alone because:

- `$D031` only gives the speed *index* (0–15), not the absolute frequency.
- All C64-visible timers (CIA, VIC, TOD) scale with CPU frequency on U64 and cannot be used as an independent real-time reference.

The library reports `TURBO_64MHZ` for index `0x0F` (assumed Elite-II/C64U). On Elite-I hardware this will display "64 MHz" cosmetically while the CPU actually runs at 48 MHz. If you need to distinguish hardware variants, parse the UCI hardware info string returned by `uii_get_hwinfo(0)` — the firmware knows which board it runs on and may return different strings for Elite-I vs Elite-II.

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

```c
char cls = turbo_detect();
if (cls == TURBO_64MHZ) {
    // 64 MHz path
} else if (cls == TURBO_48MHZ) {
    // 48 MHz / intermediate turbo path
} else {
    // 1 MHz fallback
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

### Speed label from $D031 index

```c
unsigned char idx = turbo_get() & 0x0F;
// idx 0x0F → "64 MHz", 0x0E → "48 MHz", 0x09 → "24 MHz", etc.
```

---

## 9. Limitations and Known Issues

### Firmware setting dependency

- **Off**: `$D031 == $FF` → `TURBO_NOT_PRESENT`.
- **Turbo Enable Bit**: `$D031 == 0x00`; detection uses `$D030` bit 0 fallback.
- **U64 Turbo Registers**: full support, recommended.

### 48 vs 64 MHz indistinguishable from software

Speed index `0x0F` is the maximum on all U64 variants but maps to different absolute frequencies. `TURBO_64MHZ` is reported as a best-effort classification. UCI hardware info (`uii_get_hwinfo`) may help distinguish variants at the application level.

### Speed changes are instantaneous

`turbo_set()` takes effect on the very next cycle. Arrange timing-critical code so `turbo_slow()` is called *before* entering the critical section.

### Non-U64 hardware

On standard C64/C128/SuperCPU, `$D031 == $FF` → `TURBO_NOT_PRESENT` immediately.
