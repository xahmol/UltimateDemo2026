// UltimateDemo2026 — standalone Scroller test harness
//
// DEV TOOL, NOT part of the shipped demo. Calls scroller_run() directly,
// skipping hardware detection and every other scene, so each edit-build-
// test cycle takes seconds. Build with `make scrtest`. Not included in
// the release ZIP.
//
// scroller.c pulls in detect.c (via detect.h) transitively, which already
// defines detected_palette_support (left at its default 0 here -- no UCI
// unlock done in this harness -- so scr_done()'s uii_resetpalette() call
// is correctly skipped). Fine for this harness, which only exists to check
// the scroller's own rendering (currently: the 38-column-mode fix).

#pragma region(main, 0x0A00, 0xC000, , , {code, data, bss, heap, stack})
#pragma heapsize(256)

#include "scroller.h"

__hwinterrupt void nmi_handler(void) {}

int main(void)
{
    *((void **)0x0318) = nmi_handler;           // ignore RESTORE key

    scroller_run();

    return 0;
}
