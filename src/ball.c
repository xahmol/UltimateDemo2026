// UltimateDemo2026 — Rotating Wireframe Cube + Internal Bouncing Ball
//
// MC bitmap, VIC bank 3 ($E000 bitmap, $C000 screen, $D800 color RAM).
// Cube: 8 vertices, 12 edges + 24 face grid lines (4 per face, 2 per direction).
// Ball: 3D trajectory inside cube, perspective-projected; checkerboard surface.
// Shadow: stippled grey ellipse projected onto cube floor (y = -CUBE_R plane).

#include <c64/vic.h>
#include <c64/memmap.h>
#include <string.h>
#include "turbo.h"
#include "ball.h"

#define BL_SCREEN  ((char *)0xC000)
#define BL_HIRES   ((char *)0xE000)
#define BL_CRAM    ((char *)0xD800)

// Sin table — 64 entries, amplitude ±127
static const signed char bsin64[64] = {
      0,  12,  25,  37,  49,  60,  71,  81,
     90,  98, 106, 112, 117, 122, 125, 126,
    127, 126, 125, 122, 117, 112, 106,  98,
     90,  81,  71,  60,  49,  37,  25,  12,
      0, -12, -25, -37, -49, -60, -71, -81,
    -90, -98,-106,-112,-117,-122,-125,-126,
   -127,-126,-125,-122,-117,-112,-106, -98,
    -90, -81, -71, -60, -49, -37, -25, -12
};
static inline int bsin(unsigned char a) { return (int)bsin64[a & 63]; }
static inline int bcos(unsigned char a) { return (int)bsin64[(unsigned char)((a + 16) & 63)]; }

static int mc_isqrt(unsigned int n)
{
    if (n == 0) return 0;
    unsigned int r = n >> 1;
    if (r == 0) return 1;
    unsigned int p;
    do { p = r; r = (p + n / p) >> 1; } while (r < p);
    return (int)p;
}

static inline unsigned char mc_pat(unsigned char col)
{
    return (unsigned char)(col | (col << 2) | (col << 4) | (col << 6));
}

static void mc_setpix(int mx, int my, unsigned char col)
{
    if ((unsigned)mx >= 160u || (unsigned)my >= 200u) return;
    char *b = BL_HIRES
              + ((unsigned)my >> 3) * 320u
              + ((unsigned)my & 7u)
              + ((unsigned)(mx >> 2)) * 8u;
    unsigned char sh = (unsigned char)((3u - ((unsigned)mx & 3u)) << 1u);
    *b = (char)((*b & (unsigned char)~(3u << sh)) | (unsigned char)(col << sh));
}

static void mc_hspan(int my, int x0, int x1, unsigned char col)
{
    if ((unsigned)my >= 200u) return;
    if (x0 < 0) x0 = 0;
    if (x1 >= 160) x1 = 159;
    if (x0 > x1) return;
    unsigned char pat = mc_pat(col);
    char *row = BL_HIRES + ((unsigned)my >> 3) * 320u + ((unsigned)my & 7u);
    int bx0 = x0 >> 2;
    int bx1 = x1 >> 2;
    int px;
    if (bx0 == bx1) {
        for (px = x0; px <= x1; px++) mc_setpix(px, my, col);
        return;
    }
    for (px = x0; (px >> 2) == bx0; px++) mc_setpix(px, my, col);
    {
        int bx;
        for (bx = bx0 + 1; bx < bx1; bx++)
            row[bx * 8] = (char)pat;
    }
    for (px = bx1 * 4; px <= x1; px++) mc_setpix(px, my, col);
}

static void mc_line(int x0, int y0, int x1, int y1, unsigned char col)
{
    int dx = x1 - x0; if (dx < 0) dx = -dx;
    int dy = y1 - y0; if (dy < 0) dy = -dy;
    int sx = (x0 < x1) ? 1 : -1;
    int sy = (y0 < y1) ? 1 : -1;
    int err = dx - dy;
    for (;;) {
        mc_setpix(x0, y0, col);
        if (x0 == x1 && y0 == y1) break;
        int e2 = err << 1;
        if (e2 > -dy) { err -= dy; x0 += sx; }
        if (e2 <  dx) { err += dx; y0 += sy; }
    }
}

// ---------------------------------------------------------------
// 3D perspective projection
// Rotates (wx,wy,wz) by Y axis then X axis, projects to MC screen.
// ---------------------------------------------------------------
#define CUBE_R   48
#define CUBE_G   16   // CUBE_R / 3
#define PERSP_D  200
#define SCR_CX   80
#define SCR_CY   88

static void rot_proj(int wx, int wy, int wz,
                     unsigned char ax, unsigned char ay,
                     int *out_sx, int *out_sy)
{
    // Y-axis rotation
    int x1 = (bcos(ay) * wx + bsin(ay) * wz) / 127;
    int z1 = (-bsin(ay) * wx + bcos(ay) * wz) / 127;
    // X-axis rotation
    int y2 = (bcos(ax) * wy - bsin(ax) * z1) / 127;
    int z2 = (bsin(ax) * wy + bcos(ax) * z1) / 127;
    int zd = z2 + PERSP_D + CUBE_R;
    if (zd < 1) zd = 1;
    *out_sx = SCR_CX + x1 * PERSP_D / zd;
    *out_sy = SCR_CY + y2 * PERSP_D / zd;
}

// ---------------------------------------------------------------
// Cube geometry — 8 vertices, 12 edges, 24 face grid lines
// ---------------------------------------------------------------
static const signed char cube_v[8][3] = {
    {-1,-1,-1},{1,-1,-1},{1,1,-1},{-1,1,-1},
    {-1,-1,1},{1,-1,1},{1,1,1},{-1,1,1}
};
static const unsigned char cube_e[12][2] = {
    {0,1},{1,2},{2,3},{3,0},
    {4,5},{5,6},{6,7},{7,4},
    {0,4},{1,5},{2,6},{3,7}
};
// Grid line endpoints in units of CUBE_G (±3=±CUBE_R, 0=centre).
// 2 lines per face (centre cross) × 6 faces = 12 lines.
static const signed char grid_lines[12][6] = {
    // Top face (y=+3): centre x-line, centre z-line
    {-3, 3, 0, 3, 3, 0}, { 0, 3,-3, 0, 3, 3},
    // Bottom face (y=-3)
    {-3,-3, 0, 3,-3, 0}, { 0,-3,-3, 0,-3, 3},
    // Front face (z=+3): centre x-line, centre y-line
    {-3, 0, 3, 3, 0, 3}, { 0,-3, 3, 0, 3, 3},
    // Back face (z=-3)
    {-3, 0,-3, 3, 0,-3}, { 0,-3,-3, 0, 3,-3},
    // Right face (x=+3): centre y-line, centre z-line
    { 3,-3, 0, 3, 3, 0}, { 3, 0,-3, 3, 0, 3},
    // Left face (x=-3)
    {-3,-3, 0,-3, 3, 0}, {-3, 0,-3,-3, 0, 3}
};
#define GRID_LINES 12

static void draw_cube(unsigned char ax, unsigned char ay)
{
    static int vsx[8], vsy[8];   // static: avoids stack pressure
    unsigned char i;
    for (i = 0; i < 8; i++)
        rot_proj((int)cube_v[i][0] * CUBE_R,
                 (int)cube_v[i][1] * CUBE_R,
                 (int)cube_v[i][2] * CUBE_R,
                 ax, ay, &vsx[i], &vsy[i]);
    for (i = 0; i < 12; i++)
        mc_line(vsx[cube_e[i][0]], vsy[cube_e[i][0]],
                vsx[cube_e[i][1]], vsy[cube_e[i][1]], 1);
    for (i = 0; i < GRID_LINES; i++) {
        int sx1, sy1, sx2, sy2;
        rot_proj((int)grid_lines[i][0] * CUBE_G,
                 (int)grid_lines[i][1] * CUBE_G,
                 (int)grid_lines[i][2] * CUBE_G,
                 ax, ay, &sx1, &sy1);
        rot_proj((int)grid_lines[i][3] * CUBE_G,
                 (int)grid_lines[i][4] * CUBE_G,
                 (int)grid_lines[i][5] * CUBE_G,
                 ax, ay, &sx2, &sy2);
        mc_line(sx1, sy1, sx2, sy2, 1);
    }
}

// ---------------------------------------------------------------
// Shadow: stippled ellipse on cube floor (y = -CUBE_R)
// ---------------------------------------------------------------
#define SHADOW_RX  8
#define SHADOW_RY  3

static void draw_shadow(unsigned char ax, unsigned char ay, int bx, int bz)
{
    int sx, sy;
    rot_proj(bx, -CUBE_R, bz, ax, ay, &sx, &sy);
    signed char dy;
    int ry2 = SHADOW_RY * SHADOW_RY;
    for (dy = -SHADOW_RY; dy <= SHADOW_RY; dy++) {
        int y = sy + (int)dy;
        if ((unsigned)y >= 200u) continue;
        int rem = ry2 - (int)dy * (int)dy;
        if (rem < 0) continue;
        int root = mc_isqrt((unsigned)rem);
        int span = SHADOW_RX * root / SHADOW_RY;
        int px;
        for (px = sx - span; px <= sx + span; px += 2)
            mc_setpix(px, y, 3);
    }
}

// ---------------------------------------------------------------
// 3D ball — bounces inside cube walls
// ---------------------------------------------------------------
#define BALL_3D_R  12
#define BALL_LIMIT 36   // CUBE_R - BALL_3D_R
#define BALL_SCR_R 13   // screen radius in MC pixels

static int ball_x, ball_y, ball_z;
static signed char ball_vx, ball_vy, ball_vz;

static void update_ball(void)
{
    ball_x += (int)ball_vx;
    if (ball_x >  BALL_LIMIT) { ball_x =  BALL_LIMIT; ball_vx = -ball_vx; }
    if (ball_x < -BALL_LIMIT) { ball_x = -BALL_LIMIT; ball_vx = -ball_vx; }
    ball_y += (int)ball_vy;
    if (ball_y >  BALL_LIMIT) { ball_y =  BALL_LIMIT; ball_vy = -ball_vy; }
    if (ball_y < -BALL_LIMIT) { ball_y = -BALL_LIMIT; ball_vy = -ball_vy; }
    ball_z += (int)ball_vz;
    if (ball_z >  BALL_LIMIT) { ball_z =  BALL_LIMIT; ball_vz = -ball_vz; }
    if (ball_z < -BALL_LIMIT) { ball_z = -BALL_LIMIT; ball_vz = -ball_vz; }
}

// ---------------------------------------------------------------
// Ball surface: alternating red/white checkerboard sectors
// Lat band boundaries scaled to BALL_SCR_R=13.
// ---------------------------------------------------------------
static void draw_ball(int cx, int cy, unsigned char gy_angle)
{
    static const signed char lats[5] = { -9, -5, 0, 5, 9 };
    int dy, r2 = BALL_SCR_R * BALL_SCR_R;

    for (dy = -BALL_SCR_R; dy <= BALL_SCR_R; dy++) {
        int y = cy + dy;
        if ((unsigned)y >= 200u) continue;
        int rem = r2 - dy * dy;
        if (rem <= 0) continue;
        int span = mc_isqrt((unsigned)rem);

        unsigned char lat_band;
        if      (dy < -9) lat_band = 0;
        else if (dy < -5) lat_band = 1;
        else if (dy <  0) lat_band = 2;
        else if (dy <  5) lat_band = 3;
        else if (dy <  9) lat_band = 4;
        else              lat_band = 5;

        static int mx[4];   // static: avoids stack pressure
        unsigned char mi;
        for (mi = 0; mi < 4; mi++) {
            unsigned char phi = (unsigned char)(gy_angle + (unsigned char)(mi * 16));
            mx[mi] = cx + bcos(phi) * span / 127;
        }
        {
            unsigned char si, sj;
            for (si = 0; si < 3; si++)
                for (sj = (unsigned char)(si + 1); sj < 4; sj++)
                    if (mx[si] > mx[sj]) {
                        int t = mx[si]; mx[si] = mx[sj]; mx[sj] = t;
                    }
        }
        int seg_x0 = cx - span;
        unsigned char seg;
        for (seg = 0; seg < 5; seg++) {
            int seg_x1 = (seg < 4) ? mx[seg] : cx + span;
            unsigned char col = (unsigned char)(((seg + lat_band) & 1) ? 2 : 1);
            mc_hspan(y, seg_x0, seg_x1, col);
            seg_x0 = seg_x1 + 1;
        }
    }
    {
        unsigned char li;
        for (li = 0; li < 5; li++) {
            int lat_dy = (int)lats[li];
            int y = cy + lat_dy;
            if ((unsigned)y >= 200u) continue;
            int rem = r2 - lat_dy * lat_dy;
            if (rem <= 0) continue;
            int span = mc_isqrt((unsigned)rem);
            mc_hspan(y, cx - span, cx + span, 0);
        }
    }
    {
        unsigned char mi;
        for (mi = 0; mi < 4; mi++) {
            unsigned char phi = (unsigned char)(gy_angle + (unsigned char)(mi * 16));
            int cos_phi = bcos(phi);
            for (dy = -BALL_SCR_R; dy <= BALL_SCR_R; dy++) {
                int y = cy + dy;
                if ((unsigned)y >= 200u) continue;
                int rem = r2 - dy * dy;
                if (rem <= 0) continue;
                int span = mc_isqrt((unsigned)rem);
                mc_setpix(cx + cos_phi * span / 127, y, 0);
            }
        }
    }
}

// ---------------------------------------------------------------
// VIC setup — MC mode, bank 3
// ---------------------------------------------------------------
static void ball_init(void)
{
    unsigned int i;
    __asm { sei }
    mmap_set(MMAP_NO_ROM);
    mmap_trampoline();
    __asm { cli }
    memset(BL_HIRES, 0, 8000);
    for (i = 0; i < 1000; i++) {
        BL_SCREEN[i] = (char)0x12;
        BL_CRAM[i]   = (char)12;
    }
    vic_setmode(VICM_HIRES_MC, BL_SCREEN, BL_HIRES);
    vic.color_back   = VCOL_BLACK;
    vic.color_border = VCOL_BLACK;
}

static void ball_done(void)
{
    mmap_set(MMAP_NO_BASIC);
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
    vic.color_border = 0;
    vic.color_back   = 0;
}

// ---------------------------------------------------------------
// Public entry point
// ---------------------------------------------------------------
void ball_run(void)
{
    unsigned char ax = 0, ay = 0;
    unsigned char gy_angle = 0;
    unsigned int  frame;

    ball_x = 0; ball_y = 0; ball_z = 0;
    ball_vx = 2; ball_vy = 3; ball_vz = 5;

    turbo_fast();
    ball_init();

    for (frame = 0; frame < 600; frame++) {
        vic_waitFrame();
        memset(BL_HIRES, 0, 8000);

        update_ball();

        int bsx, bsy;
        rot_proj(ball_x, ball_y, ball_z, ax, ay, &bsx, &bsy);

        // Shadow on floor, ball inside, cube wireframe on top
        draw_shadow(ax, ay, ball_x, ball_z);
        draw_ball(bsx, bsy, gy_angle);
        draw_cube(ax, ay);

        ax = (unsigned char)(ax + 1);
        ay = (unsigned char)(ay + 2);
        gy_angle = (unsigned char)(gy_angle + 1);
    }

    ball_done();
}
