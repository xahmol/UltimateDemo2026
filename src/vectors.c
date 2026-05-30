// UltimateDemo2026 — 3D Rotating Wireframe Vectors
//
// Rotating cube: 8 vertices, 12 edges.
// 256-entry 4.12 fixed-point sin table; matrix rotation about X and Y axes.
// Perspective projection: projected_x = vx * PERSP / (vz + PERSP).
// XOR line-draw on hires bitmap (same VIC bank-3 setup as gears.c).
// Bresenham lines via bm_line() with LINOP_XOR.
// Erase old frame, advance angles, draw new frame — no bitmap clear needed.

#include <c64/vic.h>
#include <c64/cia.h>
#include <c64/memmap.h>
#include <gfx/bitmap.h>
#include <string.h>
#include "turbo.h"
#include "vectors.h"

#define VEC_COLOR  ((char *)0xD000)
#define VEC_HIRES  ((char *)0xE000)

static Bitmap   VScreen;
static ClipRect vcr = {0, 0, 320, 200};

// 256-entry 4.12 fixed-point sin table: sin256[i] = round(4096*sin(2*pi*i/256))
// Values range -4096 to +4096.
static const int sin256[256] = {
        0,  101,  201,  301,  401,  501,  601,  700,
      799,  897,  995, 1092, 1189, 1285, 1380, 1474,
     1567, 1660, 1751, 1842, 1931, 2019, 2106, 2191,
     2276, 2359, 2440, 2520, 2598, 2675, 2751, 2824,
     2896, 2967, 3035, 3102, 3166, 3229, 3290, 3349,
     3406, 3461, 3513, 3564, 3612, 3659, 3703, 3745,
     3784, 3822, 3857, 3889, 3920, 3948, 3973, 3996,
     4017, 4036, 4052, 4065, 4076, 4085, 4091, 4095,
     4096, 4095, 4091, 4085, 4076, 4065, 4052, 4036,
     4017, 3996, 3973, 3948, 3920, 3889, 3857, 3822,
     3784, 3745, 3703, 3659, 3612, 3564, 3513, 3461,
     3406, 3349, 3290, 3229, 3166, 3102, 3035, 2967,
     2896, 2824, 2751, 2675, 2598, 2520, 2440, 2359,
     2276, 2191, 2106, 2019, 1931, 1842, 1751, 1660,
     1567, 1474, 1380, 1285, 1189, 1092,  995,  897,
      799,  700,  601,  501,  401,  301,  201,  101,
        0, -101, -201, -301, -401, -501, -601, -700,
     -799, -897, -995,-1092,-1189,-1285,-1380,-1474,
    -1567,-1660,-1751,-1842,-1931,-2019,-2106,-2191,
    -2276,-2359,-2440,-2520,-2598,-2675,-2751,-2824,
    -2896,-2967,-3035,-3102,-3166,-3229,-3290,-3349,
    -3406,-3461,-3513,-3564,-3612,-3659,-3703,-3745,
    -3784,-3822,-3857,-3889,-3920,-3948,-3973,-3996,
    -4017,-4036,-4052,-4065,-4076,-4085,-4091,-4095,
    -4096,-4095,-4091,-4085,-4076,-4065,-4052,-4036,
    -4017,-3996,-3973,-3948,-3920,-3889,-3857,-3822,
    -3784,-3745,-3703,-3659,-3612,-3564,-3513,-3461,
    -3406,-3349,-3290,-3229,-3166,-3102,-3035,-2967,
    -2896,-2824,-2751,-2675,-2598,-2520,-2440,-2359,
    -2276,-2191,-2106,-2019,-1931,-1842,-1751,-1660,
    -1567,-1474,-1380,-1285,-1189,-1092, -995, -897,
     -799, -700, -601, -501, -401, -301, -201, -101
};

static inline int vsin(unsigned char a) { return sin256[(unsigned char)a]; }
static inline int vcos(unsigned char a) { return sin256[(unsigned char)(a + 64)]; }

// Cube vertices: ±80 units in each axis
#define CUBE_R  80
static const signed char cube_v[8][3] = {
    {-1,-1,-1}, { 1,-1,-1}, { 1, 1,-1}, {-1, 1,-1},
    {-1,-1, 1}, { 1,-1, 1}, { 1, 1, 1}, {-1, 1, 1}
};
// 12 edges: pairs of vertex indices
static const unsigned char cube_e[12][2] = {
    {0,1},{1,2},{2,3},{3,0},   // back face
    {4,5},{5,6},{6,7},{7,4},   // front face
    {0,4},{1,5},{2,6},{3,7}    // connecting edges
};

#define PERSP  200

static int px_cur[8], py_cur[8];

static void project(unsigned char ax, unsigned char ay, int *sx, int *sy)
{
    unsigned char i;
    for (i = 0; i < 8; i++) {
        // Rotate about Y axis first
        int x0 = (int)cube_v[i][0] * CUBE_R;
        int y0 = (int)cube_v[i][1] * CUBE_R;
        int z0 = (int)cube_v[i][2] * CUBE_R;

        // Cast to long before multiply — vcos/vsin up to ±4096, coords up to ±80,
        // product 327680 overflows 16-bit int without the cast.
        int x1 = (int)(((long)vcos(ay) * x0 + (long)vsin(ay) * z0) >> 12);
        int z1 = (int)((-(long)vsin(ay) * x0 + (long)vcos(ay) * z0) >> 12);

        // Rotate about X axis
        int y2 = (int)(((long)vcos(ax) * y0 - (long)vsin(ax) * z1) >> 12);
        int z2 = (int)(((long)vsin(ax) * y0 + (long)vcos(ax) * z1) >> 12);

        int zd = z2 + PERSP + CUBE_R;
        if (zd < 1) zd = 1;
        sx[i] = 160 + (int)(x1 * PERSP / zd);
        sy[i] = 100 + (int)(y2 * PERSP / zd);
    }
}

static void draw_cube(int *sx, int *sy)
{
    unsigned char e;
    for (e = 0; e < 12; e++) {
        unsigned char a = cube_e[e][0];
        unsigned char b = cube_e[e][1];
        bm_line(&VScreen, &vcr, sx[a], sy[a], sx[b], sy[b], 0xFF, LINOP_SET);
    }
}

static void vec_init(void)
{
    __asm { sei }
    mmap_set(MMAP_RAM);
    memset(VEC_COLOR, 0x10, 1000);
    memset(VEC_HIRES, 0x00, 8000);
    mmap_set(MMAP_NO_ROM);
    mmap_trampoline();
    __asm { cli }
    vic_setmode(VICM_HIRES, VEC_COLOR, VEC_HIRES);
    vic.color_border = VCOL_BLACK;
    vic.color_back   = VCOL_BLACK;
    bm_init(&VScreen, VEC_HIRES, 40, 25);
}

static void vec_done(void)
{
    mmap_set(MMAP_NO_BASIC);
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
    vic.color_border = 0;
    vic.color_back   = 0;
}

void vectors_run(void)
{
    unsigned char ax = 0, ay = 0;
    unsigned int  frame;

    vec_init();

    for (frame = 0; frame < 600; frame++) {
        vic_waitFrame();

        memset(VEC_HIRES, 0x00, 8000);

        ax = (unsigned char)(ax + 1);
        ay = (unsigned char)(ay + 2);

        project(ax, ay, px_cur, py_cur);
        draw_cube(px_cur, py_cur);
    }

    vec_done();
}
