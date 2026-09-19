// UltimateDemo2026 — 3D texture-mapped tunnel
//
// Polar-coordinate tunnel with rotation, zoom, and 2D camera sway.
// 16 KB of lookup tables stored in REU (C64 RAM is full).
// Per frame: 110 single 160-byte REU fetches (angle+dist combined), then render.
//
// REU layout ($200000 base, clear of MOD at $000000):
//   Row y at offset y*160: bytes 0-79 = angle (0-31), bytes 80-159 = dist (0-31)
//   110 rows x 160 bytes = 17600 bytes total
//
// C64 BSS: row_buf[160] + tex_flat[1024] = 1184 bytes
//
// Render: 100 ty iterations, each writing top row (ty) + bottom mirror (199-ty).
// Horizontal sway: 64-step sine, amplitude ±6 table columns, period 64 frames.
// Vertical sway:   64-step sine (2 cycles = period 32 frames), amplitude ±4 rows.
//   At vert_j=0 the table rows 5..104 are used, matching the dy=-100..-1 range.
//   vert_j ∈ [-4,+4] keeps all accessed rows (1..108) within the 110-row table.
// Horizontal centering: dx = x*3-118 → range ~-118..+119, symmetric around screen centre.
//   (Original -80 formula shifted vanishing point 1 unit right of centre.)
//   2026-09-19: widened from x*2-79 (range ±79) to x*3-118 -- at range ±79, |dy| at the
//   outermost table rows (~96-104, used for screen's top/bottom ~8 scanlines) exceeded
//   |dx|'s max, collapsing iatan2_5's angular resolution there to ~7 discrete values and
//   producing flat rectangular bands instead of a curve. Widening dx restores resolution
//   at those rows -- EXPERIMENTAL, changes ring spacing/sway/flow feel tunnel-wide, not
//   just the edges; if it doesn't look right, revert (see tunnel.c.before-optionA.bak in
//   session scratchpad) and crop the unresolvable rows in tunnel_render() instead.
// Bottom-half angle: (32 - top_angle) & 31 (mirror symmetry, computed in-loop).

#include <c64/vic.h>
#include <c64/memmap.h>
#include <string.h>
#include "turbo.h"
#include "detect.h"
#include "ultimate_common_lib.h"
#include "palette_fx.h"
#include "tunnel.h"

// ---------------------------------------------------------------
// REU register access
// ---------------------------------------------------------------
#define TUN_REU_CMD    (*(volatile unsigned char *)0xDF01)
#define TUN_REU_C64LO  (*(volatile unsigned char *)0xDF02)
#define TUN_REU_C64HI  (*(volatile unsigned char *)0xDF03)
#define TUN_REU_REULO  (*(volatile unsigned char *)0xDF04)
#define TUN_REU_REUMI  (*(volatile unsigned char *)0xDF05)
#define TUN_REU_REUHI  (*(volatile unsigned char *)0xDF06)
#define TUN_REU_LENLO  (*(volatile unsigned char *)0xDF07)
#define TUN_REU_LENHI  (*(volatile unsigned char *)0xDF08)

#define TUN_REU_STORE  0xD0   // execute, C64 -> REU
#define TUN_REU_FETCH  0xD1   // execute, REU -> C64

// Combined angle+dist rows at 2 MB base (well past MOD file)
#define TUN_DATA_REU   0x200000UL   // row y at offset y*160; [0..79]=angle, [80..159]=dist

// ---------------------------------------------------------------
// VIC bank 3 addresses
// ---------------------------------------------------------------
#define TUN_SCREEN  ((char *)0xC000)
#define TUN_BITMAP  ((char *)0xE000)
#define TUN_CRAM    ((char *)0xD800)

// ---------------------------------------------------------------
// C64 RAM buffers (1184 bytes total BSS)
// ---------------------------------------------------------------
static unsigned char row_buf[160];   // angle_row = [0..79], dist_row = [80..159]
static unsigned char tex_flat[1024]; // 32x32 brick texture; index=(v<<5)|u, value=0-3

#define angle_row  row_buf
#define dist_row   (row_buf + 80)

// ---------------------------------------------------------------
// Horizontal sway — 64-step, amplitude ±6, period 64 frames (~1.28 s at 50 fps).
// Negated vs. original so the first sweep goes RIGHT on screen (vanishing point
// moves right before sweeping left), avoiding the "starts shifted left" look.
// ---------------------------------------------------------------
static const signed char lat_wave[64] = {
     0, -1, -1, -2, -2, -3, -3, -4,
    -4, -5, -5, -5, -6, -6, -6, -6,
    -6, -6, -6, -5, -5, -5, -4, -4,
    -3, -3, -2, -2, -1, -1,  0,  0,
     1,  1,  2,  2,  3,  3,  4,  4,
     5,  5,  5,  6,  6,  6,  6,  6,
     6,  6,  5,  5,  5,  4,  4,  3,
     3,  2,  2,  1,  1,  0,  0, -1
};

// ---------------------------------------------------------------
// Vertical sway — 64-step (2 cycles), amplitude ±4, period 32 frames (~0.64 s).
// 2:1 frequency ratio vs. lat_wave → figure-8 Lissajous sway pattern.
// Positive vert_j: shifts row index up, tunnel appears to tilt downward.
// ---------------------------------------------------------------
static const signed char vert_wave[64] = {
     0,  1,  2,  2,  3,  3,  4,  4,  4,  4,  4,  3,  3,  2,  2,  1,
     0, -1, -2, -2, -3, -3, -4, -4, -4, -4, -4, -3, -3, -2, -2, -1,
     0,  1,  2,  2,  3,  3,  4,  4,  4,  4,  4,  3,  3,  2,  2,  1,
     0, -1, -2, -2, -3, -3, -4, -4, -4, -4, -4, -3, -3, -2, -2, -1
};

// ---------------------------------------------------------------
// REU DMA helper
// ---------------------------------------------------------------

static void reu_dma(unsigned char cmd, unsigned long reu_addr,
                    void *c64_addr, unsigned char len)
{
    // SEI: modplay_irq calls reu_fetch() which shares these registers; protect the setup window
    __asm { sei }
    TUN_REU_C64LO = (unsigned char)((unsigned)c64_addr);
    TUN_REU_C64HI = (unsigned char)((unsigned)c64_addr >> 8);
    TUN_REU_REULO = (unsigned char)(reu_addr);
    TUN_REU_REUMI = (unsigned char)(reu_addr >> 8);
    TUN_REU_REUHI = (unsigned char)(reu_addr >> 16);
    TUN_REU_LENLO = len;
    TUN_REU_LENHI = 0;
    TUN_REU_CMD   = cmd;
    __asm { cli }
}

// ---------------------------------------------------------------
// Integer helpers — NOFLOAT compatible
// ---------------------------------------------------------------

// Angle 0-31: 0=right, 8=down, 16=left, 24=up (screen Y-down convention)
static unsigned char iatan2_5(int y, int x)
{
    int ax, ay, t;
    if (x == 0 && y == 0) return 0;
    ax = x < 0 ? -x : x;
    ay = y < 0 ? -y : y;
    if (ax >= ay) {
        t = (ay << 3) / ax;
        if (x > 0)
            return (unsigned char)(y >= 0 ? t      : (unsigned char)(32 - t));
        else
            return (unsigned char)(y >= 0 ? 16 - t : 16 + t);
    } else {
        t = (ax << 3) / ay;
        if (y > 0)
            return (unsigned char)(x >= 0 ?  8 - t :  8 + t);
        else
            return (unsigned char)(x >= 0 ? 24 + t : 24 - t);
    }
}

// Depth 0-31: K/sqrt(dx^2+dy^2) clamped. K=800: corner->~6, near-centre->31.
static unsigned char idist_5(int dx, int dy)
{
    unsigned int sq, root, prev, d;
    sq = (unsigned int)(dx * dx) + (unsigned int)(dy * dy);
    if (sq == 0) return 31;
    root = sq >> 1;
    if (root == 0) root = 1;
    do {
        prev = root;
        root = (prev + sq / prev) >> 1;
    } while (root < prev);
    d = 800U / root;
    return (unsigned char)(d > 31 ? 31 : (unsigned char)d);
}

// ---------------------------------------------------------------
// Build tables into REU (110 rows x 160 bytes = 1 DMA per row)
//
// dx = x*2-79 → range -79..+79, symmetric around screen centre (j=39.5).
// dy = y-105  → at neutral (vert_j=0), rows 5..104 give dy=-100..-1,
//               matching the original 100-row table appearance.
// ---------------------------------------------------------------

static void tunnel_build_tables(void)
{
    char y;
    unsigned char x;
    for (y = 0; y < 110; y++) {
        int dy = (int)y - 105;
        for (x = 0; x < 80; x++) {
            int dx = (int)x * 3 - 118;
            angle_row[x] = iatan2_5(dy, dx);   // row_buf[0..79]
            dist_row[x]  = idist_5(dx, dy);    // row_buf[80..159]
        }
        reu_dma(TUN_REU_STORE,
                TUN_DATA_REU + (unsigned long)(unsigned char)y * 160,
                row_buf, 160);
    }
}

// ---------------------------------------------------------------
// Build 32x32 brick texture
// v axis = depth rings; u axis = angle around tunnel
// ---------------------------------------------------------------

static void tunnel_build_tex(void)
{
    char u, v;
    for (v = 0; v < 32; v++) {
        char brick_row = (char)(v >> 2);
        char offset    = (char)((brick_row & 1) ? 4 : 0);
        for (u = 0; u < 32; u++) {
            char us = (u + offset) & 31;
            unsigned char c;
            if ((v & 3) == 0)
                c = 3;                                              // horizontal mortar
            else if ((us & 7) == 0)
                c = 2;                                              // vertical mortar
            else
                c = (unsigned char)(((unsigned char)us >> 2) & 1); // brick shade
            tex_flat[((unsigned char)v << 5) | (unsigned char)u] = c;
        }
    }
}

// ---------------------------------------------------------------
// Frame render
//
// lat_j: horizontal table-column shift (±6). Negative = vanishing point right.
// vert_j: vertical table-row offset   (±4). Row used = ty + 5 + vert_j ∈ [1,108].
//
// 2026-09-19: ty < TUN_TY_CROP (screen's outermost ~10 scanlines, mirrored top+bottom)
// is skipped and left as background black. At these rows |dy| is at its table maximum
// (~96-104) while dx is still small near screen-centre columns, so iatan2_5's 5-bit
// angle table quantizes the centre columns into one wide constant bucket regardless of
// dx's amplitude (widening dx in tunnel_build_tables helped the rest of the row, but
// this centre-column bucket is a fixed resolution floor, not something dx can fix) --
// visible as a flat rectangular cap right at the frame edge instead of a curve. Cropping
// these rows is cheaper and more reliable than chasing more angle/depth precision.
// ---------------------------------------------------------------

#define TUN_TY_CROP  10

#pragma optimize(push)
#pragma optimize(2)   // force -O2, hot per-pixel loop -- see mandel.c's render()
static void tunnel_render(unsigned char t_ang, unsigned char t_dist,
                          signed char lat_j, signed char vert_j)
{
    unsigned char ty;
    unsigned char row_base = (unsigned char)(5 + vert_j);

    for (ty = TUN_TY_CROP; ty < 100; ty++) {
        // Fetch combined angle+dist row from REU in one call
        reu_dma(TUN_REU_FETCH,
                TUN_DATA_REU + (unsigned long)((unsigned char)(ty + row_base)) * 160,
                row_buf, 160);

        unsigned char top_py = ty;
        unsigned char bot_py = (unsigned char)(199 - ty);

        char *ptop = TUN_BITMAP
                     + (((unsigned)top_py >> 3) * 320u)
                     + ((unsigned)top_py & 7u);
        char *pbot = TUN_BITMAP
                     + (((unsigned)bot_py >> 3) * 320u)
                     + ((unsigned)bot_py & 7u);

        unsigned char bx;
        for (bx = 0; bx < 40; bx++, ptop += 8, pbot += 8) {
            // Apply lateral shift to j indices, clamped to 0-79
            signed char sj0 = (signed char)((unsigned char)(bx << 1)) + lat_j;
            signed char sj1 = sj0 + 1;
            unsigned char j0 = (sj0 < 0) ? 0 : (sj0 > 79 ? 79 : (unsigned char)sj0);
            unsigned char j1 = (sj1 < 0) ? 0 : (sj1 > 79 ? 79 : (unsigned char)sj1);

            unsigned char a0 = angle_row[j0];
            unsigned char a1 = angle_row[j1];
            unsigned char d0 = dist_row[j0];
            unsigned char d1 = dist_row[j1];

            unsigned char v0 = (d0 + t_dist) & 31u;
            unsigned char v1 = (d1 + t_dist) & 31u;

            // Top half: direct angle
            unsigned char c0 = tex_flat[(v0 << 5) | ((a0 + t_ang) & 31u)];
            unsigned char c1 = tex_flat[(v1 << 5) | ((a1 + t_ang) & 31u)];
            *ptop = (char)((c0 << 6) | (c0 << 4) | (c1 << 2) | c1);

            // Bottom half: flipped angle for vertical mirror symmetry
            unsigned char fa0 = ((unsigned char)(32u - a0) + t_ang) & 31u;
            unsigned char fa1 = ((unsigned char)(32u - a1) + t_ang) & 31u;
            unsigned char bc0 = tex_flat[(v0 << 5) | fa0];
            unsigned char bc1 = tex_flat[(v1 << 5) | fa1];
            *pbot = (char)((bc0 << 6) | (bc0 << 4) | (bc1 << 2) | bc1);
        }
    }
}
#pragma optimize(pop)

// ---------------------------------------------------------------
// VIC setup — mirrors mandel.c mc_init / mc_done pattern exactly
// ---------------------------------------------------------------

static void tun_init(void)
{
    mmap_set(MMAP_NO_ROM);

    memset(TUN_BITMAP, 0, 8000);
    // TUN_SCREEN/TUN_CRAM are filled by tun_paint_gradient(), called
    // from tunnel_run() right after this.

    vic_setmode(VICM_HIRES_MC, TUN_SCREEN, TUN_BITMAP);
    vic.color_back   = VCOL_BLACK;
    vic.color_border = VCOL_BLACK;
}

#pragma optimize(push)
#pragma optimize(size)   // one-time cleanup, not the hot per-frame render
static void tun_done(void)
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
// Multi-shade gradient of ONE hue across the whole tunnel image.
//
// Hardware limit: any single 4x8 cell can only ever show 4 colours
// (background + c1/c2/c3), so "more colours per frame" has to mean more
// DISTINCT colours across DIFFERENT cells, not more per cell. Screen-RAM
// (c1/c2) and colour RAM (c3) are per-CELL-ROW (8 scanlines), not
// per-scanline, so this assigns each of the 25 text rows its own
// (c1,c2,c3) index triple, picked from GRAD_BANDS indices whose actual
// RGB is a brightness ramp of a single hue (see hue_shade_to_rgb()) --
// rows near the tunnel's vertical centre (nearer the vanishing point in
// this polar projection) get darker/deeper shades, rows near the top/
// bottom edges (closer to camera) get brighter ones. c1 = row's own
// band (brick shade), c2/c3 = one/two bands brighter (mortar highlight),
// clamped to the top of the range -- gives each row a little of its own
// internal shading too, not just a flat colour per row.
#define GRAD_BANDS   8
#define GRAD_BASE    1   // colour-RAM/screen indices 1..GRAD_BANDS used;
                          // 0 stays background/black, untouched.

static unsigned char grad_hue = 0;

#pragma optimize(push)
#pragma optimize(size)   // called once at scene start + once per ~5s hue
                          // step, not the hot per-frame tunnel_render()
static void tun_paint_gradient(void)
{
    unsigned char row;
    for (row = 0; row < 25; row++) {
        unsigned char dist = (row > 12) ? (unsigned char)(row - 12)
                                         : (unsigned char)(12 - row);
        unsigned char band = (unsigned char)(dist * (GRAD_BANDS - 1) / 12);
        unsigned char c1 = (unsigned char)(GRAD_BASE + band);
        unsigned char c2 = (unsigned char)(GRAD_BASE +
            ((band + 1 < GRAD_BANDS) ? band + 1 : band));
        unsigned char c3 = (unsigned char)(GRAD_BASE +
            ((band + 2 < GRAD_BANDS) ? band + 2 : GRAD_BANDS - 1));
        memset(TUN_SCREEN + (unsigned int)row * 40,
               (char)((c1 << 4) | c2), 40);
        memset(TUN_CRAM + (unsigned int)row * 40, (char)c3, 40);
    }
}

// Pushes GRAD_BANDS indices' RGB as a brightness ramp of grad_hue via
// UCI -- the row->index MAPPING above never changes, only what those
// indices actually render as. No-op (and no cost at all) on pre-3.15
// firmware, which just shows tun_paint_gradient()'s literal stock index
// numbers 1..8 (white/red/cyan/purple/green/blue/yellow/orange) instead
// of a true single-hue gradient -- a functional but less polished
// fallback, same tradeoff plasma.c's rework already accepted.
static void tun_push_gradient_hue(void)
{
    unsigned char band;
    if (!detected_palette_support) return;
    for (band = 0; band < GRAD_BANDS; band++) {
        char r, g, b;
        unsigned char brightness = (unsigned char)(50 + band * 26);
        hue_shade_to_rgb(grad_hue, brightness, &r, &g, &b);
        uii_setpalettecolor((unsigned char)(GRAD_BASE + band), r, g, b);
    }
}
#pragma optimize(pop)

// ---------------------------------------------------------------
// Public entry point
// ---------------------------------------------------------------

void tunnel_run(void)
{
    turbo_fast();
    tunnel_build_tables();
    tunnel_build_tex();
    tun_init();
    tun_paint_gradient();
    grad_hue = 0;
    tun_push_gradient_hue();

    unsigned char t_ang      = 0;
    unsigned char t_dist     = 0;
    unsigned char t_lateral  = 0;
    unsigned char t_vertical = 0;
    unsigned int  frame;

    for (frame = 0; frame < 800; frame++) {
        signed char lat_j  = lat_wave[t_lateral  & 63];
        signed char vert_j = vert_wave[t_vertical & 63];
        tunnel_render(t_ang, t_dist, lat_j, vert_j);
        vic_waitFrame();
        t_ang      = (unsigned char)(t_ang     + 1);
        t_dist     = (unsigned char)(t_dist    + 1);
        t_lateral  = (unsigned char)(t_lateral  + 1);
        t_vertical = (unsigned char)(t_vertical + 1);

        // Continuous slow drift of the gradient's base hue -- small step
        // every 10 frames (~0.2s) rather than one big 24-unit jump every
        // 5s (2026-09-18: the original discrete-jump design was easy to
        // miss entirely between jumps, per user report; this reads as
        // smooth ongoing movement instead, matching plasma.c/scroller.c's
        // own shimmer, same total drift rate). The row->index mapping
        // never changes, just what those indices render as.
        if (frame != 0 && (frame % 10) == 0) {
            grad_hue = (unsigned char)(grad_hue + 1);
            tun_push_gradient_hue();
        }
    }

    tun_done();
}
