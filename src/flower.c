// UltimateDemo2026 — PETSCII polar rose (spinning flower)
//
// Rhodonea curve r = R_MAX * |cos(k * theta)| rendered per frame from
// precomputed angle/radius tables in 40x25 text mode.
// Phase 1 (300 frames): k=5, 5-petal flower, warm palette.
// Phase 2 (300 frames): k=4, 8-petal rose, cool palette.
// MOD music continues via CIA1 IRQ throughout.

#include <c64/vic.h>
#include <string.h>
#include "turbo.h"
#include "detect.h"
#include "ultimate_common_lib.h"
#include "palette_fx.h"
#include "flower.h"

// 64-entry cosine table: cos64[a] = sin64[(a+16)&63], range -127..127.
// Derived from gears.c sin64 with +16 (quarter-period) offset.
static const signed char cos64[64] = {
    127, 126, 125, 122, 117, 112, 106,  98,
     90,  81,  71,  60,  49,  37,  25,  12,
      0, -12, -25, -37, -49, -60, -71, -81,
    -90, -98,-106,-112,-117,-122,-125,-126,
   -127,-126,-125,-122,-117,-112,-106, -98,
    -90, -81, -71, -60, -49, -37, -25, -12,
      0,  12,  25,  37,  49,  60,  71,  81,
     90,  98, 106, 112, 117, 122, 125, 126
};

// Petal reach in radius units; fits flower within 25-row text screen.
#define R_MAX 14

// Character density gradient (raw screen RAM values, uppercase+graphics charset $1000).
// d=0: solid core, d=7: background space.
static const char char_tab[8] = {
    (char)0xA0,  // solid block (reversed space)
    (char)0x00,  // @
    (char)0x2A,  // *
    (char)0x2A,  // *
    (char)0x2E,  // .
    (char)0x20,  // space
    (char)0x20,
    (char)0x20
};

// Phase 1 (k=5): five warm colors, one per petal
static const char warm_col[5] = {
    (char)VCOL_WHITE,
    (char)VCOL_CYAN,
    (char)VCOL_YELLOW,
    (char)VCOL_LT_GREEN,
    (char)VCOL_LT_RED
};

// Phase 2 (k=4): four cool colors
static const char cool_col[4] = {
    (char)VCOL_WHITE,
    (char)VCOL_LT_BLUE,
    (char)VCOL_CYAN,
    (char)VCOL_LT_GREY
};

// Firmware 3.15+: genuine RGB for warm_col/cool_col's stock indices
// (brighter/more vivid than the approximate stock VIC hues -- same
// "optimise the palette" spirit as mandel.c's/plasma.c's own hand-picked
// gradients), plus a gentle per-petal brightness pulse via
// flower_push_palette() -- same multiplicative, hue-preserving
// technique as ball.c's ball_pulse_checker()/plasma.c's plasma_set_theme()
// (an additive delta was tried first elsewhere this session and read as
// "not subtle" -- it shifts hue, not just brightness, for unbalanced
// RGB values). Falls back to the plain stock VCOL_* indices on pre-3.15
// firmware, same as always.
static const unsigned char warm_rgb[5][3] = {
    {255, 255, 255},   // white
    {  0, 220, 220},   // cyan
    {255, 220,   0},   // yellow
    {120, 255, 120},   // light green
    {255, 110,  90},   // light red/coral
};
static const unsigned char cool_rgb[4][3] = {
    {255, 255, 255},   // white
    {110, 170, 255},   // light blue
    {  0, 220, 220},   // cyan
    {200, 200, 210},   // light grey
};

// Precomputed per-cell tables placed at $C000-$C7CF.
// This range is unused during flower_run(): MC scenes (mandel/plasma) which
// put screen RAM there have already finished; scroller (text mode) doesn't use it.
// Avoids adding 2 KB to BSS, which would overflow the $0A00-$C000 code region.
#define angle_tab  ((unsigned char *)0xC000)
#define radius_tab ((unsigned char *)0xC3E8)

// ---------------------------------------------------------------
// flower_init — precompute tables; set VIC text mode
// ---------------------------------------------------------------
static void flower_init(void)
{
    unsigned int  i;
    unsigned char xi = 0, yi = 0;

    // Center (19, 12).  dy scaled *5/4 for PAL character aspect ratio (~1.25:1).
    for (i = 0; i < 1000; i++)
    {
        int dx = (int)xi - 19;
        int dy = ((int)yi - 12) * 5 / 4;
        int ax = dx < 0 ? -dx : dx;
        int ay = dy < 0 ? -dy : dy;
        unsigned char oct = 0;
        unsigned char frac;

        // Octant-based atan2 approximation → 0-63 angle units
        if (dy < 0) oct = (unsigned char)(oct | 4);
        if (dx < 0) oct = (unsigned char)(oct | 2);
        if (ay > ax)
        {
            int tmp = ax; ax = ay; ay = tmp;
            oct ^= 1;
        }
        frac = (ax == 0) ? 0 : (unsigned char)(ay * 8 / ax);
        angle_tab[i] = (unsigned char)((oct * 8u + frac) & 63);

        // Chebyshev + octave radius approximation (no mul32; fits in int)
        ax = dx < 0 ? -dx : dx;
        ay = dy < 0 ? -dy : dy;
        radius_tab[i] = (unsigned char)(ax > ay ? ax + ay / 2 : ay + ax / 2);

        if (++xi == 40) { xi = 0; yi++; }
    }

    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1000);
    vic.color_border = VCOL_BLACK;
    vic.color_back   = VCOL_BLACK;
}

// ---------------------------------------------------------------
// flower_done — clear screen, leave text mode for scroller
// ---------------------------------------------------------------
#pragma optimize(push)
#pragma optimize(size)   // one-time cleanup, not the hot per-frame render
static void flower_done(void)
{
    palette_fade_out(25);   // ~0.5s @ 50Hz -- see gears.c's hires_done()
    if (detected_palette_support) uii_resetpalette();
    memset((char *)0x0400, 0x20, 1000);
    memset((char *)0xD800, VCOL_WHITE, 1000);
}
#pragma optimize(pop)

// ---------------------------------------------------------------
// flower_frame — render one frame: rose curve + per-petal color
// ---------------------------------------------------------------
static void flower_frame(unsigned char t, unsigned char t_slow,
                         unsigned char k, const char *pal)
{
    char         *sc = (char *)0x0400;
    char         *cr = (char *)0xD800;
    unsigned int  i;

    for (i = 0; i < 1000; i++)
    {
        unsigned char a   = angle_tab[i];
        unsigned char r   = radius_tab[i];
        // Rose curve radius at this angle: pr = R_MAX * |cos(k*a - t)|
        // (unsigned int) casts keep multiply 16-bit, avoiding mul32
        unsigned char ka  = (unsigned char)((unsigned int)k * (unsigned int)a);
        signed char   cv  = cos64[(unsigned char)(ka - t) & 63];
        int           avi = cv < 0 ? -(int)cv : (int)cv;
        unsigned char pr  = (unsigned char)((avi * R_MAX) >> 7);
        // Distance from petal curve → character density
        unsigned char d   = r > pr ? (unsigned char)(r - pr) : (unsigned char)(pr - r);
        // Per-petal color: angle sector rotated by t_slow
        unsigned char ra  = (unsigned char)((unsigned char)(a + t_slow) & 63);
        unsigned char ci  = (unsigned char)((unsigned int)ra * (unsigned int)k >> 6);
        sc[i] = char_tab[d < 8 ? d : 7];
        cr[i] = pal[ci];
    }
}

// Pushes `n` stock indices (stock_idx[]) as a brightness pulse of their
// own designed RGB (rgb[][3]) -- see warm_rgb/cool_rgb's own comment.
// Each index pulses on its own phase (offset by 13) for a livelier,
// non-lockstep look. Uses uii_setpalettecolor() (single-index update)
// per index, not a whole-palette replace -- this project confirmed a
// real bug earlier this session where a whole-palette push from one
// scene's colour-pulse helper clobbered another index a DIFFERENT part
// of the same scene was independently animating; flower doesn't have
// that specific cross-animation today, but single-index updates cost
// nothing extra and keep this safe against that class of bug if the
// palette ever gets more elaborate here.
// 2026-09-19: widened 75..120% -> 35..180%, matching plasma.c's same
// change -- the narrower range read as too subtle on hardware.
#pragma optimize(push)
#pragma optimize(size)   // called every 4th frame, not the hot per-cell
                          // rose-curve render in flower_frame()
static void flower_push_palette(const char *stock_idx,
                                 const unsigned char rgb[][3],
                                 unsigned char n, unsigned char phase)
{
    if (detected_palette_support) {
        unsigned char i;
        for (i = 0; i < n; i++) {
            unsigned char p = (unsigned char)(phase + i * 13);
            unsigned char tri = (p & 0x10)
                               ? (unsigned char)(31 - (p & 0x1f))
                               : (unsigned char)(p & 0x1f);
            unsigned int pct = 35 + ((unsigned int)tri * 145) / 31;   // 35..180%
            unsigned char c;
            char out[3];
            for (c = 0; c < 3; c++) {
                unsigned int v = ((unsigned int)rgb[i][c] * pct) / 100;
                if (v > 255) v = 255;
                out[c] = (char)v;
            }
            uii_setpalettecolor((unsigned char)stock_idx[i], out[0], out[1], out[2]);
        }
    }
}
#pragma optimize(pop)

// ---------------------------------------------------------------
// flower_run — two-phase spinning flower
// ---------------------------------------------------------------
void flower_run(void)
{
    unsigned int  frame;
    unsigned char t       = 0;
    unsigned char t_slow  = 0;
    unsigned char pulse   = 0;

    turbo_fast();
    flower_init();

    // Phase 1: k=5, 5-petal, warm colors, 300 frames (~6 s)
    for (frame = 0; frame < 300; frame++)
    {
        flower_frame(t, t_slow, 5, warm_col);
        vic_waitFrame();
        t      = (unsigned char)(t + 2);
        if ((frame & 3) == 0)
            t_slow = (unsigned char)(t_slow + 1);
        if ((frame & 3) == 0) {
            flower_push_palette(warm_col, warm_rgb, 5, pulse);
            pulse = (unsigned char)(pulse + 2);
        }
    }

    // Phase 2: k=4, 8-petal, cool colors, 300 frames (~6 s), slower rotation
    for (frame = 0; frame < 300; frame++)
    {
        flower_frame(t, t_slow, 4, cool_col);
        vic_waitFrame();
        t      = (unsigned char)(t + 1);
        if ((frame & 3) == 0)
            t_slow = (unsigned char)(t_slow + 1);
        if ((frame & 3) == 0) {
            flower_push_palette(cool_col, cool_rgb, 4, pulse);
            pulse = (unsigned char)(pulse + 2);
        }
    }

    flower_done();
}
