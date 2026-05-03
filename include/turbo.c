/*****************************************************************
Ultimate 64 Turbo Control Library — implementation
See turbo.h for API documentation.
******************************************************************/

#include "turbo.h"

// ---------------------------------------------------------------
// Register addresses
// ---------------------------------------------------------------
#define TURBO_D030  (*(volatile unsigned char *)0xD030)
#define TURBO_D031  (*(volatile unsigned char *)0xD031)

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
    unsigned char speed_index;

    if (d031_saved == (char)0xFF) return TURBO_NOT_PRESENT;

    speed_index = (unsigned char)(d031_saved & 0x0F);

    if (speed_index == 0x0F) return TURBO_64MHZ;
    if (speed_index >= 0x0E) return TURBO_48MHZ;
    if (speed_index >  0x00) return TURBO_48MHZ;

    // speed_index == 0: $D031 not written (Turbo-Enable-Bit mode?).
    // $D030 bit 0 set indicates turbo-enable is active on U64.
    if (d030_saved & 0x01) return TURBO_48MHZ;

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
