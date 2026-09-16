#ifndef PALETTE_MORPH_H
#define PALETTE_MORPH_H

void palette_morph_run(void);
// Firmware 3.15+ only. Caller must check detected_palette_support (from
// detect.h) before calling -- this function does not self-check, so it
// must be skipped entirely on firmware without the palette UCI commands.
// Always resets the palette to stock before returning (see palette_morph.c).

#pragma compile("palette_morph.c")

#endif
