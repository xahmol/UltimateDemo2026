/*****************************************************************
Ultimate 64 Turbo Control Library

Targets the U64-specific $D031 turbo speed register.
Firmware menu must have "Turbo Mode" set to "U64 Turbo Registers"
(or "Turbo Enable Bit" with the enable bit set) for detection to
work.

Detection reads $D031 directly.  All C64-visible hardware timers
(CIA timer, VIC raster, CIA TOD) on U64 are clocked at the CPU
frequency and cannot measure real wall-clock time, so timing-based
detection is not feasible.

Note on 48 MHz vs 64 MHz distinction: both Elite-I (48 MHz max)
and Elite-II / C64U (64 MHz max) set $D031 to speed index 0x0F
at maximum speed.  The hardware maximum cannot be determined from
software registers alone on U64.  TURBO_64MHZ is reported for
speed index 0x0F (assumed Elite-II/C64U); on Elite-I this will
display "64 MHz" cosmetically while the hardware runs at 48 MHz.

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
// firmware), OR speed index == 0 with $D030 bit 0 clear (1 MHz,
// turbo not active).

#define TURBO_48MHZ        1
// Turbo active at speed index 0x01–0x0E (any speed below max).
// Also returned when $D031 == 0 but $D030 bit 0 is set
// (Turbo-Enable-Bit mode).

#define TURBO_64MHZ        2
// Speed index == 0x0F (maximum).  Assumed to be 64 MHz on
// Elite-II / C64U; will show "64 MHz" on Elite-I (48 MHz) too.

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

// Define standard number of iterations for benchmark_delay
#define ITERS 1000
#define THRESHOLD_SLOW 70
#define THRESHOLD_FAST 2

// ---------------------------------------------------------------
// Function prototypes
// ---------------------------------------------------------------

int benchmark_delay(int iters);
// Measures elapsed time using CIA 2 Timer B, which counts system clock ticks at 1/60th of a second per tick.
// Input: iters = number of loop iterations to burn CPU cycles.
// Output: elapsed time in system clock ticks (1/60ths of a second).

char turbo_detect(void);
/*
  Detect turbo status from $D031 speed index.

  Returns:
    TURBO_NOT_PRESENT  — $D031 == $FF, or speed index 0 with
                         $D030 bit 0 clear (no turbo active)
    TURBO_48MHZ        — speed index 0x01–0x0E, or Turbo-Enable-Bit
                         mode ($D031==0, $D030 bit 0 set)
    TURBO_64MHZ        — speed index 0x0F (maximum speed)

  Call once at startup.
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
