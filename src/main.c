// UltimateDemo2026
// Hardware detection and startup for the Ultimate 64
// Use MMAP_NO_BASIC ($36) throughout: KERNAL+I/O visible, $A000-$BFFF always RAM.
// Region extends to $C000 so code+data+bss+stack fit safely below the MC screen at $C000.
#pragma region(main, 0x0A00, 0xC000, , , {code, data, bss, heap, stack})
#pragma heapsize(256)
// Written in 2026 by Xander Mol
//
// petscii.h is required: with the lowercase+uppercase charset and
// petscii.h's charmap, source uppercase → uppercase display and
// source lowercase → lowercase display.  Write strings in normal
// English case; the compiler remaps them to the correct PETSCII
// bytes for on-screen display.

#include <c64/charwin.h>
#include <c64/vic.h>
#include <c64/cia.h>
#include <petscii.h>
#include <stdio.h>
#include <string.h>
#include "defines.h"
#include "ultimate_common_lib.h"
#include "ultimate_dos_lib.h"
#include "screen.h"
#include "detect.h"
#include "turbo.h"
#include "modplay.h"
#include "gears.h"
#include "mandel.h"
#include "plasma.h"
#include "vectors.h"
#include "ball.h"
#include "tunnel.h"
#include "flower.h"
#include "scroller.h"

// MOD file location on U64 filesystem.
// petscii.h remaps source letters, so we temporarily apply the identity
// charmap to get raw-ASCII byte values in these path strings.
#pragma charmap(97, 97, 26)   // a-z → a-z (identity, overrides petscii.h)
#pragma charmap(65, 65, 26)   // A-Z → A-Z (identity)
static char mod_file[]   = "4ev.mod";
static char demo_path[]  = "idi8b/ultdemo2026/";
#pragma charmap(97, 65, 26)   // restore petscii.h: a-z → A-Z
#pragma charmap(65, 97, 26)   // restore petscii.h: A-Z → a-z
#define MOD_REU  0x000000UL

#ifndef VERSION
#define VERSION "v0.1.0-dev"
#endif

// ---------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------

static void fmt_dec(char *buf, unsigned char val)
{
    char i = 0;
    if (val >= 100)
    {
        buf[i++] = (char)('0' + val / 100);
        val %= 100;
    }
    buf[i++] = (char)('0' + val / 10);
    buf[i++] = (char)('0' + val % 10);
    buf[i] = 0;
}

// Copy UCI response string, uppercasing and filtering to printable ASCII.
// petscii.h remaps source letters, so UCI data (raw ASCII) must be
// converted explicitly to PETSCII uppercase for correct display.
static char uci_to_upper(char *dst, char maxlen)
{
    char i, j = 0;
    for (i = 0; i < 127 && j < maxlen; i++)
    {
        unsigned char c = (unsigned char)uii_data[(unsigned char)i];
        if (c == 0)
            break;
        if (c >= 32 && c <= 126)
        { // printable ASCII
            // Force uppercase: in raw PETSCII, 0x61-0x7A are uppercase A-Z
            // (without petscii.h remapping), so map ASCII a-z to that range
            if (c >= 0x61 && c <= 0x7A)   // raw hex: immune to petscii.h charmap
                c = (unsigned char)(c - 0x20);
            dst[(unsigned char)j++] = (char)c;
        }
    }
    dst[(unsigned char)j] = 0;
    return j;
}

// ---------------------------------------------------------------
// NMI handler — prevents RESTORE key from resetting the demo.
// ---------------------------------------------------------------
__hwinterrupt void nmi_handler(void) {}

// ---------------------------------------------------------------
// int main
// ---------------------------------------------------------------
int main(void)
{
    // MMAP_NO_BASIC ($36): KERNAL + I/O visible, BASIC ROM removed.
    // $A000-$BFFF is always CPU-accessible RAM (no BASIC ROM shadow).
    // A previous crash may have left $01=$34 (MMAP_RAM), breaking I/O.
    *((volatile unsigned char *)0x01) = 0x36;

    // Install NMI handler so RESTORE key is ignored during demo
    *((void **)0x0318) = nmi_handler;

    // Patch UDTIM vector ($0310) to RTS so the KERNAL IRQ chain's JSR $0310
    // returns safely. Without BASIC ROM, $0310 holds JMP $B248 where $B248
    // is Oscar64 RAM whose contents change with every build; the KERNAL
    // keyboard-scan path ($EA31 → $FFEA → JSR $0310 → JMP $B248) hits
    // whatever bytes happen to be there — often an illegal opcode → crash.
    *((unsigned char *)0x0310) = 0x60;  // RTS

    // Patch CBINV vector ($A002-$A003) to point to our RTS stub at $0310.
    // KERNAL UDTIM unconditionally calls JMP ($A002) on every IRQ tick.
    // With MMAP_NO_BASIC ($01=$36), $A002 is DRAM; the U64 pre-initialises
    // DRAM at $A000-$BFFF with BASIC ROM content, so $A002/$A003 = $E37B
    // (KERNAL CBINV handler).  That handler calls JSR $A67A (BASIC ROM in
    // DRAM), which hard-resets SP to $FA and executes CLI — corrupting the
    // 6502 hardware stack and re-enabling IRQs mid-IRQ.  Redirect to $0310
    // (already RTS) so JMP ($A002) returns harmlessly via the RTS stub.
    *((unsigned char *)0xA002) = 0x10;  // lo byte of $0310
    *((unsigned char *)0xA003) = 0x03;  // hi byte of $0310

    // Reset CIA1 Timer A to 50 Hz PAL keyboard scan rate.
    // A previous run that crashed while modplay was active leaves Timer A
    // running at the MOD BPM rate, which breaks cwin_getch.
    cia1.icr = 0x7F;       // mask all CIA1 interrupts
    cia1.ta  = 0x4D25;     // 19749 counts ≈ 985248 Hz / 50 Hz (PAL)
    cia1.icr = 0x81;       // re-enable Timer A interrupt
    cia1.cra = 0x01;       // start Timer A, continuous

    char detail[26];
    char mod_ok = 0;   // 1 = MOD loaded and ready to play

    // Subtitle: uppercase abbreviation + version via string concat.
    // With petscii.h the charmap remaps; mixed-case source shows
    // correctly (H → uppercase, w → lowercase, etc.)
    screen_init("Hardware Detection  " VERSION);

    // ---- UCI ---------------------------------------------------
    screen_info("Waiting for Ultimate firmware...");

    if (!detect_uci())
    {
        screen_result("UCI  ", 0, "Not detected");
        screen_error_exit(
            "No Ultimate Command Interface found.",
            "F2 > UCI Settings > Enable");
        return 1;
    }

    // DOS version string via uii_identify()
    uii_identify();
    if (UII_SUCCESS && uii_data[0])
        uci_to_upper(detail, 24);
    else
        strcpy(detail, "UCI Ok");
    screen_result("UCI  ", 1, detail);

    // Hardware device name via uii_get_hwinfo(0).
    // Label "Dev. " is 5 chars — aligns colon with UCI/REU/Turbo/Audio.
    uii_get_hwinfo(0);
    if (UII_SUCCESS && uci_to_upper(detail, 24) > 0)
    {
        cwin_put_string(&cw, "  Type  : ", COL_LABEL);
        cwin_put_string(&cw, detail, COL_DETAIL_OK);
        cwin_cursor_newline(&cw);
    }

    // ---- REU ---------------------------------------------------
    screen_info("Checking REU...");

    {
        unsigned char reu_mb = detect_reu();
        if (reu_mb < 16)
        {
            screen_result("REU  ", 0,
                          reu_mb == 0 ? "Not detected" : "Too small (need 16 MB)");
            screen_error_exit(
                "16 MB REU is required.",
                "F2 > C64 settings > REU > 16 MB");
            return 1;
        }
    }
    screen_result("REU  ", 1, "16 MB");

    // ---- Turbo -------------------------------------------------
    screen_info("Checking turbo mode...");

    if (!detect_turbo())
    {
        screen_result("Turbo", 0, "Not detected (1 MHz)");
        screen_hint("Enable turbo in Ultimate firmware");
    }
    else
    {
        if (detected_turbo_class == TURBO_64MHZ)
            strcpy(detail, "64 MHz");
        else if (detected_turbo_class == TURBO_48MHZ)
        {
            unsigned char idx = (unsigned char)(turbo_get() & 0x0F);
            if (idx == 0x0E)
                strcpy(detail, "48 MHz");
            else if (idx == 0x0D)
                strcpy(detail, "40 MHz");
            else if (idx == 0x0C)
                strcpy(detail, "36 MHz");
            else if (idx == 0x0B)
                strcpy(detail, "32 MHz");
            else if (idx == 0x0A)
                strcpy(detail, "28 MHz");
            else if (idx == 0x09)
                strcpy(detail, "24 MHz");
            else if (idx == 0x08)
                strcpy(detail, "20 MHz");
            else if (idx == 0x07)
                strcpy(detail, "16 MHz");
            else if (idx == 0x06)
                strcpy(detail, "12 MHz");
            else if (idx == 0x05)
                strcpy(detail, "8 MHz");
            else
                strcpy(detail, "Turbo");
        }
        else
            strcpy(detail, "Turbo");
        screen_result("Turbo", 1, detail);
    }

    // ---- Audio -------------------------------------------------
    screen_info("Checking Ultimate Audio...");

    if (!detect_audio())
    {
        screen_result("Audio", 0, "Module not found");
        screen_hint("F2 > C64/Cart settings > Audio");
    }
    else
    {
        char vbuf[4];
        fmt_dec(vbuf, detected_audio_version);
        strcpy(detail, "v");
        strcat(detail, vbuf);
        screen_result("Audio", 1, detail);
    }

    // ---- MOD music ---------------------------------------------
    // Locate idi8b/ultdemo2026/ on any SD or USB drive, then load 4ev.mod.
    // Graceful fail: demo continues silently if path or file is missing.
    if (detected_audio_version > 0)
    {
        char media_drives[UII_MAX_DRIVES][UII_DRIVE_PATH_LEN];
        char media_count = 0;
        char mod_path[40];
        char music_found = 0;

        screen_info("Loading music...");

        // Fast path: try the U64 configured home directory first.
        // If the user has set home to idi8b/ultdemo2026/, this skips the full scan.
        uii_change_dir_home();
        if (modplay_load(mod_file, MOD_REU))
            music_found = 1;

        // Full scan fallback: search all SD and USB drives.
        if (!music_found)
        {
            uii_scan_media(media_drives, &media_count);
            if (uii_find_media_path(media_drives, media_count, demo_path, mod_path))
            {
                if (modplay_load(mod_file, MOD_REU))
                    music_found = 1;
            }
        }

        if (music_found)
        {
            if (modplay_init(MOD_REU))
            {
                modplay.loop_song = 1;
                modplay_set_stereo(1);
                modplay_set_master_volume(160);
                mod_ok = 1;
                screen_result("Music", 1, "4ev.mod");
            }
            else
                screen_result("Music", 0, "Bad MOD format");
        }
        else
        {
            screen_result("Music", 0, "Not found");
            screen_hint("Place demo in idi8b/ultdemo2026/");
        }
    }

    // ---- Detection complete ------------------------------------
    screen_blank_line();
    screen_info("Detection complete.");
    screen_blank_line();
    screen_wait_key("Press any key to start the demo.");

    gears_run();

    // Music starts after gears, plays through all remaining scenes.
    if (mod_ok) modplay_start();

    // All scenes from here run at 64 MHz; each calls turbo_fast() if needed.
    // gears_run() leaves hires mode active; mandel_run() switches to MC directly.
    mandel_run();

    // Ball + rotating wireframe (hires, 64 MHz)
    ball_run();

    // 3D wireframe vectors / rotating cube (hires, 64 MHz)
    vectors_run();

    // Plasma sine interference (MC, 64 MHz)
    plasma_run();

    // Texture-mapped tunnel (MC, 64 MHz) — climax scene
    // tunnel_run() calls turbo_fast() itself.
    tunnel_run();

    // Re-patch KERNAL UDTIM hook ($A002:$A003 → RTS stub at $0310).
    // tunnel_build_tex() fills tex_flat[1024] (BSS at $9DA0); offsets 610-611
    // land on $A002:$A003 and both compute to 0 from the brick texture formula,
    // erasing the patch set at startup. After tun_done() restores KERNAL ROM,
    // the next CIA1 IRQ fires JMP ($A002) → $0000 → crash to BASIC READY.
    *((unsigned char *)0xA002) = 0x10;  // lo byte of $0310 (RTS stub)
    *((unsigned char *)0xA003) = 0x03;  // hi byte of $0310

    // PETSCII polar rose — text mode cooldown after tunnel climax
    flower_run();

    scroller_run();

    if (mod_ok) modplay_stop();

    // Zero KERNAL keyboard buffer count ($C6) so the scroller exit key
    // doesn't bleed into screen_wait_key() on the end screen.
    *((volatile unsigned char *)0xC6) = 0;

    // ---- End screen — text mode at 1 MHz -----------------------
    turbo_slow();
    screen_init("End of Demo Sequence");

    screen_blank_line();
    screen_info("Demo sequence complete.");
    screen_blank_line();
    screen_result("Gear ", 1, "1 to 64 MHz, 16 steps");
    screen_result("Fract", 1, "Mandelbrot MC fractal");
    screen_result("Ball ", 1, "3D ball + grid");
    screen_result("Vect ", 1, "3D wireframe cube");
    screen_result("Plas ", 1, "Plasma interference");
    screen_result("Tunl ", 1, "3D texture tunnel");
    screen_result("Flow ", 1, "PETSCII polar rose");
    screen_result("Scrl ", 1, "PETSCII font scroller");
    if (mod_ok)
        screen_result("Music", 1, "4ev.mod: forever young");
    screen_blank_line();
    screen_info("Ultimate 64 at 64 MHz turbo:");
    screen_info("the fastest C64 compatible.");
    screen_blank_line();
    screen_wait_key(NULL);

    // Wait for exit key to be fully released before returning to BASIC.
    // screen_wait_key() exits on first keypress; the key may still be held.
    // BASIC's first CIA1 keyboard scan would see the held key and type it.
    // Grounding all rows (DC00=0) lets DC01 reflect any held key; spin until clear.
    do {
        *((volatile unsigned char *)0xDC00) = 0;
    } while (*((volatile unsigned char *)0xDC01) != (unsigned char)0xFF);
    *((volatile unsigned char *)0xDC00) = (unsigned char)0xFF;

    // Wipe keyboard buffer so any residual KERNAL scans before BASIC prompt don't inject chars.
    *((volatile unsigned char *)0xC6) = 0;

    // Restore standard C64 colors before returning to BASIC
    vic.color_border = VCOL_LT_BLUE;
    vic.color_back   = VCOL_BLUE;

    return 0;
}
