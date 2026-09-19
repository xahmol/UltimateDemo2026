// UltimateDemo2026 — reusable palette-driven scene-transition effects
//
// A generic "fade to black via UCI" transition, usable at the end of ANY
// scene regardless of what palette (stock or custom) it left active --
// it reads the live palette back with uii_getpalette() rather than
// assuming a starting point, so it composes cleanly with every section.

#include <c64/vic.h>
#include <string.h>
#include "ultimate_common_lib.h"
#include "palette_fx.h"

// Declared directly (not via #include "detect.h") so this file doesn't
// pull detect.c -- and its own audio.c dependency -- into builds that
// don't otherwise need the full detection module (e.g. src/test_palette.c,
// which defines this extern itself). detect.c defines the real one for
// the main demo.
extern char detected_palette_support;

void palette_fade_out(unsigned char steps)
{
    // static, not stack locals: this function is never reentrant (never
    // called recursively or from an interrupt), and 8 scenes now call it
    // from 8 different, mutually-exclusive points in the overall control
    // flow -- as ordinary stack locals, oscar64's static per-function
    // frame allocation couldn't prove all 8 call sites' frames were safe
    // to overlap, which alone was enough extra reserved space to blow the
    // $0A00-$C000 budget ("cannot place stack/heap section"). As static
    // storage this is one fixed 96-byte BSS reservation regardless of how
    // many places call it.
    static char start[48];
    static char cur[48];
    unsigned char step, i;

    if (!detected_palette_support || steps == 0) return;

    uii_getpalette();
    memcpy(start, uii_data, 48);

    for (step = 1; step <= steps; step++) {
        vic_waitFrame();
        for (i = 0; i < 48; i++) {
            unsigned int level = (unsigned char)start[i];
            level = (level * (steps - step)) / steps;
            cur[i] = (char)level;
        }
        uii_setpalette(cur);
    }
}

void palette_hue_sweep(unsigned char frame, unsigned char interval_mask,
                        unsigned char index, unsigned char *hue,
                        unsigned char step)
{
    if (!detected_palette_support || (frame & interval_mask) != 0) return;
    {
        char r, g, b;
        hue_to_rgb(*hue, &r, &g, &b);
        uii_setpalettecolor(index, r, g, b);
    }
    *hue = (unsigned char)(*hue + step);
}

void hue_shade_to_rgb(unsigned char hue, unsigned char brightness,
                       char *r, char *g, char *b)
{
    char hr, hg, hb;
    hue_to_rgb(hue, &hr, &hg, &hb);
    *r = (char)(((unsigned int)(unsigned char)hr * brightness) / 255);
    *g = (char)(((unsigned int)(unsigned char)hg * brightness) / 255);
    *b = (char)(((unsigned int)(unsigned char)hb * brightness) / 255);
}

void hue_to_rgb(unsigned char hue, char *r, char *g, char *b)
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
