// UltimateDemo2026 — Perspective floor + bouncing ball
//
// MC bitmap, VIC bank 3 ($E000 bitmap, $C000 screen, $D800 color RAM).
// Perspective floor: horizon line + 7 horizontal + 9 vertical converging lines.
//   VP_X oscillates ±15 MC pixels (camera pan); pairs with lateral ball sway
//   at 2:1 frequency for a Lissajous-style trajectory.
// Ball: perspective-projected sphere above floor; radius scales with depth
//   (r ≈ 18 when close, ≈ 9 when far). Checkerboard surface + latitude / meridian lines.
// Shadow: stippled ellipse projected onto floor, perspective-scaled.
//
// World: Y up, Z into screen. Floor at Y=0, camera at Y=FLOOR_H=100.
// wz range 160..320 via sin(t_depth); PERSP_D=180.
// 600 frames at 64 MHz via turbo_fast().

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
// Perspective floor
//
// HORIZON_Y: horizon screen-Y.  Points below horizon are on the floor.
// FLOOR_H:   camera height above floor in world units.
// PERSP_D:   focal length in world units.
// SCR_CX:    screen centre X in MC pixels (0-159 range).
//
// Horizontal line y positions chosen so gaps grow toward the bottom
// (geometric series ×1.4 per step), matching true perspective spacing.
// floor_hy[6] = internal lines; y=199 (bottom edge) drawn separately.
//
// Vertical lines fan from VP=(vp_x, HORIZON_Y) to 9 equally spaced
// points at y=199; vp_x oscillates for camera-pan illusion.
// ---------------------------------------------------------------
#define HORIZON_Y   72
#define FLOOR_H    100
#define PERSP_D    180
#define SCR_CX      80
#define BALL_WR     16   // ball world radius
#define BOUNCE_MAX  60   // max ball height above floor in world units

// Horizontal floor line y positions: gaps from HORIZON_Y are 5,7,10,15,22,32,45
// giving the geometric "closer lines bunch at top" perspective look.
static const unsigned char floor_hy[6] = { 77, 84, 94, 109, 131, 163 };

// Vertical floor line X positions at bottom (y=199), equally spaced (8 segments).
static const unsigned char floor_bx[9] = { 0, 20, 40, 60, 80, 100, 120, 140, 159 };

static void draw_floor(int vp_x)
{
    unsigned char i;
    // Horizon line
    mc_hspan(HORIZON_Y, 0, 159, 1);
    // Horizontal floor lines (mc_hspan is faster than mc_line for full-width spans)
    for (i = 0; i < 6; i++)
        mc_hspan((int)floor_hy[i], 0, 159, 1);
    mc_hspan(199, 0, 159, 1);
    // Vertical converging lines
    for (i = 0; i < 9; i++)
        mc_line(vp_x, HORIZON_Y, (int)floor_bx[i], 199, 1);
}

// ---------------------------------------------------------------
// Shadow: stippled perspective ellipse on floor at (sx, sy_floor)
// ---------------------------------------------------------------
static void draw_shadow(int sx, int sy, int rx, int ry)
{
    if (rx < 1) rx = 1;
    if (ry < 1) ry = 1;
    int ry2 = ry * ry;
    int dy;
    for (dy = -ry; dy <= ry; dy++) {
        int y = sy + dy;
        if ((unsigned)y >= 200u) continue;
        int rem = ry2 - dy * dy;
        if (rem < 0) continue;
        int root = mc_isqrt((unsigned int)rem);
        int span = rx * root / ry;
        int px;
        for (px = sx - span; px <= sx + span; px += 2)
            mc_setpix(px, y, 3);
    }
}

// ---------------------------------------------------------------
// Ball surface: alternating checkerboard sectors + lat/meridian lines.
// r: screen radius in MC pixels (perspective-scaled by caller).
// Latitude band boundaries are proportional to r (scaled from the
// canonical r=13 template: bands at ±9 and ±5 units).
// ---------------------------------------------------------------
static void draw_ball(int cx, int cy, unsigned char gy_angle, int r)
{
    if (r < 3) r = 3;
    int r2 = r * r;
    // Latitude boundaries proportional to r
    int lat0 = -(9 * r / 13);
    int lat1 = -(5 * r / 13);
    int lat3 =  (5 * r / 13);
    int lat4 =  (9 * r / 13);

    int dy;
    // Checkerboard surface pass
    for (dy = -r; dy <= r; dy++) {
        int y = cy + dy;
        if ((unsigned)y >= 200u) continue;
        int rem = r2 - dy * dy;
        if (rem <= 0) continue;
        int span = mc_isqrt((unsigned int)rem);

        unsigned char lat_band;
        if      (dy < lat0) lat_band = 0;
        else if (dy < lat1) lat_band = 1;
        else if (dy < 0)    lat_band = 2;
        else if (dy < lat3) lat_band = 3;
        else if (dy < lat4) lat_band = 4;
        else                lat_band = 5;

        static int mx[4];
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

    // Latitude lines (black)
    {
        int lats[5];
        lats[0] = lat0; lats[1] = lat1; lats[2] = 0;
        lats[3] = lat3; lats[4] = lat4;
        unsigned char li;
        for (li = 0; li < 5; li++) {
            int lat_dy = lats[li];
            int y = cy + lat_dy;
            if ((unsigned)y >= 200u) continue;
            int rem = r2 - lat_dy * lat_dy;
            if (rem <= 0) continue;
            int sp = mc_isqrt((unsigned int)rem);
            mc_hspan(y, cx - sp, cx + sp, 0);
        }
    }

    // Meridian lines (black)
    {
        unsigned char mi;
        for (mi = 0; mi < 4; mi++) {
            unsigned char phi = (unsigned char)(gy_angle + (unsigned char)(mi * 16));
            int cos_phi = bcos(phi);
            for (dy = -r; dy <= r; dy++) {
                int y = cy + dy;
                if ((unsigned)y >= 200u) continue;
                int rem = r2 - dy * dy;
                if (rem <= 0) continue;
                int sp = mc_isqrt((unsigned int)rem);
                mc_setpix(cx + cos_phi * sp / 127, y, 0);
            }
        }
    }
}

// ---------------------------------------------------------------
// VIC setup — MC mode, bank 3
// MC palette:
//   color 00 ($D021): black   — background / meridian/lat lines
//   color 01 (sc lo nib=2):  red     — ball checker alternate
//   color 10 (sc hi nib=1):  white   — ball checker + floor lines
//   color 11 (CRAM=12):      med-grey — shadow stipple
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
//
// Trajectory timers and their periods at 50 fps:
//   t_bounce  +2/frame → 32-frame half-period (0.64 s per bounce)
//   t_depth   +1/frame → 64-frame period      (1.28 s depth oscillation)
//   t_sway    +2/frame → 32-frame period       (0.64 s lateral sway)
//   t_pan     +1/frame → 64-frame period       (1.28 s floor VP pan)
//   gy_angle  +1/frame → 64-frame full spin
//
// t_sway runs at 2× t_depth frequency → Lissajous figure-8 ball path.
// t_pan is independent of sway so floor and ball move at different rates.
// ---------------------------------------------------------------
void ball_run(void)
{
    unsigned char t_bounce = 0;
    unsigned char t_depth  = 0;
    unsigned char t_sway   = 0;
    unsigned char t_pan    = 0;
    unsigned char gy_angle = 0;
    unsigned int  frame;

    turbo_fast();
    ball_init();

    for (frame = 0; frame < 600; frame++) {
        vic_waitFrame();
        memset(BL_HIRES, 0, 8000);

        // Vanishing point X oscillates ±15 MC pixels around screen centre
        int vp_x = SCR_CX + bsin(t_pan) * 15 / 127;

        // Ball world position
        int wz = 240 + bsin(t_depth) * 80 / 127;   // depth:  160..320
        int wx = bsin(t_sway) * 30 / 127;           // lateral: ±30 world units
        int wy = bsin(t_bounce);                     // raw: -127..127
        if (wy < 0) wy = -wy;                        // abs:     0..127
        wy = wy * BOUNCE_MAX / 127;                  // scale:   0..BOUNCE_MAX

        // Perspective projection (all operands fit in 16-bit signed int)
        int sx       = SCR_CX + wx * PERSP_D / wz;
        int sy_floor = HORIZON_Y + FLOOR_H * PERSP_D / wz;
        int sy_ball  = HORIZON_Y + (FLOOR_H - wy) * PERSP_D / wz;
        int r_ball   = BALL_WR * PERSP_D / wz;
        int r_shx    = 8 * PERSP_D / wz;
        int r_shy    = 3 * PERSP_D / wz;

        draw_floor(vp_x);
        draw_shadow(sx, sy_floor, r_shx, r_shy);
        draw_ball(sx, sy_ball, gy_angle, r_ball);

        t_bounce = (unsigned char)(t_bounce + 2);
        t_depth  = (unsigned char)(t_depth  + 1);
        t_sway   = (unsigned char)(t_sway   + 2);
        t_pan    = (unsigned char)(t_pan    + 1);
        gy_angle = (unsigned char)(gy_angle + 1);
    }

    ball_done();
}
