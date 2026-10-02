// UltimateDemo2026 — standalone Palette Morph test harness
//
// DEV TOOL, NOT part of the shipped demo. Skips hardware detection, gears,
// and the rest of the demo sequence entirely -- just enables UCI and runs
// palette_morph_run() at 64MHz turbo, so each edit-build-test cycle takes
// seconds instead of sitting through the full detection screen + gears
// speed-ramp every time. Build with `make paltest`, deploy with
// `make paltest-deploy`. Not included in the release ZIP.

#pragma region(main, 0x0A00, 0xC000, , , {code, data, bss, heap, stack})
#pragma heapsize(256)

#include <c64/vic.h>
#include <c64/cia.h>
#include "defines.h"
#include "ultimate_common_lib.h"
#include "ultimate_turbo_lib.h"
#include "screen.h"       // pulls in screen.c so the shared `cw` CharWin
                           // (used by palette_morph_run()'s on-screen
                           // labels) has somewhere to actually live --
                           // its functions aren't called here otherwise.
#include "palette_morph.h"

// palette_fx.c (pulled in via palette_morph.c) reads this extern from
// detect.h/detect.c -- defined directly here instead of #include-ing
// detect.h, since that header's own #pragma compile("detect.c") would
// drag detect.c (and its ultimate_audio_lib.c dependency) into this deliberately
// minimal harness. This standalone tool already knows UCI is up by
// construction (see the uii_detect() poll below), so it just sets the
// flag directly rather than running the full detect_palette() probe.
char detected_palette_support = 0;

__hwinterrupt void nmi_handler(void) {}

int main(void)
{
    *((volatile unsigned char *)0x01) = 0x36;   // MMAP_NO_BASIC
    *((void **)0x0318) = nmi_handler;           // ignore RESTORE key

    // UCI unlock + wait, as in detect_uci() -- no need for the full
    // detection screen here, just enough to know UCI is up before
    // palette_morph_run() starts issuing UCI commands.
    if (uii_wait_for_uci(10)) {
        detected_palette_support = 1;
        uii_turbo_fast();
        palette_morph_run();
        uii_turbo_slow();
    }

    vic.color_border = VCOL_LT_BLUE;
    vic.color_back   = VCOL_BLUE;
    return 0;
}
