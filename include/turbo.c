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
// Measues in CIA TOD time units (1/60th of a second).  With turbo off, 1500 iters ≈ 1 second.
// Input: iters = number of loop iterations to burn CPU cycles.
// Output: elapsed time in 1/60ths of a second.  With turbo off, result ≈ iters / 1500.
__noinline int benchmark_delay(int iters)
{
    volatile int i,j;
    __asm{sei};
    cia1.tods = 0;
    cia1.todt = 0;
    for (i = 0; i < iters; i++)
    {
        // Burn CPU cycles in a way that won't be optimized out.
        // The loop overhead is negligible compared to the delay from the iterations.
        for(j = 0; j < 200; j++)
        {
            __asm { nop }
        }
    }
    __asm{cli};

    return cia1.tods*10 + cia1.todt;
}
#pragma optimize(1);

// ---------------------------------------------------------------
// turbo_detect
//
// Reads $D031 speed index set by the firmware.  All C64-visible
// hardware timers (CIA, VIC raster, CIA TOD) on U64 are clocked at
// the CPU frequency, so none provide an independent real-time
// reference usable for speed measurement.
//
// Detection:
//   $D031 == 0xFF : no U64 turbo registers → TURBO_NOT_PRESENT
//   bits 0–3 == 0x0F : max speed (64 MHz on Elite-II/C64U) → TURBO_64MHZ
//   bits 0–3 == 0x0E : 48 MHz → TURBO_48MHZ
//   bits 0–3 > 0    : turbo at lower speed → TURBO_48MHZ
//   bits 0–3 == 0 AND $D030 bit 0 set : Turbo-Enable-Bit mode active
//                                        → TURBO_48MHZ
//   otherwise       : 1 MHz, no turbo → TURBO_NOT_PRESENT
// ---------------------------------------------------------------
char turbo_detect(void)
{
    char d030_saved = TURBO_D030;
    char d031_saved = TURBO_D031;
    unsigned int elapsed;

    if (d031_saved == (char)0xFF) return TURBO_NOT_PRESENT;

    // Set soeed to max of machine
    turbo_set(TURBO_SPEED_MAX);

    // Do first delay to give Ultimate firmware time to apply the new speed setting and stabilize.
    benchmark_delay(ITERS);

    // Do second delay to measure the speed.  The elapsed time will be much lower with a real turbo than without.
    elapsed = benchmark_delay(ITERS);

    // Restore original speed settings to avoid side effects.
    turbo_set(TURBO_SPEED_1MHZ);

    // Interpret results.  With turbo off, elapsed should be around 60–70 ticks per 1000 iterations.
    if(elapsed < THRESHOLD_FAST) {
        return TURBO_64MHZ;
    } else if (elapsed < THRESHOLD_SLOW) {
        return TURBO_48MHZ;
    }

    return TURBO_NOT_PRESENT;
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
