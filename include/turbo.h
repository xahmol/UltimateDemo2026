/*****************************************************************
Ultimate 64 Turbo Control Library

Targets the U64-specific $D031 turbo speed register.
Firmware menu must have "Turbo Mode" set to "U64 Turbo Registers"
for detection to work correctly.

Detection method — CIA TOD timing against a hand-written assembly loop:
  turbo_detect() calls benchmark_delay() which uses CIA1 TOD
  (Time Of Day) as a real-time reference.  The measured function is a
  short, hand-written 6502 assembly loop (a standard borrow-based
  16-bit decrement-to-zero counter, #pragma optimize(0), __noinline)
  with a fixed, precisely computable cycle cost per count -- not a
  deliberately-unoptimised C loop.  Per guidance from Bart van
  Leeuwen (private correspondence, 2026-09-20): a short, tight,
  hand-written loop has far less timing jitter than compiler-
  generated code, even at -O0, so far less safety margin is needed
  around THRESHOLD_DETECT.  turbo_detect() also runs one throwaway
  benchmark_delay() pass immediately after setting the speed register,
  purely to let the FPGA clock-domain change settle before the real
  measurement starts.  The measured result (tenths of a second) is
  compared against a single threshold to confirm turbo is genuinely
  engaged.

Note: simple CIA timer B or VIC raster measurements do NOT work on
U64 because both are clocked at the CPU frequency — they track CPU
cycles, not real time.  CIA TOD advances at real 50/60 Hz regardless
of CPU speed, which is what benchmark_delay()'s loop exploits.

This library deliberately does NOT try to classify 48 MHz vs 64 MHz
from the timing measurement -- that distinction is a hardware-model
fact (see below), and measuring it via elapsed time proved unreliable
in practice (same hardware, same speed setting, classified differently
across two consecutive runs -- the measurement sits too close to the
48-vs-64 boundary to trust). For the MHz ceiling, query
CTRL_CMD_GET_HWINFO's product-name string at the application level
instead: plain "Ultimate 64" is now ambiguous (see below), "Ultimate
64 Elite" (Elite I, no "-II") = ~48 MHz, "Ultimate 64-II" = ~64 MHz.
Gideon Zweijtzer confirmed this field of GET_HWINFO stays supported
long-term (only the command's separate SID-ID subpart is deprecated).
This is meant to be a compile-time-fixed identity string, not a
measurement. See src/main.c in UltimateDemo2026 for a worked example.

2026-09-23: revisited and closed. Tried a longer, continuous (single
CIA1-TOD reset/read, no per-pass reset) benchmark against a real
Ultimate 64-II at both the 48 MHz speed index and MAX, specifically to
see whether a long-enough loop could resolve the two tiers where a
single COUNT=0xFFFF pass can't (both read 0 tenths -- below the 100ms
quantization floor). Result: no. Elapsed times for the same speed
index and roughly-comparable loop lengths were themselves inconsistent
run to run (e.g. one run's 4x-shorter loop measured a *longer* elapsed
time than a prior run's longer loop, at nominally the same settings),
and both speed tiers measured far below their labeled MHz for any
multi-second continuous pass (effective throughput in the low single-
digit MHz range at a "48 MHz" or "64 MHz" setting). Most likely cause:
holding SEI for several seconds straight -- which every measurement in
this family requires, to keep other interrupt-driven activity from
disturbing the reading -- may itself trigger some real, unexplored
throttling or wait-state behavior on this hardware, rather than the
CPU genuinely sustaining its labeled clock throughout. Whatever the
mechanism, this confirms (with new, independent real-hardware data)
that CIA-TOD timing cannot be made to reliably resolve 48 vs 64 MHz,
not just that a single short pass lacks resolution -- a longer pass
makes the measurement less trustworthy, not more. Final decision:
GET_HWINFO's product string is the only signal this project uses for
MHz classification, permanently. The one known gap (plain "Ultimate
64" being ambiguous between C64U and genuine non-Elite U64) is not
being chased further either -- see src/main.c's classification comment
for the accepted tradeoff (only the distinct "Ultimate 64 Elite"
string is trusted for 48 MHz; everything else, including the ambiguous
bare string, defaults to 64 MHz -- so only a genuine non-Elite U64
owner ever sees a wrong label).

CONFIRMED (2026-09-20, real hardware): Commodore 64 Ultimate (C64U),
current Commodore firmware ("1.1"), reports plain "Ultimate 64" --
identical to the original non-Elite U64's string, not "C64 Ultimate"
as an earlier REST-API-sourced claim (2026-09-16) had it. Confirmed by
forum report + screenshot from a real C64U unit; matches what
UE2-C64U-Emulator had already shown running the same firmware image
(genuine result, not an emulator artifact -- that earlier uncertainty
is resolved). Since GET_HWINFO alone can't distinguish C64U (64 MHz)
from genuine non-Elite U64 (48 MHz) anymore, classification code needs
to pick a default for the ambiguous case -- UltimateDemo2026 now
defaults plain "Ultimate 64" to 64 MHz, since C64U is both the more
common case today and documented as 64 MHz-capable everywhere else;
genuine non-Elite U64 owners will see an optimistic label as the
accepted tradeoff. See src/main.c's own comment on this for the
worked example of that decision.

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
// COUNT: 16-bit down-counter value passed to benchmark_delay().
// THRESHOLD_DETECT: elapsed tenths of a second at or above which
//   the CPU is running at ~1 MHz (no turbo or turbo disabled).
//   Below this, turbo is genuinely engaged (TURBO_DETECTED),
//   regardless of which MHz tier the hardware actually reaches.
//
// 2026-09-20: replaced the deliberately-unoptimised C loop (ITERS=300,
// outer*inner=60000 nop-loop passes) with a hand-written assembly
// borrow-based 16-bit decrement loop (see turbo.c) -- Bart van Leeuwen's
// guidance was that a short, fixed-cycle-cost assembly loop has far less
// timing jitter than compiler-generated -O0 code, needing far less safety
// margin. COUNT=0xFFFF (max 16-bit range, one pass) was originally a
// COMPUTED estimate from the loop's known cycle cost (~20.016
// cycles/count, see turbo.c):
//   ~1,310,700 cycles/pass -> ~13.1 tenths at 1 MHz (no turbo)
//                           -> ~0.27 tenths at 48 MHz, ~0.20 tenths at 64 MHz
//
// 2026-09-23: empirically re-measured on real Ultimate 64-II hardware via
// c64bridge (src/test_turbocal.c probe), confirming the estimate's order
// of magnitude and THRESHOLD_DETECT=6's placement:
//   1 MHz baseline:  elapsed = 12 (close to the ~13.1 estimate)
//   64 MHz (MAX):    elapsed = 0  (well under threshold, correctly DETECTED)
// This same session also found and fixed a real false-negative in
// turbo_detect() itself (an unclean speed transition when an auto-loaded
// .cfg leaves $D031 pre-set to a non-zero index -- see turbo.c's own
// comment on turbo_detect()); the false-negative was a transition-
// settling bug, not a THRESHOLD_DETECT/COUNT miscalibration -- these
// constants were already correct once the transition itself was fixed.
// THRESHOLD_DETECT=6 sits roughly halfway between the two, well clear of
// both sides.
// ---------------------------------------------------------------
#define COUNT              0xFFFF
#define THRESHOLD_DETECT        6   // ≥ 6 tenths → no turbo / 1 MHz

// ---------------------------------------------------------------
// Function prototypes
// ---------------------------------------------------------------

int benchmark_delay(unsigned int count);
/*
  Run a short, hand-written 6502 assembly counting loop (a
  borrow-based 16-bit decrement-to-zero counter -- see turbo.c) and
  return elapsed time in CIA1 TOD tenths of a second (10ths; range
  0–99 for <10 s).

  The function uses #pragma optimize(0) and __noinline purely to stop
  the compiler from disturbing the hand-written __asm block or its
  surrounding hi/lo setup -- the cycle cost itself comes from the
  assembly, not from suppressing C optimisation. Each count costs a
  fixed, computable number of cycles (~20.016 avg -- see turbo.c),
  which gives CIA TOD enough time to advance with far less run-to-run
  jitter than a compiler-generated loop.

  Resets CIA1 TOD to 00:00.0 on entry and reads it on exit.
  SEI/CLI wraps the measurement. `count` is destroyed by the loop.
*/

char turbo_detect(void);
/*
  Detect whether turbo is genuinely engaged, via CIA TOD timing.

  Forces a clean 1 MHz baseline first (its own settle pass), then sets
  CPU to maximum speed and calls benchmark_delay(COUNT) twice more --
  once as a throwaway pass to let the FPGA clock-domain change settle,
  once to measure. The elapsed time (CIA1 TOD tenths) is compared
  against a single threshold:

  Returns:
    TURBO_NOT_PRESENT  — elapsed ≥ THRESHOLD_DETECT (≈1 MHz, not engaged)
    TURBO_DETECTED     — elapsed <  THRESHOLD_DETECT (genuinely accelerated)

  Does NOT classify the MHz ceiling -- see the file header for why,
  and how to get that from CTRL_CMD_GET_HWINFO instead.

  The forced 1 MHz baseline pass exists because an auto-loaded .cfg's
  own Turbo Control setting can leave $D031 already at a non-zero speed
  index before this function ever runs -- jumping straight from that
  state to max speed was found to settle unreliably on real Ultimate
  64-II hardware (intermittent false TURBO_NOT_PRESENT, confirmed via
  c64bridge real-hardware testing, 2026-09-23). See turbo.c's own
  comment on this function for the full real-hardware finding.

  Restores $D031 to 1 MHz after measuring.
  Call once at startup; worst case (no turbo present) takes ~3.9s at
  1 MHz across the three benchmark_delay() passes, ~0.05s if turbo is
  genuinely engaged.
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
