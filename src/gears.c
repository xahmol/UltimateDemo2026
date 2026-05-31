// UltimateDemo2026 — Gear rotation demo
//
// XOR animation (tutorial 5000/5010 style): draw at new position (XOR),
// erase old position (XOR same lines).  No bitmap clear needed — the
// race-condition that caused the right gear to disappear at 24-48 MHz
// is eliminated because no memset write competes with the VIC read.
//
// Hub circle rotates with gear angle so XOR erase+draw differ each frame.
// Center bolt replaced by a rotating 2-pixel line through the hub.
// Text band (speed label + message) persists; cleared only on speed change.

#include <c64/vic.h>
#include <c64/cia.h>
#include <c64/memmap.h>
#include <gfx/bitmap.h>
#include <string.h>
#include "turbo.h"
#include "gears.h"

#define GR_COLOR  ((char *)0xD000)
#define GR_HIRES  ((char *)0xE000)

static Bitmap   Screen;
static ClipRect cr = {0, 0, 320, 200};

static const signed char sin64[64] = {
      0,  12,  25,  37,  49,  60,  71,  81,
     90,  98, 106, 112, 117, 122, 125, 126,
    127, 126, 125, 122, 117, 112, 106,  98,
     90,  81,  71,  60,  49,  37,  25,  12,
      0, -12, -25, -37, -49, -60, -71, -81,
    -90, -98,-106,-112,-117,-122,-125,-126,
   -127,-126,-125,-122,-117,-112,-106, -98,
    -90, -81, -71, -60, -49, -37, -25, -12
};

static inline int isin(char a) { return (int)sin64[a & 63]; }
static inline int icos(char a) { return (int)sin64[(char)(a + 16) & 63]; }

// ---------------------------------------------------------------
// Gear geometry
// ---------------------------------------------------------------
#define G1_N      16
#define G1_STEP    4
#define G1_BASE   44
#define G1_TIP    54
#define G1_HUB    10
#define G1_HW      4
#define G1_CX    120
#define G1_CY     88
#define G1_SPOKES  6

#define G2_N       8
#define G2_STEP    8
#define G2_BASE   28
#define G2_TIP    40
#define G2_HUB     8
#define G2_HW      4
#define G2_CX    208
#define G2_CY     88
#define G2_SPOKES  4

#define G2_PHASE  28

// ---------------------------------------------------------------
// Text band — only region that needs explicit clear (gears use XOR).
// Gear lines stay within rows 22-154; text rows 156-199 are separate.
// ---------------------------------------------------------------
#define BM_STRIDE  40
#define TEXT_Y0   156
#define TEXT_ROWS  44
#define MSG_Y     162
#define SPEED_Y   174

static void clear_text_band(void)
{
    memset(GR_HIRES + TEXT_Y0 * BM_STRIDE, 0, TEXT_ROWS * BM_STRIDE);
}

// ---------------------------------------------------------------
// draw_gear — XOR wireframe gear.
//
// All lines use LINOP_XOR: drawing twice at the same angle erases.
// Hub circle starts at 'angle' so it rotates each frame and differs
// between the erase and draw calls.
// Center mark: a 2-px line rotated by angle (XOR-safe).
// ---------------------------------------------------------------
static void draw_gear(int cx, int cy, char angle,
                      char n_teeth, char step,
                      char r_base, char r_tip, char r_hub,
                      char hw, char n_spokes)
{
    char t;
    int  first_lx = 0, first_ly = 0;
    int  prev_rx  = 0, prev_ry  = 0;
    int  prev_vmx = 0, prev_vmy = 0;

    // Tooth polygon with V-shaped valleys
    for (t = 0; t < n_teeth; t++) {
        char a  = (char)((angle + (char)(t * step)) & 63);
        int  sa = isin(a);
        int  ca = icos(a);
        int  bx = cx + ca * r_base / 127;
        int  by = cy + sa * r_base / 127;
        int  tx = cx + ca * r_tip  / 127;
        int  ty = cy + sa * r_tip  / 127;
        int  wx = (-sa * hw) / 127;
        int  wy = ( ca * hw) / 127;
        if (wx == 0 && wy == 0) wy = 1;

        if (t == 0) {
            first_lx = bx - wx;
            first_ly = by - wy;
        } else {
            bm_line(&Screen, &cr,
                    prev_vmx, prev_vmy, bx - wx, by - wy, 0xFF, LINOP_XOR);
        }

        bm_line(&Screen, &cr, bx-wx, by-wy, tx-wx, ty-wy, 0xFF, LINOP_XOR);
        bm_line(&Screen, &cr, tx-wx, ty-wy, tx+wx, ty+wy, 0xFF, LINOP_XOR);
        bm_line(&Screen, &cr, tx+wx, ty+wy, bx+wx, by+wy, 0xFF, LINOP_XOR);

        {
            char va  = (char)((a + step / 2) & 63);
            prev_vmx = cx + icos(va) * r_base / 127;
            prev_vmy = cy + isin(va) * r_base / 127;
        }

        bm_line(&Screen, &cr,
                bx + wx, by + wy, prev_vmx, prev_vmy, 0xFF, LINOP_XOR);

        prev_rx = bx + wx;
        prev_ry = by + wy;
    }

    bm_line(&Screen, &cr, prev_vmx, prev_vmy, first_lx, first_ly, 0xFF, LINOP_XOR);

    // Radial spokes (rotate with gear)
    {
        char spoke_step = (char)(64 / n_spokes);
        for (t = 0; t < n_spokes; t++) {
            char a  = (char)((angle + (char)(t * spoke_step)) & 63);
            int  sx = cx + icos(a) * r_hub  / 127;
            int  sy = cy + isin(a) * r_hub  / 127;
            int  ex = cx + icos(a) * r_base / 127;
            int  ey = cy + isin(a) * r_base / 127;
            bm_line(&Screen, &cr, sx, sy, ex, ey, 0xFF, LINOP_XOR);
        }
    }
}

// ---------------------------------------------------------------
// Speed number glyph — 5×7 at 2× scale
// ---------------------------------------------------------------
#define GLYPH_W      5
#define GLYPH_H      7
#define GLYPH_SCALE  2
#define CHAR_PITCH   12

static const unsigned char glyphs[13][7] = {
    {0x70,0x88,0x88,0x88,0x88,0x88,0x70},
    {0x20,0x60,0x20,0x20,0x20,0x20,0x70},
    {0x70,0x88,0x08,0x30,0x40,0x80,0xF8},
    {0x70,0x88,0x08,0x30,0x08,0x88,0x70},
    {0x10,0x30,0x50,0x90,0xF8,0x10,0x10},
    {0xF8,0x80,0xF0,0x08,0x08,0x88,0x70},
    {0x30,0x40,0x80,0xF0,0x88,0x88,0x70},
    {0xF8,0x08,0x10,0x20,0x40,0x40,0x40},
    {0x70,0x88,0x88,0x70,0x88,0x88,0x70},
    {0x70,0x88,0x88,0x78,0x08,0x10,0x60},
    {0x88,0xD8,0xA8,0x88,0x88,0x88,0x88},
    {0x88,0x88,0x88,0xF8,0x88,0x88,0x88},
    {0xF8,0x10,0x20,0x40,0x80,0x80,0xF8},
};

static void draw_glyph(int x, int y, char gi)
{
    const unsigned char *g = glyphs[(unsigned char)gi];
    char row, col;
    for (row = 0; row < GLYPH_H; row++)
        for (col = 0; col < GLYPH_W; col++)
            if (g[row] & (unsigned char)(0x80 >> col))
                bmu_rect_fill(&Screen,
                              x + col * GLYPH_SCALE,
                              y + row * GLYPH_SCALE,
                              GLYPH_SCALE, GLYPH_SCALE);
}

static const char * const speed_nums[16] = {
    "1","2","3","4","6","8","12","16",
    "20","24","28","32","36","40","48","64"
};

static void draw_speed(char idx)
{
    const char *num = speed_nums[(unsigned char)idx];
    char  nlen  = (char)strlen(num);
    int   total = (int)nlen * CHAR_PITCH
                  + (CHAR_PITCH / 2)
                  + CHAR_PITCH + CHAR_PITCH
                  + GLYPH_W * GLYPH_SCALE;
    int   x = (320 - total) / 2;
    char  i;

    for (i = 0; i < nlen; i++) {
        draw_glyph(x, SPEED_Y, (char)(num[i] - '0'));
        x += CHAR_PITCH;
    }
    x += CHAR_PITCH / 2;
    draw_glyph(x, SPEED_Y, 10); x += CHAR_PITCH;
    draw_glyph(x, SPEED_Y, 11); x += CHAR_PITCH;
    draw_glyph(x, SPEED_Y, 12);
}

static const char * const step_msg[16] = {
    "Standard 1 MHz C64 speed",
    "Turbo engaged: 2 MHz",
    "3 MHz - warming up",
    "4 MHz - smooth already!",
    "6 MHz - this feels different",
    "8 MHz - things are moving",
    "12 MHz - picking up speed",
    "16 MHz - noticeably fast",
    "20 MHz - what is happening?",
    "24 MHz - eyes can barely follow",
    "28 MHz - this is incredible!",
    "32 MHz - the machine screams",
    "36 MHz - beyond imagination",
    "40 MHz - hold on tight!",
    "48 MHz - maximum overdrive!",
    "64 MHz  ULTIMATE SPEED!!"
};

static void draw_message(char idx)
{
    const char *msg = step_msg[(unsigned char)idx];
    char  len  = (char)strlen(msg);
    int   tw   = bmu_text_size(msg, len);
    int   mx   = (320 - tw) / 2;
    bmu_put_chars(&Screen, mx, MSG_Y, msg, len, BLTOP_COPY);
}

// ---------------------------------------------------------------
// Hires init / cleanup
// ---------------------------------------------------------------
static void hires_init(void)
{
    __asm { sei }          // prevent modplay IRQ while CIA I/O is unmapped
    mmap_set(MMAP_RAM);
    memset(GR_COLOR, 0x10, 1000);
    memset(GR_HIRES, 0x00, 8000);
    mmap_set(MMAP_NO_ROM);
    // Without mmap_trampoline(), the hardware IRQ vector at $FFFE/$FFFF reads
    // from DRAM (not KERNAL ROM) while MMAP_NO_ROM is active.  The first
    // CIA1 Timer A IRQ after cli would jump to an uninitialised DRAM address
    // and crash — visually the "Press any key" screen hangs without the VIC
    // ever switching to hires mode.
    // mmap_trampoline() writes IRQ/NMI trampolines to $FFFE/$FFFF in DRAM so
    // interrupts temporarily remap KERNAL, run $FF48→$0314, then restore
    // MMAP_NO_ROM.  The vectors sit above the 8 KB bitmap clear ($E000–$FF3F)
    // and persist through mandel_run() without needing a second call.
    mmap_trampoline();
    __asm { cli }
    vic_setmode(VICM_HIRES, GR_COLOR, GR_HIRES);
    vic.color_border = VCOL_BLACK;
    bm_init(&Screen, GR_HIRES, 40, 25);
}

static void hires_done(void)
{
    mmap_set(MMAP_NO_BASIC);
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
    vic.color_border = 0;
    vic.color_back   = 0;
}

static void tod_reset(void)
{
    __asm { sei }
    cia1.tods = 0;
    cia1.todt = 0;
    __asm { cli }
}

// ---------------------------------------------------------------
// Engine sound — SID voices 0 + 1 ($D400/$D407).
// Safe at any turbo speed: $D400 is internal VIC-bank I/O, not
// expansion port — no bus-timing issues.
//
// Voice 0: sawtooth, frequency tracks turbo speed step.
//   f = 40 × 2^(step/8) Hz (2 octaves: 40 Hz idle → 147 Hz max).
// Voice 1: noise waveform, one octave above voice 0 at each step.
//   Both routed through LP filter (resonance 8, cutoff ~1.5 kHz)
//   to add body and a resonant growl without fully cleaning up V0.
//
// ---------------------------------------------------------------

// Voice 0 — sawtooth (engine pitch)
#define SID_V0_FLO  (*(volatile unsigned char *)0xD400)
#define SID_V0_FHI  (*(volatile unsigned char *)0xD401)
#define SID_V0_CTR  (*(volatile unsigned char *)0xD404)
#define SID_V0_AD   (*(volatile unsigned char *)0xD405)
#define SID_V0_SR   (*(volatile unsigned char *)0xD406)

// Voice 1 — noise (texture)
#define SID_V1_FLO  (*(volatile unsigned char *)0xD407)
#define SID_V1_FHI  (*(volatile unsigned char *)0xD408)
#define SID_V1_CTR  (*(volatile unsigned char *)0xD40B)
#define SID_V1_AD   (*(volatile unsigned char *)0xD40C)
#define SID_V1_SR   (*(volatile unsigned char *)0xD40D)

// Filter + master volume
#define SID_FILT_LO (*(volatile unsigned char *)0xD415)
#define SID_FILT_HI (*(volatile unsigned char *)0xD416)
#define SID_RES_FLT (*(volatile unsigned char *)0xD417)
#define SID_VOL     (*(volatile unsigned char *)0xD418)

#define SID_SAW     0x20
#define SID_NOISE   0x80
#define SID_GATE    0x01

// f = 40 × 2^(step/12) Hz (semitone per step: ~40 Hz idle → ~95 Hz max)
// SID PAL reg = f × 16777216 / 985248
// Noise (V1) runs at 2× (one octave above): sid_freq[step] << 1
static const unsigned sid_freq[16] = {
     681,   722,   765,   811,   /*  1  2  3  4 MHz */
     859,   910,   964,  1021,   /*  6  8 12 16 MHz */
    1082,  1146,  1215,  1287,   /* 20 24 28 32 MHz */
    1363,  1444,  1530,  1621    /* 36 40 48 64 MHz */
};

static void engine_init(void)
{
    // LP filter: cutoff ~1.5 kHz (11-bit 0xC0), resonance 8
    // both V0 (sawtooth) and V1 (noise) routed through filter
    SID_FILT_LO = 0x00;          // cutoff lo 3 bits = 0
    SID_FILT_HI = 0x18;          // cutoff hi 8 bits → 11-bit = 0xC0 ≈ 1.5 kHz
    SID_RES_FLT = 0x83;          // resonance = 8, route V0+V1 (bits 0+1)
    SID_VOL     = 0x1F;          // LP mode ON, master volume = 15

    // Voice 0: sawtooth engine tone
    SID_V0_AD  = 0x05;           // attack=0 (instant on), decay=5
    SID_V0_SR  = 0xF3;           // sustain=15 (full), release=3
    SID_V0_FLO = (unsigned char)sid_freq[0];
    SID_V0_FHI = (unsigned char)(sid_freq[0] >> 8);
    SID_V0_CTR = SID_SAW | SID_GATE;

    // Voice 1: noise texture, one octave above V0
    {
        unsigned nf = sid_freq[0] << 1;
        SID_V1_AD  = 0x05;
        SID_V1_SR  = 0xF3;
        SID_V1_FLO = (unsigned char)nf;
        SID_V1_FHI = (unsigned char)(nf >> 8);
        SID_V1_CTR = SID_NOISE | SID_GATE;
    }
}

static void engine_update(char step)
{
    unsigned f  = sid_freq[(unsigned char)step];
    unsigned nf = f << 1;
    SID_V0_FLO = (unsigned char)f;
    SID_V0_FHI = (unsigned char)(f >> 8);
    SID_V1_FLO = (unsigned char)nf;
    SID_V1_FHI = (unsigned char)(nf >> 8);
}

static void engine_stop(void)
{
    SID_V0_CTR = 0x00;
    SID_V1_CTR = 0x00;
    SID_VOL    = 0x00;
}

// ---------------------------------------------------------------
// Hottest animation variables in zero page for 1-cycle faster access
// ---------------------------------------------------------------
static __zeropage char zp_angle1;
static __zeropage char zp_angle2;
static __zeropage char zp_spd;
static __zeropage char zp_dirty;

// ---------------------------------------------------------------
// gears_run — XOR animation, no clear needed.
//
// Loop structure (tutorial 5000 / 5010 style):
//   1. vic_waitFrame() — sync to blanking
//   2. Update text band if dirty (safe: VIC past text rows)
//   3. XOR-erase gears at current angles
//   4. Advance angles
//   5. XOR-draw gears at new angles
//   6. TOD check for speed step (sets dirty flag)
// ---------------------------------------------------------------
void gears_run(void)
{
    zp_angle1 = 0;
    zp_angle2 = G2_PHASE;
    zp_spd    = 0;
    zp_dirty  = 1;

    hires_init();
    engine_init();
    turbo_slow();
    tod_reset();

    // Initial draw — no previous frame to erase
    clear_text_band();
    draw_speed(0);
    draw_message(0);
    draw_gear(G2_CX, G2_CY, zp_angle2,
              G2_N, G2_STEP, G2_BASE, G2_TIP, G2_HUB, G2_HW, G2_SPOKES);
    draw_gear(G1_CX, G1_CY, zp_angle1,
              G1_N, G1_STEP, G1_BASE, G1_TIP, G1_HUB, G1_HW, G1_SPOKES);
    zp_dirty = 0;

    while (zp_spd <= 15) {
        vic_waitFrame();

        // Text update during blanking (VIC already past text rows)
        if (zp_dirty) {
            clear_text_band();
            draw_speed(zp_spd);
            draw_message(zp_spd);
            zp_dirty = 0;
        }

        // XOR erase → SEI only for the angle-advance (3 cycles) → redraw.
        // SEI only blocks the ~3 CIA cycles of the arithmetic, not the draws.
        // This prevents erase/redraw XOR mismatch without blocking the timer.
        draw_gear(G2_CX, G2_CY, zp_angle2,
                  G2_N, G2_STEP, G2_BASE, G2_TIP, G2_HUB, G2_HW, G2_SPOKES);
        draw_gear(G1_CX, G1_CY, zp_angle1,
                  G1_N, G1_STEP, G1_BASE, G1_TIP, G1_HUB, G1_HW, G1_SPOKES);
        __asm { sei }
        zp_angle1 = (char)(zp_angle1 + 1) & 63;
        zp_angle2 = (char)(zp_angle2 - 2) & 63;
        __asm { cli }
        draw_gear(G2_CX, G2_CY, zp_angle2,
                  G2_N, G2_STEP, G2_BASE, G2_TIP, G2_HUB, G2_HW, G2_SPOKES);
        draw_gear(G1_CX, G1_CY, zp_angle1,
                  G1_N, G1_STEP, G1_BASE, G1_TIP, G1_HUB, G1_HW, G1_SPOKES);

        if (cia1.tods >= 1) {
            tod_reset();
            if (zp_spd < 15) {
                zp_spd++;
                turbo_set((char)zp_spd);   // badlines ON
                engine_update(zp_spd);
                zp_dirty = 1;
            } else {
                zp_spd = 16;
            }
        }
    }

    // Hold at 64 MHz for 5 real seconds — badlines OFF for clean animation.
    turbo_fast();
    zp_spd = 15;
    tod_reset();
    while (cia1.tods < 5) {
        vic_waitFrame();
        draw_gear(G2_CX, G2_CY, zp_angle2,
                  G2_N, G2_STEP, G2_BASE, G2_TIP, G2_HUB, G2_HW, G2_SPOKES);
        draw_gear(G1_CX, G1_CY, zp_angle1,
                  G1_N, G1_STEP, G1_BASE, G1_TIP, G1_HUB, G1_HW, G1_SPOKES);
        __asm { sei }
        zp_angle1 = (char)(zp_angle1 + 1) & 63;
        zp_angle2 = (char)(zp_angle2 - 2) & 63;
        __asm { cli }
        draw_gear(G2_CX, G2_CY, zp_angle2,
                  G2_N, G2_STEP, G2_BASE, G2_TIP, G2_HUB, G2_HW, G2_SPOKES);
        draw_gear(G1_CX, G1_CY, zp_angle1,
                  G1_N, G1_STEP, G1_BASE, G1_TIP, G1_HUB, G1_HW, G1_SPOKES);
    }

    engine_stop();

    // Leave hires mode active — mandel_run()'s mc_init() takes over directly.
}
