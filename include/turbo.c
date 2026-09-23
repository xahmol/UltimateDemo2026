/*****************************************************************
Ultimate 64 Turbo Control Library — implementation
See turbo.h for API documentation.
******************************************************************/

#include "turbo.h"
#include <c64/cia.h>
#include "../src/screen.h"
#include <string.h>
#include "defines.h"
#include <petscii.h>

// ---------------------------------------------------------------
// Register addresses
// ---------------------------------------------------------------
#define TURBO_D030  (*(volatile unsigned char *)0xD030)
#define TURBO_D031  (*(volatile unsigned char *)0xD031)

#pragma optimize(0);
// Hand-written 16-bit down-counter loop -- deliberately NOT relying on
// compiler-generated code to burn cycles (per Bart van Leeuwen, private
// correspondence 2026-09-20: a short, hand-written assembly loop with a
// fixed, computable cycle cost per iteration has far less timing jitter
// than even deliberately-unoptimised C, so far less safety margin is
// needed around THRESHOLD_DETECT). Standard borrow-based 16-bit decrement
// to zero -- correct for every count in 1..65535 (unlike the naive
// dex/dey/bne,bne pattern, which mis-handles a zero high byte).
//
// Cycle cost per count: 20 cycles normally, +4 cycles once per 256
// counts (the borrow path) -- i.e. ~20.016 cycles/count, fully
// deterministic and computable from `count` alone.
//
// Input: count = 16-bit down-counter value (NOT a real-time unit --
//   see turbo.h file header). Destroyed by the loop; not used after.
// Output: elapsed real time in CIA1 TOD tenths of a second.
__noinline int benchmark_delay(unsigned int count)
{
    // volatile: without it, Oscar64's optimizer aliases hi/lo to the same
    // storage cell whenever they happen to hold equal values (confirmed via
    // .asm inspection -- silently degenerates the loop to an 8-bit, 255-max
    // count). volatile forces genuinely separate, non-folded storage.
    volatile unsigned char hi = (unsigned char)(count >> 8);
    volatile unsigned char lo = (unsigned char)(count & 0xFF);

    __asm{sei};
    cia1.tods = 0;
    cia1.todt = 0;
    __asm {
    bd_loop:
        lda lo
        bne bd_skipborrow
        dec hi
    bd_skipborrow:
        dec lo
        lda lo
        ora hi
        bne bd_loop
    }
    __asm{cli};

    return cia1.tods*10 + cia1.todt;
}
#pragma optimize(1);

// ---------------------------------------------------------------
// turbo_detect
//
// Confirms turbo is genuinely engaged via CIA1 TOD timing using
// benchmark_delay() -- does not classify the MHz ceiling; see
// turbo.h's file header for why, and TURBOCONTROLMANUAL.md for a
// full explanation of the detection method.
// ---------------------------------------------------------------
char turbo_detect(void)
{
    unsigned int elapsed;

    if (TURBO_D031 == (char)0xFF) return TURBO_NOT_PRESENT;

    // Force a clean 1 MHz baseline first, with its own settle pass, before
    // transitioning to max speed. Real-hardware finding (2026-09-23, via
    // c64bridge against Ultimate 64-II, root-caused with a temporary debug
    // hook writing intermediate values to fixed RAM addresses): an
    // auto-loaded .cfg's own Turbo Control setting (see the project's
    // UltimateDemo2026-U64E2.cfg) can leave $D031 already at a non-zero
    // speed index by the time turbo_detect() runs, even before this code
    // ever touches it. Jumping directly from that pre-existing state
    // straight to TURBO_SPEED_MAX measured a false TURBO_NOT_PRESENT
    // roughly half the time (elapsed ~8 tenths, close to the true 1 MHz
    // baseline of ~12) -- reproducible across repeated soft resets of the
    // exact same binary. Forcing 1 MHz first (a genuine $D030 enable-bit
    // 1->0 transition) and letting it settle before the 1 MHz->max jump
    // fixed it: confirmed [ OK ] 64 MHz on three consecutive real-hardware
    // runs after this change, versus intermittent false FAIL before it.
    turbo_set(TURBO_SPEED_1MHZ);
    benchmark_delay(COUNT);   // settle pass, discarded

    // Set to max speed
    turbo_set(TURBO_SPEED_MAX);

    // Settle delay: give the FPGA clock domain change time to actually
    // take effect before the timed measurement starts. The result is
    // discarded -- its only job is to run past the speed-change transient.
    benchmark_delay(COUNT);

    // Measure.  The elapsed time will be much lower with a real turbo than without.
    elapsed = benchmark_delay(COUNT);

    // Restore original speed settings to avoid side effects.
    turbo_set(TURBO_SPEED_1MHZ);

    // Interpret results.  With turbo off, elapsed should be around COUNT/5000 tenths.
    return (elapsed < THRESHOLD_DETECT) ? TURBO_DETECTED : TURBO_NOT_PRESENT;
}

// ---------------------------------------------------------------
// turbo_set — sets speed via $D030 + $D031 (both firmware modes)
// ---------------------------------------------------------------
void turbo_set(char control)
{
    if (control == TURBO_SPEED_1MHZ) {
        TURBO_D031 = control;
        TURBO_D030 &= ~0x01;
    } else {
        TURBO_D030 |= 0x01;
        TURBO_D031 = control;
    }
}

void turbo_fast(void) { turbo_set(TURBO_SPEED_MAX | TURBO_BADLINES_OFF); }
void turbo_slow(void) { turbo_set(TURBO_SPEED_1MHZ); }

unsigned char turbo_get(void) { return TURBO_D031; }
