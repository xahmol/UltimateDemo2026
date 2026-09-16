// UltimateDemo2026 — Palette Morph: idi8b logo, true 1-scanline raster ink
//
// Colour RAM is only fetched once per character ROW by the VIC (all 8
// scanlines of a row share one colour) -- that's a real hardware limit,
// not a software choice, so colouring actual text-mode "ink" one scanline
// at a time needs a different trick than just writing colour RAM faster.
//
// Real C64 hardware fact (there is NO special "swap ink/background
// source" hardware behaviour for reversed characters -- confirmed against
// c64_reference.md): screen codes $80-$FF are literally PRE-INVERTED
// bitmap data in the character ROM. The colour rule is identical for
// every code: bit=1 -> COLOUR RAM (ink), bit=0 -> $D021 (background).
// Reversing a code just flips which physical pixels are 1 vs 0; it never
// changes which register drives which role.
//
// So to make a cell's INK track $D021 instead of colour RAM, what you
// need is for that cell's *ink* pixels to end up as bit=0 in the stored
// glyph data. For a normal (non-reversed) source cell, ink = bit=1, so
// inverting the code (set bit 7) flips ink to bit=0 -- correct. But for a
// cell that was ALREADY reversed in the source art (e.g. a reversed-space
// solid-fill block -- a common PETSCII technique: reversed space has an
// all-1s glyph, so the WHOLE cell shows as solid colour-RAM ink), the
// "ink" pixels are already bit=1 in that code's *own* stored data; forcing
// bit 7 SET again is a no-op and leaves ink on colour RAM. The fix is to
// TOGGLE bit 7 relative to each cell's own original state (XOR $80), not
// force it on -- that inverts every cell's own glyph exactly once,
// converting its own ink pixels to bit=0 regardless of whether the source
// cell started out reversed or not. Confirmed bug, hardware-reported:
// forcing bit 7 SET left reversed-source fill cells still colour-RAM-
// driven (fixed black), which read as "areas that should be filled are
// empty" -- exactly what toggling instead of forcing fixes.
//
// Colour RAM is then set to solid black everywhere (logo cells and true
// background alike -- fixed, never touched again) and $D021 is swept per
// scanline. The logo's true ink lights up with the sweeping colour;
// everywhere else stays black via colour RAM, unaffected by what $D021 is
// doing. Only needs to cover the logo's own row-span (96 lines), not the
// whole screen, since non-logo cells never reference $D021 at all.

#include <c64/vic.h>
#include <c64/cia.h>
#include <c64/memmap.h>
#include <string.h>
#include "defines.h"
#include "turbo.h"
#include "ultimate_common_lib.h"
#include "palette_morph.h"
#include "logo_data.h"

#define PM_LINE_START   51   // first visible content line (approx, PAL)

#define LOGO_TOP_ROW     6   // (25-LOGO_H)/2, centred vertically
#define LOGO_LEFT_COL    6   // (40-LOGO_W)/2, centred horizontally

#define PM_LOGO_LINE_START (PM_LINE_START + LOGO_TOP_ROW * 8)
#define PM_LOGO_LINE_COUNT (LOGO_H * 8)

#define PM_TEST_FRAMES     1000   // ~20s @ 50Hz PAL
#define PM_PALETTE_INTERVAL   2   // frames between UCI palette updates --
                                   // confirmed smooth on real hardware
#define PM_HUE_STEP            1  // hue advance per palette update

// ---------------------------------------------------------------
// Fast integer hue (0-255) -> RGB at full saturation/value.
// Six 43-unit linear segments around the colour wheel; no floats/trig.
// ---------------------------------------------------------------
static void hue_to_rgb(unsigned char hue, char *r, char *g, char *b)
{
    unsigned char region = (unsigned char)(hue / 43);
    unsigned char t       = (unsigned char)((hue % 43) * 6);
    unsigned char q       = (unsigned char)(255 - t);

    switch (region) {
        case 0:  *r = (char)255; *g = (char)t;   *b = 0;         break;
        case 1:  *r = (char)q;   *g = (char)255; *b = 0;         break;
        case 2:  *r = 0;         *g = (char)255; *b = (char)t;   break;
        case 3:  *r = 0;         *g = (char)q;   *b = (char)255; break;
        case 4:  *r = (char)t;   *g = 0;         *b = (char)255; break;
        default: *r = (char)255; *g = 0;         *b = (char)q;   break;
    }
}

static void pm_draw_logo(void)
{
    unsigned char y, x;
    for (y = 0; y < LOGO_H; y++) {
        char *dst = (char *)0x0400 + (LOGO_TOP_ROW + y) * 40 + LOGO_LEFT_COL;
        const unsigned char *src = logo_data + (unsigned int)y * LOGO_W;
        for (x = 0; x < LOGO_W; x++)
            // TOGGLE bit 7 (XOR $80), not force it on -- see file header.
            // Inverts each cell's own glyph exactly once relative to its
            // own original reversed/non-reversed state, so whatever was
            // "ink" in the source art (colour-RAM-driven) ends up as
            // bit=0 (i.e. $D021-driven) regardless of which state the
            // source cell started in.
            dst[x] = (char)(src[x] ^ 0x80);
    }
}

static void pm_init(void)
{
    mmap_set(MMAP_NO_BASIC);
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
    memset((char *)0x0400, SC_REVSPACE, 1000);   // reversed space
                                                  // everywhere -- true
                                                  // background, colour-RAM
                                                  // driven (see below)
    memset((char *)0xD800, 0, 1000);             // colour RAM: solid black
                                                  // everywhere, logo cells
                                                  // included, and never
                                                  // touched again below
    pm_draw_logo();

    vic.color_border = 0;
    vic.color_back   = 0;   // starting value; swept per-scanline below,
                             // but only ever affects the logo's own "ink"
                             // pixels -- see file header. Index 0 is never
                             // touched by the hue rotation.

    // Mask off CIA1/CIA2 interrupt sources -- without this, the standard
    // CIA1 Timer A interrupt (KERNAL jiffy-clock/keyboard-scan) firing
    // mid-sweep caused real, confirmed-on-hardware timing bugs in an
    // earlier version of this effect. $7F = bit7 clear (means "disable"),
    // bits 0-4 set (all sources).
    cia1.icr = 0x7f;
    cia2.icr = 0x7f;
}

static void pm_done(void)
{
    uii_resetpalette();
    mmap_set(MMAP_NO_BASIC);
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
    memset((char *)0x0400, SC_SPACE, 1000);
    memset((char *)0xD800, VCOL_LT_GREY, 1000);
    vic.color_border = 0;
    vic.color_back   = 0;

    // Restore the standard CIA1 Timer A interrupt (KERNAL jiffy-clock/
    // keyboard-scan) -- matches main.c's own init sequence elsewhere in
    // this project ("cia1.icr = 0x81; // re-enable Timer A interrupt").
    cia1.icr = 0x81;
}

void palette_morph_run(void)
{
    unsigned int  frame;
    unsigned char hue    = 0;
    unsigned char scroll = 0;

    turbo_fast();
    pm_init();

    for (frame = 0; frame < PM_TEST_FRAMES; frame++) {
        unsigned int  line;
        unsigned char idx = scroll;

        // One real pass down the logo's scanlines only (96 lines, not the
        // full screen) -- one $D021 write per line, same proven technique
        // as the plain background-bars version.
        for (line = 0; line < PM_LOGO_LINE_COUNT; line++) {
            vic_waitLine((int)(PM_LOGO_LINE_START + line));
            vic.color_back = idx;
            idx = (unsigned char)((idx + 1) & 15);   // &15, not %16 -- see
                // this project's earlier oscar64 mul/div compiler-crash
                // note; also just cheaper for a power of 2.
        }
        scroll = (unsigned char)((scroll + 1) & 15);   // rotate the
            // starting index each frame -- makes the fixed repeating
            // 16-colour band pattern appear to scroll down through the
            // logo's ink.

        // UCI call happens here, once the logo's scanlines are done and
        // the beam is past them -- not interleaved mid-sweep, since the
        // UCI round-trip costs real milliseconds that would otherwise
        // desync the sweep for that frame.
        if ((frame % PM_PALETTE_INTERVAL) == 0) {
            char rgb[48];
            unsigned char i;

            // Index 0 stays pure black always (background/border).
            rgb[0] = 0; rgb[1] = 0; rgb[2] = 0;

            // A NARROW slice of the wheel (15*5=75 of 256), not the whole
            // thing -- confirmed on hardware that spreading evenly across
            // the full 256 hues made the rotation nearly invisible (a
            // rotated full rainbow still looks like a full rainbow). A
            // coherent slice that slides through the wheel makes the
            // cycling actually visible.
            for (i = 1; i < 16; i++) {
                unsigned char h = (unsigned char)(hue + (i - 1) * 5);
                hue_to_rgb(h, &rgb[i * 3], &rgb[i * 3 + 1], &rgb[i * 3 + 2]);
            }
            uii_setpalette(rgb);
            hue = (unsigned char)(hue + PM_HUE_STEP);
        }
    }

    pm_done();
}
