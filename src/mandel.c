// UltimateDemo2026 — Fractal demo with MC colorization
//
// Standard multicolor hires (160×200):
//   4 colours per 4×8-pixel cell: background (c0), c1/c2 from screen RAM,
//   c3 from color RAM.  Colour palette varies by escape depth (outer->inner).
//
// Memory — VIC bank 3 ($C000–$FFFF):
//   $C000–$C3FF  Screen RAM (1 KB, one page)
//   $E000–$FFFF  MC bitmap (8 KB)
//   $D800–$DBFF  Color RAM c3 (hardware chip, always at $D800)
//
// Single frame: seahorse medium (best view of boundary complexity).

#include <c64/vic.h>
#include <c64/cia.h>
#include <c64/memmap.h>
#include <gfx/mcbitmap.h>
#include <fixmath.h>
#include <string.h>
#include "turbo.h"
#include "detect.h"
#include "ultimate_common_lib.h"
#include "palette_fx.h"
#include "mandel.h"

// ---------------------------------------------------------------
// Memory addresses
// ---------------------------------------------------------------
#define MC_SCREEN  ((char *)0xC000)  // 1-KB screen page
#define MC_HIRES   ((char *)0xE000)  // 8-KB MC bitmap
#define MC_CRAM    ((char *)0xD800)  // 1-KB color RAM (hardware I/O)

// ---------------------------------------------------------------
// Fixed-point: 4.12 format (4096 = 1.0)
// lsqr4f12s(x) → x² as unsigned long (8.24)
// lmul4f12s(x,y) → x*y as int (4.12)
// Escape: |z|² ≥ 4.0 → zr²+zi² ≥ 4×4096² = 0x04000000
// ---------------------------------------------------------------
#define SCALE_4F12    4096
#define ESCAPE_4F12   0x04000000UL
#define MAXITER  32

// 2-bit pixel value → byte pattern (all 4 pixels in a byte set to that value)
static const char cbytes[4] = { 0x00, 0x55, 0xAA, 0xFF };

static inline char iter_to_value(char iter)
{
    char band = (char)((iter * 8) / MAXITER);
    return (char)((band % 3) + 1);
}

// ---------------------------------------------------------------
// Frame descriptor
// ---------------------------------------------------------------
typedef struct {
    int  real_min, imag_min;
    char step_r,   step_i;
    int  julia_cr, julia_ci;
} Frame;

// Seahorse medium: best view of boundary complexity.
//
// imag_min/step_i deliberately land on a window exactly symmetric about
// the real axis (imag_min == -(199*step_i)/2) -- originally chosen to
// support a y-axis mirror optimization (see render()'s own comment for
// why that was tried and rejected). Kept anyway purely for the resulting
// composition: originally imag_min=-2785, step_i=32 (asymmetric --
// showed more of the positive-imaginary tail than the negative side);
// widening step_i to 36 (a ~12% larger vertical span, not a crop) keeps
// that same tail fully in view AND reveals its mirror twin at the top.
// Fully computed either way -- no performance dependency on the symmetry.
static const Frame mand_frame = { -7168, -3582, 51, 36, 0, 0 };

// ---------------------------------------------------------------
// Per-cell colour palette — driven by ESCAPE DEPTH alone (content_type:
// 0=shallow exterior .. 3=boundary/mixed), not screen position.
//
// 2026-09-19: replaced the previous [zone][content_type] table (4
// hand-tuned palettes per screen diagonal quadrant, zone = cx+cy) --
// that made two cells at the SAME escape depth show different colours
// purely because of which screen quadrant they fell in, which read as
// quadrant-tinted rather than a coherent gradient. User asked for
// "natural gradients moving from outer to inner" instead.
//
// Each tier picks 3 indices from mc_pal_idx[]'s 10-slot cool(0)->warm(9)
// spread (see mc_pal_idx/mc_push_palette_hue below) -- since
// mc_push_palette_hue() rotates ALL 10 slots together (hardware index i
// always shows gradient stop (i+roll)%10), a LOW mc_pal_idx slot for
// shallow cells and a HIGH slot for boundary cells keeps a stable
// cool-outer/warm-inner relationship throughout the roll animation, not
// just at roll=0. Adjacent tiers share one overlapping slot so the
// transition between tiers reads as continuous rather than banded.
// content_type is already a depth proxy for free (computed below from
// each cell's mix of iter_to_value()'s 3 exterior bands + whether any
// pixel reached MAXITER) -- no new per-pixel sampling needed.
// ---------------------------------------------------------------
typedef struct { char c1, c2, c3; } CPal;

static const CPal mc_depth_pal[4] = {
    { VCOL_WHITE,  VCOL_CYAN,    VCOL_PURPLE   },   // 0: shallow exterior  (mc_pal_idx[0..2])
    { VCOL_PURPLE, VCOL_GREEN,   VCOL_BLUE     },   // 1: mid exterior      (mc_pal_idx[2..4])
    { VCOL_BLUE,   VCOL_YELLOW,  VCOL_ORANGE   },   // 2: near boundary     (mc_pal_idx[4..6])
    { VCOL_ORANGE, VCOL_LT_BLUE, VCOL_LT_GREY  },   // 3: boundary (mixed)  (mc_pal_idx[6,8,9])
};


// ---------------------------------------------------------------
// render — compute fractal, write 2-bit pixel values to bitmap.
// Runs under MMAP_NO_ROM so MC_HIRES ($E000) is accessible as RAM.
//
// Cardioid/period-2-bulb early-skip: TRIED (2026-09-17/18) and
// ABANDONED, not just deferred. The technique (adapted from the sibling
// project mandelbrot-upic) and a first bug in it (mul32/modplay_irq
// corruption -- see [[feedback-mul32-work-race]]) are both real, and
// the fix for that first bug was verified correct by disassembly (SEI
// .. JSR mul32 .. CLI, genuinely bracketing the multiply, confirmed via
// .asm inspection). Despite that, a noisy/corrupted-looking patch of
// cells persisted on real hardware. Isolated via a controlled test
// (short-circuiting the whole call off with `0 && ...`, so the function
// was never even invoked while everything else -- including a
// STRUCTURALLY IDENTICAL SEI/CLI-protected mul32 call computing cy2
// once per row, still active in that test -- stayed unmodified):
// corruption disappeared. So the bug is real, specific to that
// function, and NOT simply "the same IRQ race, incompletely fixed"
// (the per-row cy2 helper uses the exact same fix and never showed any
// corruption at all) -- something about it remains unexplained. Given
// this is a one-time static render (not a per-frame cost -- the scene
// never recomputes, see mandel_run()), the ~2.85x measured speedup
// wasn't worth further chasing an intermittent, only-partially-
// understood bug for a cosmetic one-off delay. Reverted to always
// computing the full MAXITER-iteration loop below, matching this
// scene's original (pre-2026-09-17) behaviour.

// ---------------------------------------------------------------
#pragma optimize(push)
#pragma optimize(2)   // force back to -O2 regardless of the project's
                       // global -Os default (see Makefile CFLAGS comment)
                       // -- this is the hot per-pixel fractal loop.
// Y-axis mirror (halving computed rows via the Mandelbrot set's real-
// axis conjugate symmetry, as the sibling project mandelbrot-upic does)
// was TRIED here and REJECTED after verification, not just assumed to
// work: direct counter-example found in this project's own 4.12
// lmul4f12s-based iteration -- iterate(cv=-6913, ci=+18) returns 11,
// iterate(cv=-6913, ci=-18) returns 12. Real arithmetic guarantees
// iterate(cx,cy) == iterate(cx,-cy) exactly, but this integer fixed-
// point multiply isn't symmetric under sign negation (a rounding
// asymmetry, not a bug in the mirror logic itself), so the assumption
// the mirror depends on doesn't hold here. Measured 327/32000 pixels
// (~1%) differing across 94 of the 100 mirrored rows -- not a seam
// artifact, a systemic mismatch -- so the mirror was NOT deployed.
// mand_frame's symmetric bounds are kept anyway (see its own comment)
// purely because the resulting composition looks better (shows the
// tail's mirror twin too), fully computed either way.
static void render(const Frame *f)
{
    char  is_julia = (f->julia_cr != 0 || f->julia_ci != 0);
    int   py;

    memset(MC_HIRES, 0, 8000);

    for (py = 0; py < 200; py++) {
        int ci_or_yz = f->imag_min + py * (int)f->step_i;
        int px;
        char *row_ptr = MC_HIRES + ((unsigned)py & ~7u) * 40u + ((unsigned)py & 7u);

        for (px = 0; px < 160; px++) {
            int  cv = f->real_min + px * (int)f->step_r;
            int  zr, zi, c_r, c_i;
            char iter;

            if (is_julia) {
                zr = cv;  zi = ci_or_yz;
                c_r = f->julia_cr;  c_i = f->julia_ci;
            } else {
                zr = 0;   zi = 0;
                c_r = cv; c_i = ci_or_yz;
            }

            for (iter = 0; iter < MAXITER; iter++) {
                unsigned long zr2 = lsqr4f12s(zr);
                unsigned long zi2 = lsqr4f12s(zi);
                if (zr2 + zi2 >= ESCAPE_4F12) break;
                int nzr = (int)(((zr2 - zi2) >> 12)) + c_r;
                zi  = 2 * lmul4f12s(zr, zi) + c_i;
                zr  = nzr;
            }

            char val = (iter >= MAXITER) ? (char)0 : iter_to_value(iter);

            {
                char *dp   = row_ptr + ((unsigned)px >> 2) * 8u;
                char  mask = (char)(0xC0 >> (((unsigned)px & 3u) << 1));
                char  pat  = cbytes[(unsigned char)val];
                *dp = (*dp & ~mask) | (pat & mask);
            }
        }
    }
}
#pragma optimize(pop)

// ---------------------------------------------------------------
// colorize_standard — write c1/c2 to screen RAM and c3 to color RAM.
//
// Runs under MMAP_NO_ROM: $C000 (screen), $E000 (bitmap), and
// $D800 (color RAM via I/O) are all accessible.  No SEI needed.
//
// Resolution: per 4×8-pixel cell (standard MC hardware limit).
// Colour chosen by diagonal zone (cx+cy) and content_type derived
// from the pixel distribution within each cell.
// ---------------------------------------------------------------
#pragma optimize(push)
#pragma optimize(2)   // force -O2, hot per-cell colourize loop -- see render()
static void colorize_standard(const CPal pal[4])
{
    char *scr  = MC_SCREEN;
    char *cram = MC_CRAM;
    char cy, cx;

    for (cy = 0; cy < 25; cy++) {
        char *cell_base = MC_HIRES + (unsigned)cy * 320u;
        for (cx = 0; cx < 40; cx++) {
            char *cell = cell_base + (unsigned)cx * 8u;
            char n0=0, n1=0, n2=0, n3=0, t, v;
            for (t = 0; t < 8; t++) {
                char b = cell[t];
                v=(char)((b>>6)&3); if(v==0)n0++;else if(v==1)n1++;else if(v==2)n2++;else n3++;
                v=(char)((b>>4)&3); if(v==0)n0++;else if(v==1)n1++;else if(v==2)n2++;else n3++;
                v=(char)((b>>2)&3); if(v==0)n0++;else if(v==1)n1++;else if(v==2)n2++;else n3++;
                v=(char)( b    &3); if(v==0)n0++;else if(v==1)n1++;else if(v==2)n2++;else n3++;
            }
            char has_interior = (n0 > 0);
            char has_exterior = (char)(n1 + n2 + n3 > 0);
            char content_type;
            if (has_interior && has_exterior) { content_type = 3; }
            else if (!has_exterior) { content_type = 0; }
            else {
                char dom = 1;
                if (n2 > n1) dom = 2;
                if (n3 > n2 && n3 > n1) dom = 3;
                content_type = (char)(dom - 1);
            }
            const CPal *p = &pal[(unsigned char)content_type];
            *scr++ = (char)((p->c1 << 4) | p->c2);
            *cram++ = p->c3;
        }
    }
}
#pragma optimize(pop)

// ---------------------------------------------------------------
// display_wait — hold the frame on screen for `secs` seconds.
// Uses CIA1 TOD timer; VIC IRQs remain enabled so the modplay
// $0314 chain (keyboard scan) continues to function.
// ---------------------------------------------------------------
static void display_wait(char secs)
{
    cia1.tods = 0;
    cia1.todt = 0;
    while (cia1.tods < secs) ;
}

// ---------------------------------------------------------------
// Palette-driven colour cycling -- classic demo-scene technique: the
// fractal itself is a single static render (no per-frame recompute at
// all, see mandel_run()), so all the motion here comes purely from
// slowly rolling the palette through a fixed gradient via UCI while
// display_wait_cycling() holds the image on screen.
//
// Hand-picked cool-to-warm gradient stops (deep blue -> pale blue ->
// pale gold -> orange), NOT an algorithmically-generated full-hue-wheel
// rotation -- the earlier version spread 10 indices evenly around
// hue_to_rgb()'s full-saturation wheel, which read as harsh, jarring
// blocks of primary/neon colour on hardware (screenshot 2026-09-18: a
// checkerboard of solid red/green/magenta/cyan), not the subtle image
// a demo-scene colour-cycle effect should be. This gradient's actual
// RGB values are adapted from the sibling project mandelbrot-upic's
// own default palette (its mandelbrot_palette[48] in
// /home/xahmol/git/mandelbrot-upic/include/mandelbrot.c -- see that
// file's own extensive comment on how those specific stops were
// chosen: every adjacent step >=37 RGB units apart, verified by
// measuring swatch renders, not eyeballed).
static const unsigned char mc_gradient[10][3] = {
    { 0x19, 0x04, 0x27 },   // deep violet-blue
    { 0x1d, 0x48, 0x8d },   // blue
    { 0x42, 0x73, 0xab },   // medium blue
    { 0x6b, 0x9c, 0xc5 },   // light blue
    { 0x9a, 0xc4, 0xd7 },   // pale blue
    { 0xce, 0xe5, 0xe3 },   // near-white pale
    { 0xf4, 0xe8, 0xc6 },   // pale gold
    { 0xff, 0xd1, 0x8c },   // gold
    { 0xff, 0xb5, 0x54 },   // orange-gold
    { 0xfc, 0x86, 0x2c },   // orange
};

// All 10 indices the f1c[][] palette table actually uses each get
// assigned a DIFFERENT, evenly-spread stop from the gradient above
// (index i -> stop i), so the image shows the whole gradient at once
// rather than a single flat colour -- then `roll` (see
// mc_push_palette_hue()) rotates WHICH stop each index shows over
// time, without changing the fixed shape of the gradient itself.
static const unsigned char mc_pal_idx[10] =
    { VCOL_WHITE, VCOL_CYAN, VCOL_PURPLE, VCOL_GREEN, VCOL_BLUE,
      VCOL_YELLOW, VCOL_ORANGE, VCOL_LT_GREEN, VCOL_LT_BLUE, VCOL_LT_GREY };

static void mc_push_palette_hue(unsigned char roll)
{
    char rgb[48];
    unsigned char i;
    memset(rgb, 0, 48);   // index 0 (background) stays pure black; every
                            // index not in mc_pal_idx[] is unused by this
                            // scene's own content, so zeroing them is
                            // harmless (matches plasma.c's same pattern)
    for (i = 0; i < 10; i++) {
        unsigned char stop = (unsigned char)((i + roll) % 10);
        rgb[mc_pal_idx[i] * 3 + 0] = (char)mc_gradient[stop][0];
        rgb[mc_pal_idx[i] * 3 + 1] = (char)mc_gradient[stop][1];
        rgb[mc_pal_idx[i] * 3 + 2] = (char)mc_gradient[stop][2];
    }
    uii_setpalette(rgb);
}

// Holds the static render on screen for `secs` seconds while gently
// rolling the palette through the fixed gradient (see
// mc_push_palette_hue()) -- one UCI update roughly every 1.5s (75
// frames), slow and discrete-but-gentle since adjacent gradient stops
// are already close in hue/brightness by construction, unlike the
// earlier full-saturation hue jumps. Comfortably "between frames" (see
// FIRMWARE315UPGRADEPLAN.md's confirmed ~17ms/call UCI cost). No-op
// fallback to the plain display_wait() timing on pre-3.15 firmware.
static void display_wait_cycling(char secs)
{
    if (!detected_palette_support) {
        display_wait(secs);
        return;
    }
    {
        unsigned int  frame;
        unsigned int  total_frames = (unsigned int)secs * 50u;
        unsigned char roll = 0;
        mc_push_palette_hue(roll);
        for (frame = 0; frame < total_frames; frame++) {
            vic_waitFrame();
            if ((frame % 75) == 0 && frame != 0) {
                roll = (unsigned char)((roll + 1) % 10);
                mc_push_palette_hue(roll);
            }
        }
    }
}

// ---------------------------------------------------------------
// mc_init — set up standard MC mode in VIC bank 3.
// Runs under MMAP_NO_ROM so $E000 bitmap and $D800 color RAM
// are both accessible.  VIC IRQs are NOT disabled here, keeping
// the modplay $0314 handler and keyboard scan alive.
// ---------------------------------------------------------------
static void mc_init(void)
{
    mmap_set(MMAP_NO_ROM);

    memset(MC_SCREEN, 0, 1000);
    memset(MC_HIRES,  0, 8000);
    memset(MC_CRAM,   VCOL_WHITE, 1000);

    // VIC bank 3 already selected (CIA2 default / gears handoff).
    // Screen at $C000, bitmap at $E000 → $D018 = $08.
    vic_setmode(VICM_HIRES_MC, MC_SCREEN, MC_HIRES);
    vic.color_back   = VCOL_BLACK;
    vic.color_border = VCOL_BLACK;
}

// ---------------------------------------------------------------
// mc_done — restore text mode and memory map.
// ---------------------------------------------------------------
#pragma optimize(push)
#pragma optimize(size)   // one-time cleanup, not the hot per-pixel loop
static void mc_done(void)
{
    palette_fade_out(25);   // ~0.5s @ 50Hz -- see gears.c's hires_done()
    if (detected_palette_support) uii_resetpalette();
    mmap_set(MMAP_NO_BASIC);
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
    vic.color_border = 0;
    vic.color_back   = 0;
}
#pragma optimize(pop)

// ---------------------------------------------------------------
// mandel_run
// ---------------------------------------------------------------
void mandel_run(void)
{
    const Frame  *fr  = &mand_frame;
    const CPal   *pal = mc_depth_pal;

    turbo_fast();
    mc_init();
    render(fr);
    colorize_standard(pal);
    display_wait_cycling(5);
    mc_done();
    // turbo_slow() removed — full demo stays at 64 MHz; caller handles shutdown
}
