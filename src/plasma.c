// UltimateDemo2026 — Plasma effect
//
// Per-pixel 2D sine-wave interference mapped to 4-color MC palette.
// Three phase counters t1/t2/t3 advance each frame; per-pixel color =
// sin_lut[(x+t1)&63] + sin_lut[(y+t2)&63] + sin_lut[((x+y)>>1+t3)&63]
// summed and mapped 0-3 by a second LUT (sum ranges 0-9 → color 0-3).
// sum_to_col is a monotonic ramp (0,0,0,1,1,2,2,3,3,3) -- structurally the
// plasma is a 4-step INTENSITY map, low to high, not 4 arbitrary hues.
//
// Precomputed row_sin[y] halves per-pixel LUT lookups.
// MC bitmap: same VIC bank-3 layout as mandel ($C000 screen, $E000 bitmap).
// Runs at 64 MHz; MOD music continues via CIA IRQ.
//
// Colour, firmware 3.15+: pixel data always references the same 4 colour
// indices (0/3/4/7, see plasma_init()) for the whole scene -- only their
// RGB *meaning* changes between the two themes, via a single
// uii_setpalette() call at scene start and again at the theme switch, no
// per-frame cost at all. That lets each theme be a genuine smooth 4-stop
// gradient (black -> deep -> bright -> near-white, matching the
// intensity-map structure above) instead of the four unrelated stock
// hues (cyan/purple/yellow, then orange/red/yellow) the original design
// was limited to. Falls back to the original stock-index-swap behaviour
// on pre-3.15 firmware, where redefining a fixed index isn't possible.
#include <c64/vic.h>
#include <c64/memmap.h>
#include <string.h>
#include "turbo.h"
#include "detect.h"
#include "ultimate_common_lib.h"
#include "palette_fx.h"
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

// which: 0 = "aqua" theme (black -> deep blue -> bright cyan -> pale
// cyan-white), 1 = "fire" theme (black -> deep red -> orange -> bright
// yellow-white). Firmware 3.15+: redefines indices 3/4/7's RGB in place
// via a single uii_setpalette() -- PL_SCREEN/PL_CRAM content (always
// pointing at those same 3 indices, set once in plasma_init()) never
// needs rewriting. Indices other than 0/3/4/7 are zeroed incidentally;
// harmless since plasma's own pixel data never references them, and
// plasma_done() resets the whole palette before the next scene anyway.
// Pre-3.15 fallback: can't redefine a stock index's RGB, so instead
// repoint the pixel data at a different pair of stock indices (the
// scene's original design).
// Base RGB per theme/index, extracted from the literal constants the
// original one-shot version of this function used, now indexable by a
// shared shimmer helper (see plasma_set_theme() below).
static const unsigned char pl_theme_rgb[2][3][3] = {
    { { 20,  40, 140}, {  0, 200, 255}, {200, 255, 255} },   // aqua: 3/4/7
    { {140,   0,   0}, {255, 120,   0}, {255, 255, 180} },   // fire: 3/4/7
};

#pragma optimize(push)
#pragma optimize(size)   // called once at scene start, once at the
                          // mid-scene theme switch, and periodically for
                          // the cycling below -- none of it the hot
                          // per-pixel loop.
// Per-colour brightness pulse (2026-09-18, third revision -- see git
// history/session notes for the two rejected earlier attempts: an
// additive shimmer that was too subtle, then a true index-ROTATION
// among the 3 shades that was too strong/not subtle in the other
// direction). User's ask: "pulsing colors for every color... but
// remaining in the same hue family." MULTIPLICATIVE brightness scaling,
// not an additive delta -- adding a flat delta to unbalanced RGB values
// shifts their HUE (changes the channels' ratio); scaling every channel
// by the same percentage keeps the ratio -- and so the hue -- exactly
// fixed, only brightness moves.
// 2026-09-20: all 3 active indices (3/4/7) now share ONE percentage
// (previously each pulsed on its own phase, offset by 11) -- with
// independent phases, the dark/mid/bright shades could drift out of
// their intended low-to-high order (the "dark" index briefly brighter
// than "bright"), undermining the intensity-map structure this whole
// scene is built on (see file header: "4-step INTENSITY map, low to
// high, not 4 arbitrary hues"). A single shared percentage applied to
// all 3 keeps their relative brightness ratios fixed at every instant
// -- only the theme's overall brightness breathes, never their order.
// Also raised the floor 35% -> 70% (was reading as "quite dark" on
// hardware) and trimmed the ceiling 180% -> 160% (less wasted headroom
// clipping at 255 for already-bright channels).
static void plasma_set_theme(unsigned char which, unsigned char phase)
{
    unsigned int i;
    unsigned char tri = (phase & 0x10)
                       ? (unsigned char)(31 - (phase & 0x1f))
                       : (unsigned char)(phase & 0x1f);
    unsigned int pct = 70 + ((unsigned int)tri * 90) / 31;   // 70..160%, shared

    if (detected_palette_support) {
        char rgb[48];
        unsigned char idx[3] = { 3, 4, 7 };
        memset(rgb, 0, 48);
        for (i = 0; i < 3; i++) {
            unsigned char c;
            for (c = 0; c < 3; c++) {
                unsigned int v = ((unsigned int)pl_theme_rgb[which][i][c] * pct) / 100;
                if (v > 255) v = 255;
                rgb[idx[i] * 3 + c] = (char)v;
            }
        }
        uii_setpalette(rgb);
    } else if (which == 0) {
        for (i = 0; i < 1000; i++) { PL_SCREEN[i] = (char)0x34; PL_CRAM[i] = (char)7; }
    } else {
        for (i = 0; i < 1000; i++) { PL_SCREEN[i] = (char)0x82; PL_CRAM[i] = (char)7; }
    }
}
#pragma optimize(pop)

static void plasma_init(void)
{
    mmap_set(MMAP_NO_ROM);
    memset(PL_BITMAP, 0, 8000);

    // Pixel data: always references indices 3/4/7 (screen RAM nibbles
    // c1=hi/c2=lo, colour RAM c3) for the whole scene, regardless of
    // firmware -- see plasma_set_theme() for how those indices then get
    // (re)coloured.
    memset(PL_SCREEN, 0x34, 1000);
    memset(PL_CRAM,   7,    1000);

    vic_setmode(VICM_HIRES_MC, PL_SCREEN, PL_BITMAP);
    vic.color_back   = VCOL_BLACK;
    vic.color_border = VCOL_BLACK;

    plasma_set_theme(0, 0);
}

#pragma optimize(push)
#pragma optimize(size)   // one-time cleanup, not the hot per-pixel loop
static void plasma_done(void)
{
    palette_fade_out(25);   // ~0.5s @ 50Hz -- see gears.c's hires_done()
    if (detected_palette_support) uii_resetpalette();   // scene leaves
        // indices 3/4/7 (and the incidentally-zeroed rest) non-stock --
        // restore before whatever scene runs next relies on real stock
        // colours (tunnel.c's own colour-RAM cycling, in particular).
    mmap_set(MMAP_NO_BASIC);
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
    vic.color_border = 0;
    vic.color_back   = 0;
    // Clear text screen so the transition to tunnel has no text flash
    memset((char *)0x0400, 32, 1000);
}
#pragma optimize(pop)

#pragma optimize(push)
#pragma optimize(2)   // force -O2, hot per-pixel loop -- see mandel.c's render()
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
#pragma optimize(pop)

void plasma_run(void)
{
    unsigned char t1 = 0, t2 = 0, t3 = 0;
    unsigned int  frame;

    plasma_init();

    // First effect: 350 frames, "aqua" theme
    {
        unsigned char shimmer = 0;
        for (frame = 0; frame < 350; frame++) {
            plasma_frame(t1, t2, t3);
            vic_waitFrame();
            t1 = (unsigned char)(t1 + 1);
            t2 = (unsigned char)(t2 + 2);
            t3 = (unsigned char)(t3 + 1);
            // Subtle shimmer -- see plasma_set_theme()'s phase comment.
            if ((frame & 7) == 0) {
                plasma_set_theme(0, shimmer);
                shimmer = (unsigned char)(shimmer + 1);
            }
        }
    }

    // Switch to the "fire" theme — more pulsating feel
    plasma_set_theme(1, 0);
    vic.color_back = VCOL_BLACK;

    // Second effect: 350 frames, faster phase increments for pulsating look
    {
        unsigned char shimmer = 0;
        for (frame = 0; frame < 350; frame++) {
            plasma_frame(t1, t2, t3);
            vic_waitFrame();
            t1 = (unsigned char)(t1 + 2);
            t2 = (unsigned char)(t2 + 3);
            t3 = (unsigned char)(t3 + 2);
            if ((frame & 7) == 0) {
                plasma_set_theme(1, shimmer);
                shimmer = (unsigned char)(shimmer + 1);
            }
        }
    }

    plasma_done();
}
