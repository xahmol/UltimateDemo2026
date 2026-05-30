// UltimateDemo2026 — 3D texture-mapped tunnel
//
// Polar-coordinate tunnel effect with rotation, zoom, and lateral camera sway.
// 16 KB of lookup tables stored in REU (C64 RAM is full).
// Per frame: 100 single 160-byte REU fetches (angle+dist combined), then render.
//
// REU layout ($200000 base, clear of MOD at $000000):
//   Row y at offset y*160: bytes 0-79 = angle (0-31), bytes 80-159 = dist (0-31)
//   100 rows x 160 bytes = 16000 bytes total
//
// C64 BSS: row_buf[160] + tex_flat[1024] = 1184 bytes
//
// Render: 100 ty iterations, each writing top row (ty) + bottom mirror (199-ty).
// Lateral sway: slow 64-step sine shifts the j table-column index ±6 columns.
// Bottom-half angle: (32 - top_angle) & 31 (mirror symmetry, computed in-loop).

#include <c64/vic.h>
#include <c64/memmap.h>
#include <string.h>
#include "turbo.h"
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

// 64-step smooth lateral sway, amplitude ±6 table columns (= ±12 MC pixels).
// Stored as const: goes in data segment, not BSS.
// Period = 64 frames at 1/frame rate ≈ 1.28 sec at 50 fps.
static const signed char lat_wave[64] = {
     0,  1,  1,  2,  2,  3,  3,  4,
     4,  5,  5,  5,  6,  6,  6,  6,
     6,  6,  6,  5,  5,  5,  4,  4,
     3,  3,  2,  2,  1,  1,  0,  0,
    -1, -1, -2, -2, -3, -3, -4, -4,
    -5, -5, -5, -6, -6, -6, -6, -6,
    -6, -6, -5, -5, -5, -4, -4, -3,
    -3, -2, -2, -1, -1,  0,  0,  1
};

// ---------------------------------------------------------------
// REU DMA helper
// ---------------------------------------------------------------

static void reu_dma(unsigned char cmd, unsigned long reu_addr,
                    void *c64_addr, unsigned char len)
{
    TUN_REU_C64LO = (unsigned char)((unsigned)c64_addr);
    TUN_REU_C64HI = (unsigned char)((unsigned)c64_addr >> 8);
    TUN_REU_REULO = (unsigned char)(reu_addr);
    TUN_REU_REUMI = (unsigned char)(reu_addr >> 8);
    TUN_REU_REUHI = (unsigned char)(reu_addr >> 16);
    TUN_REU_LENLO = len;
    TUN_REU_LENHI = 0;
    TUN_REU_CMD   = cmd;
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
// Build tables into REU (100 rows x 160 bytes = 1 DMA per row)
// ---------------------------------------------------------------

static void tunnel_build_tables(void)
{
    char y;
    unsigned char x;
    for (y = 0; y < 100; y++) {
        int dy = (int)y - 100;
        for (x = 0; x < 80; x++) {
            int dx = (int)x * 2 - 80;
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
// lat_j: horizontal table-column shift for lateral camera sway (±6)
// ---------------------------------------------------------------

static void tunnel_render(unsigned char t_ang, unsigned char t_dist, signed char lat_j)
{
    unsigned char ty;
    for (ty = 0; ty < 100; ty++) {
        // Fetch combined angle+dist row from REU in one call
        reu_dma(TUN_REU_FETCH,
                TUN_DATA_REU + (unsigned long)ty * 160,
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

// ---------------------------------------------------------------
// VIC setup — mirrors mandel.c mc_init / mc_done pattern exactly
// ---------------------------------------------------------------

static void tun_init(void)
{
    char *sc = TUN_SCREEN;
    char *cr = TUN_CRAM;
    unsigned int i;

    mmap_set(MMAP_NO_ROM);

    memset(TUN_BITMAP, 0, 8000);

    // Stone tunnel MC palette:
    //   color 00 ($D021 bg):       black=0    — shadow
    //   color 01 (screen lo nib):  brown=9    — brick dark face
    //   color 10 (screen hi nib):  lt-grey=15 — brick lit face
    //   color 11 (color RAM nib):  white=1    — mortar
    for (i = 0; i < 1000; i++) {
        sc[i] = (char)0xF9;
        cr[i] = (char)1;
    }

    vic_setmode(VICM_HIRES_MC, TUN_SCREEN, TUN_BITMAP);
    vic.color_back   = VCOL_BLACK;
    vic.color_border = VCOL_BLACK;
}

static void tun_done(void)
{
    mmap_set(MMAP_NO_BASIC);
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
    vic.color_border = 0;
    vic.color_back   = 0;
}

// Color palettes for periodic cycling:
// Each entry: [screen_byte, cram_byte]
// screen byte = (c1_hi_nibble << 4) | c2_lo_nibble; cram = c3 color
// bg ($D021) fixed at black(0).
static const unsigned char pal_sc[4] = { 0xF9, 0xE3, 0xA8, 0xD5 };
static const unsigned char pal_cr[4] = {    1,    1,    7,    3  };
// Scheme 0: lt-grey(15)/brown(9),  c3=white  — stone tunnel (initial)
// Scheme 1: lt-blue(14)/cyan(3),   c3=white  — ice tunnel
// Scheme 2: lt-red(10)/orange(8),  c3=yellow — fire tunnel
// Scheme 3: lt-green(13)/green(5), c3=cyan   — alien tunnel

// ---------------------------------------------------------------
// Public entry point
// ---------------------------------------------------------------

void tunnel_run(void)
{
    turbo_fast();
    tunnel_build_tables();
    tunnel_build_tex();
    tun_init();

    unsigned char t_ang     = 0;
    unsigned char t_dist    = 0;
    unsigned char t_lateral = 0;
    unsigned char cur_pal   = 0;
    unsigned int  frame;

    for (frame = 0; frame < 800; frame++) {
        // Switch palette every 200 frames
        unsigned char new_pal = (unsigned char)(frame / 200) & 3;
        if (new_pal != cur_pal) {
            cur_pal = new_pal;
            memset(TUN_SCREEN, pal_sc[cur_pal], 1000);
            memset(TUN_CRAM,   pal_cr[cur_pal], 1000);
        }

        signed char lat_j = lat_wave[t_lateral & 63];
        tunnel_render(t_ang, t_dist, lat_j);
        vic_waitFrame();
        t_ang     = (unsigned char)(t_ang  + 1);
        t_dist    = (unsigned char)(t_dist + 1);
        t_lateral = (unsigned char)(t_lateral + 1);
    }

    tun_done();
}
