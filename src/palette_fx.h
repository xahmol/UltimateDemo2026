// UltimateDemo2026 — reusable palette-driven scene-transition effects
// (firmware 3.15+ UCI palette control). See palette_fx.c for details.

#pragma compile("palette_fx.c")

// Fades the VIC's currently active 16-index palette down to solid black
// over `steps` UCI updates (one per frame), for use as a section-end
// transition. Captures the live palette via uii_getpalette() first, so it
// works regardless of whether the calling scene left a custom or the
// stock palette active -- callers don't need to know their own colours.
// No-op if detected_palette_support is false (checked internally).
void palette_fade_out(unsigned char steps);

void palette_hue_sweep(unsigned char frame, unsigned char interval_mask,
                        unsigned char index, unsigned char *hue,
                        unsigned char step);
// Shared single-index periodic hue sweep -- advances *hue by `step` and
// pushes it to colour-RAM `index` via uii_setpalettecolor(), but only on
// frames where (frame & interval_mask) == 0 (e.g. interval_mask=7 means
// "every 8th frame"). No-op if detected_palette_support is false (checked
// internally). One shared function instead of a near-identical copy in
// every scene that just wants "one colour, slowly cycling hue" (ball.c,
// vectors.c, ...) -- keeps the $0A00-$C000 code budget from growing by a
// near-duplicate function (and its own static stack frame) per scene.

void hue_shade_to_rgb(unsigned char hue, unsigned char brightness,
                       char *r, char *g, char *b);
// Like hue_to_rgb(), but scales the result by `brightness` (0-255) --
// same hue at every brightness level, so a set of calls with one fixed
// hue and varying brightness gives a genuine light-to-dark GRADIENT of a
// single colour rather than a hue sweep. Used for any scene wanting
// several visible shades of one hue at once (e.g. tunnel.c's per-row
// gradient, scroller.c's blue-shades plasma).

void hue_to_rgb(unsigned char hue, char *r, char *g, char *b);
// Fast integer hue (0-255) -> RGB at full saturation/value (six 43-unit
// linear segments around the colour wheel, no floats/trig) -- deliberately
// always full brightness so a hue sweep never dims toward black. Shared
// by every scene that does its own periodic uii_setpalettecolor()/
// uii_setpalette() hue sweep (does NOT check detected_palette_support --
// callers gate their own UCI calls, this is a pure colour-space helper).
