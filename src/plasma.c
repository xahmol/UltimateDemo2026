// UltimateDemo2026 — Plasma effect
//
// Per-pixel 2D sine-wave interference mapped to 4-color MC palette.
// Three phase counters t1/t2/t3 advance each frame; per-pixel color =
// sin_lut[(x+t1)&63] + sin_lut[(y+t2)&63] + sin_lut[((x+y)>>1+t3)&63]
// summed and mapped 0-3 by a second LUT (sum ranges 0-9 → color 0-3).
//
// Precomputed row_sin[y] halves per-pixel LUT lookups.
// MC bitmap: same VIC bank-3 layout as mandel ($C000 screen, $E000 bitmap).
// Runs at 64 MHz; MOD music continues via CIA IRQ.

#include <c64/vic.h>
#include <c64/memmap.h>
#include <string.h>
#include "turbo.h"
#include "plasma.h"

#define PL_SCREEN  ((char *)0xC000)
#define PL_BITMAP  ((char *)0xE000)
#define PL_CRAM    ((char *)0xD800)

// 64-entry sine LUT: values 0-3, one full period.
// Generated: round(1.5 + 1.5*sin(2*pi*i/64)), clamped 0-3.
static const unsigned char sin_lut[64] = {
    2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,
    3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,
    2,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1
};

// Sum of three 0-3 values = 0-9; map to MC color index 0-3.
// 0-2→0 (black), 3-4→1 (col1), 5-6→2 (col2), 7-9→3 (col3)
static const unsigned char sum_to_col[10] = { 0,0,0,1,1,2,2,3,3,3 };

// Per-row precomputed sin_lut[(y+t2)&63] — fills each frame
static unsigned char row_sin[200];

static void plasma_init(void)
{
    unsigned int i;
    mmap_set(MMAP_NO_ROM);
    memset(PL_BITMAP, 0, 8000);

    // Purple / cyan / yellow / white palette
    // c0 ($D021 bg): black=0
    // screen RAM byte: lo nib c2, hi nib c1
    // color RAM: c3
    // c1=cyan(3), c2=purple(4), c3=yellow(7)
    for (i = 0; i < 1000; i++) {
        PL_SCREEN[i] = (char)0x34;   // c1=cyan(3), c2=purple(4)
        PL_CRAM[i]   = (char)7;      // c3=yellow
    }

    vic_setmode(VICM_HIRES_MC, PL_SCREEN, PL_BITMAP);
    vic.color_back   = VCOL_BLACK;
    vic.color_border = VCOL_BLACK;
}

static void plasma_done(void)
{
    mmap_set(MMAP_NO_BASIC);
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
    vic.color_border = 0;
    vic.color_back   = 0;
    // Clear text screen so the transition to tunnel has no text flash
    memset((char *)0x0400, 32, 1000);
}

static void plasma_frame(unsigned char t1, unsigned char t2, unsigned char t3)
{
    unsigned char y;

    // Precompute row sines
    for (y = 0; y < 200; y++)
        row_sin[y] = sin_lut[(y + t2) & 63];

    for (y = 0; y < 200; y++) {
        // MC bitmap row base: same char-cell layout as mandel
        char *row = PL_BITMAP + ((unsigned)y & ~7u) * 40u + ((unsigned)y & 7u);
        unsigned char ry = row_sin[y];
        unsigned char x;
        for (x = 0; x < 40; x++) {
            // Each bitmap byte covers 4 MC pixels: x*4, x*4+1, x*4+2, x*4+3
            // (each MC pixel = 2 bits)
            unsigned char px = (unsigned char)(x << 2);
            unsigned char c0, c1, c2, c3;
            unsigned char xs0 = sin_lut[(px     + t1) & 63];
            unsigned char xs1 = sin_lut[(px + 1 + t1) & 63];
            unsigned char xs2 = sin_lut[(px + 2 + t1) & 63];
            unsigned char xs3 = sin_lut[(px + 3 + t1) & 63];
            unsigned char d0  = sin_lut[((px     + y) >> 1) + t3 & 63];
            unsigned char d1  = sin_lut[((px + 1 + y) >> 1) + t3 & 63];
            unsigned char d2  = sin_lut[((px + 2 + y) >> 1) + t3 & 63];
            unsigned char d3  = sin_lut[((px + 3 + y) >> 1) + t3 & 63];
            c0 = sum_to_col[xs0 + ry + d0];
            c1 = sum_to_col[xs1 + ry + d1];
            c2 = sum_to_col[xs2 + ry + d2];
            c3 = sum_to_col[xs3 + ry + d3];
            row[x * 8] = (char)((c0 << 6) | (c1 << 4) | (c2 << 2) | c3);
        }
    }
}

void plasma_run(void)
{
    unsigned char t1 = 0, t2 = 0, t3 = 0;
    unsigned int  frame;
    unsigned int  i;

    plasma_init();

    // First effect: 350 frames, cyan/purple/yellow palette
    for (frame = 0; frame < 350; frame++) {
        plasma_frame(t1, t2, t3);
        vic_waitFrame();
        t1 = (unsigned char)(t1 + 1);
        t2 = (unsigned char)(t2 + 2);
        t3 = (unsigned char)(t3 + 1);
    }

    // Switch to second palette: orange/red/yellow — more pulsating feel
    for (i = 0; i < 1000; i++) {
        PL_SCREEN[i] = (char)0x82;   // c1=orange(8 hi), c2=red(2 lo)
        PL_CRAM[i]   = (char)7;      // c3=yellow
    }
    vic.color_back = VCOL_BLACK;

    // Second effect: 350 frames, faster phase increments for pulsating look
    for (frame = 0; frame < 350; frame++) {
        plasma_frame(t1, t2, t3);
        vic_waitFrame();
        t1 = (unsigned char)(t1 + 2);
        t2 = (unsigned char)(t2 + 3);
        t3 = (unsigned char)(t3 + 2);
    }

    plasma_done();
}
