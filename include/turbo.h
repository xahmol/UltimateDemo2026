/*****************************************************************
Ultimate 64 Turbo Control Library

Targets the U64-specific $D031 turbo speed register.
Firmware menu must have "Turbo Mode" set to "U64 Turbo Registers"
for detection to work correctly.

Detection method — CIA TOD timing with deliberate loop overhead:
  turbo_detect() calls benchmark_delay() which uses CIA1 TOD
  (Time Of Day) as a real-time reference.  The measured function
  runs a deliberately unoptimised double loop (#pragma optimize(0),
  volatile int variables, __noinline) so each iteration takes many
  more CPU cycles than a typical optimised loop.  This makes the
  loop long enough in real time for CIA TOD tenths to advance even
  at turbo speed.  The result (tenths of a second) is compared
  against a single threshold to confirm turbo is genuinely engaged.

Note: simple CIA timer B or VIC raster measurements do NOT work on
U64 because both are clocked at the CPU frequency — they track CPU
cycles, not real time.  CIA TOD advances at real 50/60 Hz when the
deliberately slow (unoptimised) loop runs long enough.

This library deliberately does NOT try to classify 48 MHz vs 64 MHz
from the timing measurement -- that distinction is a hardware-model
fact (see below), and measuring it via elapsed time proved unreliable
in practice (same hardware, same speed setting, classified differently
across two consecutive runs -- the measurement sits too close to the
48-vs-64 boundary to trust). For the MHz ceiling, query
CTRL_CMD_GET_HWINFO's product-name string at the application level
instead: "Ultimate 64" / "Ultimate 64 Elite" = ~48 MHz, "Ultimate
64-II" = ~64 MHz. Gideon Zweijtzer confirmed this field of
GET_HWINFO stays supported long-term (only the command's separate
SID-ID subpart is deprecated). Commodore 64 Ultimate (C64U) reports
"C64 Ultimate" (confirmed via the REST API's /v1/info, which returns
the same underlying string, per Fredrik Aberg -- 2026-09-16); every
C64U shipped so far is 64 MHz-capable. This is a compile-time-fixed
identity string, not a measurement, so it doesn't have the timing
approach's failure mode. See src/main.c in UltimateDemo2026 for a
worked example.

Supported hardware:
  Ultimate 64 original / Elite I  — max ~48 MHz
  Ultimate 64 Elite II / C64U     — max ~64 MHz
******************************************************************/

#ifndef _TURBO_H_
#define _TURBO_H_

// ---------------------------------------------------------------
// Detection result constants
// ---------------------------------------------------------------

#define TURBO_NOT_PRESENT  0
// $D031 reads $FF (no U64, or turbo registers not enabled in
// firmware), OR the CIA-TOD benchmark shows no real speedup
// (turbo not genuinely engaged, even if the register write "took" --
// e.g. firmware's own Turbo Mode menu setting isn't honoring it).

#define TURBO_DETECTED     1
// Turbo is genuinely engaged and accelerating the CPU. This only
// confirms THAT turbo is active, not HOW FAST -- see the file header
// above for why, and how to get the MHz ceiling instead.

// ---------------------------------------------------------------
// $D031 control byte composition
//
//   bits 0-3 : speed index  (0 = 1 MHz, 15 = max)
//   bit  7   : badline mask (0 = normal stalls, 1 = suppress)
//   bits 4-6 : reserved, write 0
// ---------------------------------------------------------------

#define TURBO_SPEED_1MHZ    0x00   // Standard 1 MHz
#define TURBO_SPEED_2MHZ    0x01
#define TURBO_SPEED_3MHZ    0x02
#define TURBO_SPEED_4MHZ    0x03
#define TURBO_SPEED_6MHZ    0x04
#define TURBO_SPEED_8MHZ    0x05
#define TURBO_SPEED_12MHZ   0x06
#define TURBO_SPEED_16MHZ   0x07
#define TURBO_SPEED_20MHZ   0x08
#define TURBO_SPEED_24MHZ   0x09
#define TURBO_SPEED_28MHZ   0x0A
#define TURBO_SPEED_32MHZ   0x0B
#define TURBO_SPEED_36MHZ   0x0C
#define TURBO_SPEED_40MHZ   0x0D
#define TURBO_SPEED_48MHZ   0x0E
#define TURBO_SPEED_MAX     0x0F   // Highest supported by this hardware

#define TURBO_BADLINES_ON   0x00   // Normal VIC-II badline CPU stalls
#define TURBO_BADLINES_OFF  0x80   // Suppress badline stalls

// Convenience: full-speed control byte
#define TURBO_FULL  (TURBO_SPEED_MAX | TURBO_BADLINES_OFF)

// ---------------------------------------------------------------
// benchmark_delay() calibration constants
//
// ITERS: outer loop count for benchmark_delay().
// THRESHOLD_DETECT: elapsed tenths of a second at or above which
//   the CPU is running at ~1 MHz (no turbo or turbo disabled).
//   Below this, turbo is genuinely engaged (TURBO_DETECTED),
//   regardless of which MHz tier the hardware actually reaches.
// ---------------------------------------------------------------
#define ITERS               1000
#define THRESHOLD_DETECT      70   // ≥ 70 tenths → no turbo / 1 MHz

// ---------------------------------------------------------------
// Function prototypes
// ---------------------------------------------------------------

int benchmark_delay(int iters);
/*
  Run a deliberately slow CPU loop and return elapsed time in
  CIA1 TOD tenths of a second (10ths; range 0–99 for <10 s).

  The function uses #pragma optimize(0) and __noinline with
  volatile int loop counters and inline __asm{nop} to prevent
  the compiler from shortening the loop.  This makes each
  iteration take significantly more CPU cycles than optimised
  code, which gives CIA TOD enough time to advance.

  Resets CIA1 TOD to 00:00.0 on entry and reads it on exit.
  SEI/CLI wraps the measurement.
*/

char turbo_detect(void);
/*
  Detect whether turbo is genuinely engaged, via CIA TOD timing.

  Sets CPU to maximum speed, then calls benchmark_delay(ITERS)
  twice — once to stabilise, once to measure.  The elapsed time
  (CIA1 TOD tenths) is compared against a single threshold:

  Returns:
    TURBO_NOT_PRESENT  — elapsed ≥ THRESHOLD_DETECT (≈1 MHz, not engaged)
    TURBO_DETECTED     — elapsed <  THRESHOLD_DETECT (genuinely accelerated)

  Does NOT classify the MHz ceiling -- see the file header for why,
  and how to get that from CTRL_CMD_GET_HWINFO instead.

  Restores $D031 to 1 MHz after measuring.
  Call once at startup; takes a few seconds at 1 MHz.
*/

void turbo_set(char control);
/*
  Write `control` directly to $D031 and enable via $D030.

  `control` = speed_index | badlines_flag, e.g.:
      turbo_set(TURBO_SPEED_MAX | TURBO_BADLINES_OFF);
      turbo_set(TURBO_FULL);
      turbo_set(TURBO_SPEED_1MHZ);

  Change takes effect on the very next CPU cycle.
*/

void turbo_fast(void);
// Shorthand: turbo_set(TURBO_SPEED_MAX | TURBO_BADLINES_OFF).

void turbo_slow(void);
// Shorthand: turbo_set(TURBO_SPEED_1MHZ).

unsigned char turbo_get(void);
// Read the current $D031 value (0xFF if registers not available).

#pragma compile("turbo.c")

#endif
