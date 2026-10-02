// UltimateDemo2026 — hardware detection

#include <c64/cia.h>
#include <c64/reu.h>
#include <petscii.h>
#include <string.h>
#include "defines.h"
#include "detect.h"
#include "ultimate_audio_lib.h"
#include "ultimate_turbo_lib.h"
#include "ultimate_common_lib.h"

#pragma code(code)
#pragma data(data)

// ---------------------------------------------------------------
// Exported results
// ---------------------------------------------------------------
unsigned char detected_reu_mb        = 0;
char          detected_turbo_class   = TURBO_NOT_PRESENT;
unsigned char detected_audio_version = 0;
char          detected_palette_support = DETECT_FAIL;

// ---------------------------------------------------------------
// detect_uci
// ---------------------------------------------------------------
char detect_uci(void) {
    // uii_wait_for_uci() sends the firmware 3.15+ unlock (only when the UCI
    // isn't mapped yet -- unlocking a mapped interface caused a start-up
    // hang, see the UCI library manual, section 5), then polls uii_detect()
    // for up to 10 seconds while the Ultimate firmware finishes booting.
    return uii_wait_for_uci(10) ? DETECT_OK : DETECT_FAIL;
}

// ---------------------------------------------------------------
// detect_reu
// Uses Oscar64's reu_count_pages() which returns the number of
// 64 KB pages (256 = 16 MB, 128 = 8 MB, etc.).
// The test is non-destructive enough for startup detection.
// ---------------------------------------------------------------
unsigned char detect_reu(void) {
    int pages = reu_count_pages();

    if (pages == 0) {
        detected_reu_mb = 0;
        return 0;
    }

    // 256 pages × 64 KB = 16 MB
    detected_reu_mb = (pages >= 256) ? 16 : (unsigned char)((unsigned)pages / 16);
    return detected_reu_mb;
}

// ---------------------------------------------------------------
// detect_turbo
// ---------------------------------------------------------------
char detect_turbo(void) {
    // Raster-timed probe (issue #4): confirms turbo really runs and tells
    // 48 from 64 MHz; handles the forced 1 MHz window after a reset.
    detected_turbo_class = uii_turbo_probe_max();
    uii_turbo_slow();      // leave detection at 1 MHz, as before
    return (detected_turbo_class != TURBO_MAX_UNKNOWN) ? DETECT_OK : DETECT_FAIL;
}

// ---------------------------------------------------------------
// detect_audio
// ---------------------------------------------------------------
char detect_audio(void) {
    if (uii_audio_detect()) {
        detected_audio_version = uii_audio_get_version();
        return DETECT_OK;
    }
    detected_audio_version = 0;
    return DETECT_FAIL;
}

// ---------------------------------------------------------------
// detect_palette
// Read-only capability probe: uii_getpalette() never modifies state,
// so no uii_resetpalette() call is needed here.
// ---------------------------------------------------------------
char detect_palette(void) {
    uii_getpalette();
    detected_palette_support = UII_SUCCESS ? DETECT_OK : DETECT_FAIL;
    return detected_palette_support;
}
