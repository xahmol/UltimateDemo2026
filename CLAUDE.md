# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**UltimateDemo2026** is a C/C++ demo project targeting the **Ultimate 64** (U64) hardware, compiled with the **Oscar64** cross-compiler. It uses the U64's 64 MHz turbo mode and the Ultimate Audio DMA layer.

## Build

```
make          # compile → build/udemo2026.prg
make clean    # remove build artefacts
make deploy   # wput to ULTHOST (edit IP in Makefile)
```

The Makefile sets `-i=include -tm=c64 -tf=prg -O2 -dNOFLOAT`. Oscar64 follows `#pragma compile` chains from `src/main.c` automatically — no per-file compilation needed.

## Source layout

| Path | Role |
|------|------|
| `src/main.c` | Entry point; runs hardware detection sequence |
| `src/screen.h/.c` | CharWin screen helpers (header, result lines, error exit) |
| `src/detect.h/.c` | Hardware detection: UCI, REU size, turbo, Ultimate Audio |
| `include/defines.h` | Project-wide constants: PETSCII codes, screen codes, colour palette (`COL_*`), string limits, `CharWin cw` extern, `APP_NAME` |
| `include/` | Reusable library headers/sources (turbo, audio, modplay, UCI) |
| `build/` | Compiler output (`.prg`, `.map`, `.asm`, `.lbl`) |

## Toolchain: Oscar64

Oscar64 is a C99/C++ cross-compiler for 6502 family processors.  
Source: https://github.com/drmortalwombat/oscar64

### Installation

**Windows** — dedicated installer, places compiler at:
```
%programfiles(x86)%\oscar64\bin\oscar64
```
Add that folder to `PATH`.

**From source (GCC/MSVC):**
```
make -C make compiler   # compiler only
make -C make all        # compiler + samples
```

### Compiling

Basic invocation:
```
oscar64 [-o=output.prg] [-tf=format] [-tm=machine] [-O2] source.c
```

Key flags:
| Flag | Purpose |
|------|---------|
| `-tm=c64` | Target machine (c64, c128, nes, plus4, vic20, pet, x16, mega65) |
| `-tf=prg` | Output format: `prg`, `crt`, `bin` |
| `-O0`…`-O3`, `-Os` | Optimization level |
| `-i=path` | Additional include path |
| `-o=file` | Output filename (default: `output.prg`) |
| `-g` | Source-level debug info (`.dbj`, `.lbl` for VICE) |
| `-pp` | Enable C++ mode |
| `-e` | Run in integrated emulator after compile |
| `-dNOFLOAT` | Disable floating-point (saves space) |
| `-dNOLONG` | Disable long integer support |

Create a `.d64` disk image with bundled resources:
```
oscar64 program.c -d64=program.d64 -fz=resource.bin
```

### Output files

| Extension | Contents |
|-----------|---------|
| `.prg` / `.crt` / `.bin` | Executable |
| `.map` | Memory layout |
| `.asm` | Assembler listing with source references |
| `.lbl` | VICE debugger labels |
| `.dbj` | Full JSON debug info (requires `-g`) |

### Oscar64 standard C64 headers (`include/c64/`)

- `vic.h` — VIC-II registers, `vic_waitFrame()`, `vic_waitLine()`
- `sid.h` — SID voices, envelopes, waveform flags, note macros
- `cia.h` — CIA1 (`$DC00`) / CIA2 (`$DD00`) timers and ports
- `memmap.h` — Memory map modes (`MMAP_ROM`, `MMAP_NO_ROM`, etc.), `mmap_set()`
- `reu.h` — RAM Expansion Unit at `$DF00`
- `rasterirq.h` — Raster interrupt helpers
- `sprites.h`, `joystick.h`, `keyboard.h`, `mouse.h` — Input/graphics

There are **no built-in Ultimate 64 headers** in Oscar64; register access must be written directly (see sections below).

### Project-local libraries (`include/`)

| Header | Purpose |
|--------|---------|
| `turbo.h` / `turbo.c` | U64 turbo speed control and detection — see `TURBOCONTROLMANUAL.md` |
| `audio.h` / `audio.c` | Ultimate Audio hardware layer: 7-channel DMA voices, REU DMA — see `ULTIMATEAUDIOMANUAL.md` |
| `modplay.h` / `modplay.c` | ProTracker MOD player: load via UCI, play from REU via CIA IRQ — see `ULTIMATEAUDIOMANUAL.md` |
| `ultimate_common_lib.h/.c` | UCI core: detection, send/receive protocol engine |
| `ultimate_dos_lib.h/.c` | UCI file I/O, directory navigation, disk mounting, REU transfer |
| `ultimate_time_lib.h/.c` | UCI real-time clock read/write |
| `ultimate_network_lib.h/.c` | UCI TCP/UDP sockets — see `UCILIBMANUAL.md` |

All project headers use `#pragma compile("filename.c")` so only the `.h` needs to be `#include`d; Oscar64 automatically compiles the `.c`.

---

## Ultimate 64: Turbo Mode (64 MHz)

**Library:** `include/turbo.h` — full API reference in `TURBOCONTROLMANUAL.md`

Reference: https://1541u-documentation.readthedocs.io/en/latest/config/turbo_mode.html

The U64 exposes CPU speed control through two C64-visible registers. The firmware menu must have "Turbo Mode" set to **"U64 Turbo Registers"** (or "Turbo Enable Bit") for these to work.

### Registers

| Address | Name | Description |
|---------|------|-------------|
| `$D030` | Turbo Enable Bit | Bit 0: `0` = 1 MHz + badlines, `1` = use menu speed setting |
| `$D031` | U64 Turbo Control | Bits 0–3: speed index (0–15); Bit 7: badline timing control |

**Speed index values for `$D031`:**
- `0` = 1 MHz (standard)
- Higher values = increasing multipliers up to 48 MHz (U64) or 64 MHz (U64 Elite-II)

**Detection:** Read `$D031` — a non-`$FF` value confirms U64 presence.

**SuperCPU-compatible registers (also supported):**
- `$D07A` — any write → 1 MHz (disable turbo)
- `$D07B` — any write → 20 MHz turbo

### Example (C with Oscar64)

```c
#define TURBO_CTRL  (*(volatile unsigned char *)0xD031)
#define TURBO_EN    (*(volatile unsigned char *)0xD030)

void enable_turbo_64mhz(void) {
    TURBO_CTRL = 0x0F;  // max speed index, no badline stall
}

void disable_turbo(void) {
    TURBO_CTRL = 0x00;
}

bool is_u64(void) {
    return TURBO_CTRL != 0xFF;
}
```

---

## Ultimate 64: Audio Layer

Reference: `ModPlayer_16k` by 6510nl (local reference at `/mnt/c/Users/xande/Downloads/ModPlayer_16k`)  
Also: https://github.com/6510nl/48MHz

The Ultimate Audio module provides **7 hardware DMA voices** with 8-bit PCM samples. It must be enabled in the U64's "C64 and cartridge settings" menu. Samples can reside in C64 RAM, REU, or the U64's internal 16 MB SDRAM.

### Channel base addresses

```c
#define AUDCH1  0xDF20
#define AUDCH2  0xDF40
#define AUDCH3  0xDF60
#define AUDCH4  0xDF80
#define AUDCH5  0xDFA0
#define AUDCH6  0xDFC0
#define AUDCH7  0xDFE0
```

### Register offsets (applied to each channel base)

| Offset | Name | Width | Direction | Description |
|--------|------|-------|-----------|-------------|
| `$00` | `audist` | 8-bit | Read | Interrupt status |
| `$01` | `audver` | 8-bit | Read | Version |
| `$00` | `audctr` | 8-bit | Write | Control (start/stop/loop) |
| `$01` | `audvol` | 8-bit | Write | Volume |
| `$02` | `audpan` | 8-bit | Write | Panning |
| `$04` | `audsms` | 32-bit | Write | Sample start address (4 bytes, LSB first) |
| `$09` | `audsml` | 24-bit | Write | Sample length (3 bytes) |
| `$0E` | `audrat` | 16-bit | Write | Playback rate / period (2 bytes) |
| `$11` | `audrpa` | 24-bit | Write | Repeat point A (3 bytes) |
| `$15` | `audrpb` | 24-bit | Write | Repeat point B (3 bytes) |
| `$1F` | `audirq` | 8-bit | Write | IRQ settings / acknowledge |

Sample rate is derived from a **6.25 MHz reference clock** divided by the `audrat` value.

### Control register (`audctr`) bit layout

From the detection routine, `%00000101` starts a voice. Bit meanings (from ModPlayer usage):
- Bit 0: Start/enable voice
- Bit 2: Loop/repeat enable
- Write `$00` to stop, then write the desired value to start (always stop before re-triggering)

### Detection

```c
// Returns true if Ultimate Audio module is present
bool detect_audio(void) {
    volatile unsigned char *ch1 = (volatile unsigned char *)AUDCH1;
    ch1[0x00] = 0;           // stop
    ch1[0x1F] = 0xFF;        // ack all IRQs
    // Read audist 256 times — should stay 0
    for (int i = 0; i < 256; i++)
        if (ch1[0x00] != 0) return false;
    return true;
}
```

### Example: trigger a one-shot sample

```c
void play_sample(unsigned int ch_base,
                 unsigned long start_addr,
                 unsigned long length,
                 unsigned int  rate,
                 unsigned char volume,
                 unsigned char pan) {
    volatile unsigned char *ch = (volatile unsigned char *)ch_base;
    ch[0x00] = 0;                           // stop
    ch[0x01] = volume;
    ch[0x02] = pan;
    ch[0x04] = (start_addr)       & 0xFF;   // audsms LSB
    ch[0x05] = (start_addr >> 8)  & 0xFF;
    ch[0x06] = (start_addr >> 16) & 0xFF;
    ch[0x07] = (start_addr >> 24) & 0xFF;
    ch[0x09] = (length)           & 0xFF;   // audsml
    ch[0x0A] = (length >> 8)      & 0xFF;
    ch[0x0B] = (length >> 16)     & 0xFF;
    ch[0x0E] = rate        & 0xFF;          // audrat LSB
    ch[0x0F] = (rate >> 8) & 0xFF;
    ch[0x00] = 0x01;                        // start, no loop
}
```

---

## REU (RAM Expansion Unit)

The U64 exposes a 16 MB REU at `$DF00`; sample data too large for C64 RAM lives here.  
Oscar64 provides `include/c64/reu.h`. Key registers:

| Address | Register |
|---------|---------|
| `$DF00` | Status |
| `$DF01` | Command (`$90\|$00` C64→REU, `$90\|$01` REU→C64, `$90\|$03` compare) |
| `$DF02` | C64 base address (2 bytes) |
| `$DF04` | REU base address (3 bytes) |
| `$DF07` | Transfer length (2 bytes) |
| `$DF09` | IRQ mask |
| `$DF0A` | Control |

---

## Target Platform Notes

- Primary target: C64 (`-tm=c64`), output `.prg`
- Enable turbo in firmware menu: "Turbo Mode" → "U64 Turbo Registers"
- Enable audio in firmware menu: "C64 and cartridge settings" → enable Ultimate Audio at `$DF20`
- Audio and REU share the `$DF00`–`$DFFF` range; ensure cartridge settings don't conflict
