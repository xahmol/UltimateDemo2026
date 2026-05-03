// UltimateDemo2026
// Hardware detection and startup for the Ultimate 64
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

#ifndef VERSION
#define VERSION "v0.1.0-dev"
#endif

char linebuffer[81];

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
            if (c >= 'a' && c <= 'z')
                c = (unsigned char)(c - 32 + 0x20);
            dst[(unsigned char)j++] = (char)c;
        }
    }
    dst[(unsigned char)j] = 0;
    return j;
}

// ---------------------------------------------------------------
// int main
// ---------------------------------------------------------------
int main(void)
{
    char detail[26];

    // Subtitle: uppercase abbreviation + version via string concat.
    // With petscii.h the charmap remaps; mixed-case source shows
    // correctly (H → uppercase, w → lowercase, etc.)
    screen_init("Hardware Detection   " VERSION);

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
        screen_error_exit(
            "Turbo mode required - CPU at 1 MHz.",
            "Enable turbo in Ultimate firmware");
        return 1;
    }

    if (detected_turbo_class == TURBO_64MHZ)
        strcpy(detail, "64 MHz");
    else if (detected_turbo_class == TURBO_48MHZ)
    {
        // Read the actual speed index from $D031 for a more precise label
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

    // ---- Audio -------------------------------------------------
    screen_info("Checking Ultimate Audio...");

    if (!detect_audio())
    {
        screen_result("Audio", 0, "Module not found");
        screen_error_exit(
            "Ultimate Audio module not detected.",
            "F2 > C64/Cart settings > Audio");
        return 1;
    }

    {
        char vbuf[4];
        fmt_dec(vbuf, detected_audio_version);
        strcpy(detail, "v");
        strcat(detail, vbuf);
    }
    screen_result("Audio", 1, detail);

    // ---- All checks passed -------------------------------------
    screen_blank_line();
    screen_info("All hardware detected successfully!");
    screen_blank_line();

    cwin_put_string(&cw, "  System summary:", COL_LABEL);
    cwin_cursor_newline(&cw);

    cwin_put_string(&cw, "    REU   : 16 MB SDRAM", COL_DETAIL_OK);
    cwin_cursor_newline(&cw);

    cwin_put_string(&cw,
                    detected_turbo_class == TURBO_64MHZ
                        ? "    Turbo : 64 MHz"
                        : "    Turbo : 48 MHz",
                    COL_DETAIL_OK);
    cwin_cursor_newline(&cw);

    {
        char vbuf[4];
        fmt_dec(vbuf, detected_audio_version);
        cwin_put_string(&cw, "    Audio : module version ", COL_DETAIL_OK);
        cwin_put_string(&cw, vbuf, COL_DETAIL_OK);
        cwin_cursor_newline(&cw);
    }

    screen_blank_line();
    screen_wait_key("Hardware ready.");

    return 0;
}
