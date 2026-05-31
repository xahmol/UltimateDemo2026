// UltimateDemo2026 — Big-font PETSCII Sine Scroller + Plasma Background
//
// Font: Small Round PETSCII Font by Cupid (https://csdb.dk/release/?id=188169)
//   Source: petscii-cupid.petmate (2 screens, each 40×25)
//   screen_001 rows 0-4:   lowercase a-n (font_lc_an)
//   screen_001 rows 5-9:   lowercase o-z (font_lc_oz)
//   screen_001 rows 20-24: uppercase A-M (font_am)
//   screen_002 rows 0-4:   uppercase N-Z (font_nz)
//
// petscii.h charmap swaps source case:
//   source uppercase A-Z → PETSCII 0x61-0x7A (97-122) → index 0-25  → uppercase glyphs
//   source lowercase a-z → PETSCII 0x41-0x5A (65-90)  → index 26-51 → lowercase glyphs
//
// Background: 2-sine PETSCII plasma outside the scroll bar; 64 MHz.
// Scroll bar: black background with PETSCII 0x63/0x64 border lines (dark grey),
//   1 char clearance above and below the 5-char-high font.
// Scroll: pixel-fine horizontal via $D016 + column shift.
// Sine: ±4-row vertical wave per column as text scrolls.
// Charset: C64 uppercase+graphics at $1000.

#include <c64/vic.h>
#include <c64/cia.h>
#include <string.h>
#include <petscii.h>
#include "scroller.h"

#define SCR_BASE  ((unsigned char *)0x0400)
#define COL_BASE  ((unsigned char *)0xD800)
#define SCR_COLS  40
#define SCR_ROWS  25

// ---------------------------------------------------------------
// Font — lowercase a-n: screen_001 rows 0-4 (petscii-cupid.petmate)
// ---------------------------------------------------------------
static const unsigned char font_lc_an_ch[5][40] = {
  {32,32,32,72,32,32,32,32,32,32,32,71,32,32,32,85,70,32,32,32,72,32,32,87,32,32,84,32,32,71,32,32,32,32,32,32,32,32,32,32},
  {85,68,73,107,68,73,85,68,73,85,68,115,85,68,73,107,70,85,68,73,107,68,73,89,32,73,71,32,78,66,112,68,114,68,73,112,68,73,32,32},
  {85,68,115,93,32,72,71,32,32,71,32,72,107,70,75,71,32,71,32,72,71,32,72,72,32,72,107,60,32,93,71,32,71,32,72,71,32,72,32,32},
  {74,70,125,109,70,75,74,70,75,74,70,75,74,70,75,74,32,74,70,115,66,32,66,113,32,72,66,32,77,72,109,32,125,32,125,109,32,125,32,32},
  {32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,70,75,32,32,32,32,70,75,32,32,32,32,32,32,32,32,32,32,32,32,32,32}
};
static const unsigned char font_lc_an_co[5][40] = {
  {14,14,14,13,13,14,14,14,14,14,15,13,14,14,14,13,1,14,14,14,15,15,14,1,14,14,1,15,14,1,15,14,14,14,14,14,14,14,14,14},
  {15,13,1,15,13,1,15,13,1,13,1,1,15,13,1,13,1,15,13,1,13,1,1,1,15,13,13,13,1,13,15,13,1,15,1,15,13,1,14,14},
  {5,13,13,5,14,13,15,15,14,15,15,13,15,13,1,15,15,15,15,13,15,15,13,13,15,1,15,13,15,15,5,15,13,15,13,5,15,13,15,14},
  {5,5,15,5,5,15,5,15,13,5,5,15,5,5,15,5,15,5,5,15,5,15,15,15,15,13,5,5,5,5,5,15,15,15,15,5,15,15,15,14},
  {14,14,14,14,14,14,14,14,14,14,14,15,15,14,14,15,15,15,5,15,15,15,15,15,5,15,15,15,15,15,15,15,14,14,14,14,14,14,14,14}
};

// ---------------------------------------------------------------
// Font — lowercase o-z: screen_001 rows 5-9 (petscii-cupid.petmate)
// ---------------------------------------------------------------
static const unsigned char font_lc_oz_ch[5][40] = {
  {32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,72,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32},
  {85,68,73,85,68,73,85,68,73,85,68,73,85,68,73,107,68,32,85,32,73,84,89,85,32,85,32,73,77,32,47,85,32,73,112,68,110,32,32,32},
  {71,32,72,71,32,72,71,32,72,71,32,32,74,68,73,71,32,72,71,32,72,71,72,71,32,71,32,72,32,86,32,71,32,72,85,68,75,32,32,32},
  {74,70,75,107,70,75,74,70,115,113,32,32,74,70,75,74,70,75,74,70,75,74,75,74,70,113,70,75,47,32,77,74,70,115,109,70,67,32,32,32},
  {32,32,32,72,32,32,32,32,71,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,70,75,32,32,32,32,32,32}
};
static const unsigned char font_lc_oz_co[5][40] = {
  {14,14,14,15,15,14,14,14,14,14,14,14,14,15,14,1,14,14,15,15,15,14,15,15,15,15,14,14,15,15,15,15,15,15,15,14,14,14,14,14},
  {15,13,1,15,13,1,15,13,1,13,1,13,13,1,13,13,1,15,13,15,1,13,1,13,15,1,15,1,1,15,1,13,15,1,15,13,1,14,14,14},
  {5,15,13,15,15,13,15,15,13,15,15,15,13,15,15,15,15,13,15,15,1,15,13,15,15,13,15,13,15,13,15,15,15,1,15,15,13,14,14,14},
  {5,5,15,5,15,15,5,5,15,5,15,15,5,5,15,5,5,15,5,15,13,5,15,5,5,15,5,15,5,15,15,5,15,13,5,5,15,15,14,14},
  {14,15,15,5,14,15,15,14,5,14,15,14,14,14,14,14,14,14,15,15,15,15,14,14,14,14,14,14,14,14,14,14,5,15,14,14,14,14,14,14}
};

// ---------------------------------------------------------------
// Font — uppercase A-M: screen_001 rows 20-24 (petscii-cupid.petmate)
// ---------------------------------------------------------------
static const unsigned char font_am_ch[5][40] = {
  {85,68,73,112,68,73,85,68,73,112,68,73,85,68,110,85,68,110,85,68,73,114,32,114,32,114,32,32,32,110,114,32,47,114,32,32,85,114,73,32},
  {107,70,115,107,70,115,71,32,32,72,32,72,107,68,32,107,68,32,71,68,110,107,68,115,32,93,32,112,32,72,107,60,32,93,32,32,71,72,72,32},
  {71,32,72,71,32,72,71,32,32,72,32,72,71,32,32,71,32,32,71,32,72,72,32,71,32,72,32,71,32,72,72,32,77,71,32,32,71,93,72,32},
  {109,32,125,109,70,75,74,70,75,109,70,75,74,70,125,113,32,32,74,70,75,113,32,113,32,113,32,74,70,75,113,32,39,109,70,125,74,32,75,32},
  {32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32}
};
static const unsigned char font_am_co[5][40] = {
  {15,13,1,15,13,1,15,13,1,15,13,1,15,13,1,15,13,1,15,13,1,15,13,1,13,1,1,13,13,1,15,13,1,1,13,13,13,13,1,13},
  {15,13,13,15,13,13,15,15,15,15,15,13,15,13,15,5,15,15,15,15,15,15,13,13,13,13,13,13,13,13,15,1,13,13,13,15,15,13,13,13},
  {5,15,13,5,15,13,5,15,13,5,15,13,5,15,13,5,15,5,5,15,13,5,15,13,13,15,13,5,15,13,5,13,13,15,15,13,5,15,15,13},
  {5,15,15,5,5,15,5,5,15,5,5,15,5,5,15,5,5,5,5,5,15,5,15,15,13,5,13,5,5,15,5,13,5,5,5,15,5,13,15,13},
  {14,15,15,14,14,14,15,15,13,13,13,13,13,13,13,14,14,14,14,14,15,14,15,15,15,13,13,14,14,15,15,13,13,14,13,13,14,14,13,14}
};

// ---------------------------------------------------------------
// Font — uppercase N-Z: screen_002 rows 0-4 (petscii-cupid.petmate)
// ---------------------------------------------------------------
static const unsigned char font_nz_ch[5][40] = {
  {114,32,114,85,68,73,85,68,73,85,68,73,85,68,73,85,68,73,112,114,110,85,32,73,116,89,85,32,73,32,32,32,71,32,71,67,68,110,32,32},
  {71,77,72,71,32,72,71,32,72,71,32,72,71,32,72,74,68,73,32,93,32,71,32,72,84,89,71,72,72,77,32,47,74,70,115,32,78,32,32,32},
  {71,32,72,71,32,72,107,70,75,71,32,72,107,70,75,71,32,72,32,93,32,71,32,72,71,72,71,93,72,32,86,32,71,32,72,78,32,72,32,32},
  {113,32,113,74,70,75,93,32,32,74,70,77,93,32,77,74,70,75,32,113,32,74,70,75,74,75,74,113,75,47,32,77,109,70,75,109,70,125,32,32},
  {32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32}
};
static const unsigned char font_nz_co[5][40] = {
  {15,13,1,15,13,1,13,13,1,15,13,1,13,13,1,15,13,1,15,13,1,15,13,1,13,1,13,13,1,15,13,1,15,13,1,15,13,1,13,13},
  {15,13,13,15,13,13,15,15,13,15,13,13,15,15,13,15,13,1,5,15,15,15,15,15,15,13,15,13,13,15,13,1,15,13,13,15,13,1,13,13},
  {5,15,13,5,15,13,5,15,15,5,15,13,5,15,15,5,15,13,5,15,5,5,15,13,5,15,5,15,15,15,13,13,5,15,13,5,15,13,13,13},
  {5,15,15,5,5,15,5,5,5,5,5,15,5,5,5,5,5,15,5,5,5,5,5,15,5,13,5,5,15,5,15,13,5,5,15,5,5,15,13,13},
  {14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,14,14,14,14,14,5,5,5,14,5,5,5,14,14,5,14}
};

// ---------------------------------------------------------------
// Font — digits 0-9 + symbols :.,!;,/'" : screen_001 rows 10-14
// ---------------------------------------------------------------
static const unsigned char font_dig_ch[5][40] = {
  {85,68,73,73,85,68,73,85,68,73,85,32,73,112,68,110,85,68,73,112,68,110,85,68,73,85,68,73,32,32,89,32,32,32,32,32,66,66,66,32},
  {71,78,72,72,85,70,75,32,70,115,71,32,72,74,68,73,107,68,73,32,85,125,107,70,115,71,32,72,81,32,72,81,32,32,32,47,72,72,71,32},
  {71,32,72,72,71,32,32,32,32,72,74,70,115,71,32,72,71,32,72,32,71,32,71,32,72,74,70,115,81,32,93,66,66,32,78,32,32,32,32,32},
  {74,70,75,113,74,70,125,109,70,75,32,32,71,74,70,75,74,70,75,32,84,32,74,70,75,74,70,75,32,81,81,72,72,47,32,32,32,32,32,32},
  {32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,75,75,32,32,32,32,32,32,32},
};
static const unsigned char font_dig_co[5][40] = {
  {15,13,1,1,15,13,1,13,1,1,13,15,1,15,13,1,15,13,1,15,13,1,15,13,1,13,1,1,15,15,1,1,15,15,15,15,1,1,1,14},
  {15,15,1,13,15,13,1,15,15,13,15,15,13,15,13,1,15,13,1,15,15,13,15,13,1,15,15,13,13,15,13,13,15,14,15,13,13,13,13,14},
  {5,15,13,15,5,15,15,15,15,15,5,5,15,5,15,13,5,15,13,15,15,14,5,15,13,5,15,15,15,15,15,15,13,15,15,15,15,14,14,14},
  {5,5,15,5,5,5,15,5,5,15,15,15,5,5,5,15,5,5,15,15,5,14,5,5,15,5,5,15,15,15,5,5,15,5,14,14,14,14,14,14},
  {14,15,15,14,14,14,15,15,15,15,14,14,15,15,15,14,14,14,14,14,15,14,15,15,15,15,15,14,14,15,15,5,5,14,14,14,14,14,14,14},
};

// ---------------------------------------------------------------
// Font — symbols $&%-+?=#(<)>[@ ] : screen_001 rows 15-19
// ---------------------------------------------------------------
static const unsigned char font_sym_ch[5][40] = {
  {85,91,73,85,68,73,32,32,32,32,32,32,32,32,32,32,112,68,73,32,32,32,32,71,71,85,68,32,47,68,73,77,32,112,64,32,32,32,64,110},
  {74,91,73,107,70,115,87,32,47,32,32,32,32,32,72,32,32,85,75,70,67,68,32,91,91,71,32,60,32,32,72,32,62,93,32,85,68,73,32,66},
  {32,66,72,71,77,72,32,78,32,32,70,67,68,70,91,68,32,71,32,70,67,68,32,91,91,71,32,32,77,32,72,47,32,93,32,71,74,75,32,66},
  {74,91,75,74,70,91,47,32,87,32,32,32,32,32,71,32,32,81,32,32,32,32,32,72,72,74,70,32,32,70,75,32,32,109,64,74,70,75,64,125},
  {32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32},
};
static const unsigned char font_sym_co[5][40] = {
  {15,13,1,13,1,1,14,15,15,14,14,14,14,15,14,15,13,1,1,14,14,14,14,13,1,13,1,15,1,13,1,1,14,13,1,14,14,14,13,1},
  {15,13,1,15,15,13,13,15,1,14,14,14,15,15,1,15,15,15,13,15,13,1,15,15,13,15,15,13,15,15,13,14,13,15,15,13,13,1,15,13},
  {15,15,13,5,15,13,15,13,15,15,15,13,1,15,13,15,15,5,14,15,13,1,14,15,15,5,15,14,15,15,15,15,14,5,15,15,13,15,15,15},
  {5,5,15,5,15,15,15,14,15,15,14,15,14,15,15,15,14,5,14,14,14,14,14,5,5,5,15,15,14,5,5,14,14,5,15,5,5,15,15,5},
  {14,14,14,14,15,15,14,14,15,15,15,14,14,14,15,14,14,15,13,14,14,14,14,15,14,13,13,13,13,13,14,14,14,14,14,14,14,13,15,14},
};

// ---------------------------------------------------------------
// Letter geometry
//
// Indices 0-25:  uppercase A-Z
// Indices 26-51: lowercase a-z
// Index 52:      space / unknown (sentinel — never drawn)
// Indices 53-62: digits 0-9
// Indices 63-70: symbols : . ! ; , / ' "
// Indices 71-85: symbols $ & % - + ? = # ( < ) > [ @ ]
//
// letter_start: column within the font band array for each glyph.
// letter_width: column count of each glyph.
// ---------------------------------------------------------------

// Uppercase A-Z start cols (A-M in font_am, N-Z in font_nz):
//   A=0 B=3 C=6 D=9 E=12 F=15 G=18 H=21 I=25 J=27 K=30 L=33 M=36
//   N=0 O=3 P=6 Q=9 R=12 S=15 T=18 U=21 V=24 W=26 X=29 Y=32 Z=35
//
// Lowercase a-n start cols (in font_lc_an):
//   a=0 b=3 c=6 d=9 e=12 f=15 g=17 h=20 i=23 j=24 k=26 l=29 m=30 n=35
//
// Lowercase o-z start cols (in font_lc_oz):
//   o=0 p=3 q=6 r=9 s=12 t=15 u=18 v=21 w=23 x=28 y=31 z=34

static const unsigned char letter_start[86] = {
    // Uppercase A-M (0-12)
     0, 3, 6, 9,12,15,18,21,25,27,30,33,36,
    // Uppercase N-Z (13-25)
     0, 3, 6, 9,12,15,18,21,24,26,29,32,35,
    // Lowercase a-n (26-39)
     0, 3, 6, 9,12,15,17,20,23,24,26,29,30,35,
    // Lowercase o-z (40-51)
     0, 3, 6, 9,12,15,18,21,23,28,31,34,
    // Space (52) — dummy, never accessed
     0,
    // Digits 0-9 (53-62)
     0, 3, 4, 7,10,13,16,19,22,25,
    // Symbols : . ! ; , / ' " (63-70)
    28,29,30,31,32,33,36,37,
    // Symbols $ & % - + ? = # ( < ) > [ @ ] (71-85)
     0, 3, 6, 9,13,16,19,23,25,27,29,31,33,35,38
};

static const unsigned char letter_width[86] = {
    // Uppercase A-M (0-12): H=4,I=2, rest=3
    3,3,3,3,3,3,3,4,2,3,3,3,3,
    // Uppercase N-Z (13-25): V=2, rest=3
    3,3,3,3,3,3,3,3,2,3,3,3,3,
    // Lowercase a-n (26-39): f=2,i=1,j=2,l=1,m=5, rest=3
    3,3,3,3,3,2,3,3,1,2,3,1,5,3,
    // Lowercase o-z (40-51): v=2,w=5, rest=3
    3,3,3,3,3,3,3,2,5,3,3,3,
    // Space (52)
    3,
    // Digits 0-9 (53-62): 1=1, rest=3
    3,1,3,3,3,3,3,3,3,3,
    // Symbols : . ! ; , / ' " (63-70): /=3, "=2, rest=1
    1,1,1,1,1,3,1,2,
    // Symbols $ & % - + ? = # ( < ) > [ @ ] (71-85)
    3,3,3,4,3,3,4,2,2,2,2,2,2,3,2
};

// ---------------------------------------------------------------
// Sine table for scroller wave: ±2 rows, 64 entries (subtle wave)
// ---------------------------------------------------------------
static const signed char sin_row[64] = {
     0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 1, 1, 1, 1, 0, 0,
    -1,-1,-1,-2,-2,-2,-2,-2,-2,-2,-1,-1,-1, 0, 0, 1,
     0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 1, 1, 1, 1, 0, 0,
    -1,-1,-1,-2,-2,-2,-2,-2,-2,-2,-1,-1,-1, 0, 0, 1
};

// ---------------------------------------------------------------
// Plasma: 64-entry sine (values 0-7) and 8-color palette
// ---------------------------------------------------------------
static const unsigned char psin[64] = {
    4,4,4,5,5,5,5,6, 6,6,6,7,7,7,7,7, 7,7,7,7,7,7,6,6,
    6,6,5,5,5,5,4,4, 4,3,3,2,2,2,2,1, 1,1,1,0,0,0,0,0,
    0,0,0,0,0,0,1,1, 1,1,2,2,2,2,3,3
};
// red→orange→yellow→ltgreen→green→cyan→ltblue→blue
static const unsigned char pcolor[8] = {2, 8, 7, 13, 5, 3, 14, 6};

// ---------------------------------------------------------------
// Scroll text — mixed case source:
//   source uppercase A-Z → uppercase font glyphs (petscii.h: → PETSCII 0x61-0x7A)
//   source lowercase a-z → lowercase font glyphs (petscii.h: → PETSCII 0x41-0x5A)
// ---------------------------------------------------------------
static const unsigned char scroll_text[] =
    "  Ultimate Demo 2026  "
    "Coded In C By Xander Mol  "
    "Running At 64 Mhz On The Ultimate 64 Hardware  "
    "Greetings To All C64 Demo Coders  "
    "Still Pushing The Limits Of The C64 In 2026  "
    "  - Credits -  "
    "Code - Oscar64 Compiler By drmortalwombat  "
    "Music - Forever Young - 4ev.mod  "
    "Font - Small Round PETSCII Font By Cupid  "
    "  - Special Thanks -  "
    "Gideon Zweijtzer - Creator Of The Ultimate 64  "
    "The Fastest C64 Compatible Machine  "
    "  Thank You For Watching  "
    "Press Any Key To Exit  "
    "                                        ";
#define SCROLL_LEN  (sizeof(scroll_text) - 1)

// ---------------------------------------------------------------
// Per-column scroll state
// ---------------------------------------------------------------
static unsigned char scr_letter[SCR_COLS];  // 0-51=letter, 52=space
static unsigned char scr_col[SCR_COLS];     // column within letter

// Inner draw-function locals — module statics so Oscar64 allocates them to
// fixed BSS addresses, NOT ZP $52-$57.  modplay_tick's fx_row clobbers
// $52-$57 on every CIA1 Timer A IRQ without save/restore; any local variable
// in that ZP range would be silently corrupted mid-computation, turning the
// 16-bit `pos` into a wild-pointer write into CIA1 ($DC00+) or Oscar64 code.
static unsigned char dp_y, dp_x, dp_v;    // draw_plasma loop state
static unsigned int  dp_pos;              // draw_plasma write address (critical: 16-bit)
static unsigned char df_x, df_r;          // draw_frame loop counters
static signed char   df_yoff;             // draw_frame sine offset
static unsigned char df_row0;             // draw_frame base row per column
static unsigned int  df_pos;              // draw_frame write address (critical: 16-bit)
static unsigned char df_li, df_ci;        // draw_frame letter/column indices
static unsigned char sl_i;               // column-shift loop counter
static unsigned char sl_cur_li, sl_wid;  // insert-column temporaries
static unsigned int  scr_i;              // scr_init / scr_done loop counter
// Outer scroller loop state (same reason — BSS not ZP):
static unsigned int  txt_pos;
static unsigned char insert_col;
static unsigned char fine_x;
static unsigned char wave_phase;
static unsigned char plasma_phase;
static unsigned char done;
static unsigned int  loops;

// ---------------------------------------------------------------
// Font and letter lookup
// ---------------------------------------------------------------
static inline unsigned char font_ch(unsigned char li, unsigned char ci, unsigned char ri)
{
    unsigned char sc = (unsigned char)(letter_start[li] + ci);
    if (li < 13) return font_am_ch[ri][sc];
    if (li < 26) return font_nz_ch[ri][sc];
    if (li < 40) return font_lc_an_ch[ri][sc];
    if (li < 52) return font_lc_oz_ch[ri][sc];
    if (li < 71) return font_dig_ch[ri][sc];
    return font_sym_ch[ri][sc];
}
static inline unsigned char font_co(unsigned char li, unsigned char ci, unsigned char ri)
{
    unsigned char sc = (unsigned char)(letter_start[li] + ci);
    if (li < 13) return font_am_co[ri][sc];
    if (li < 26) return font_nz_co[ri][sc];
    if (li < 40) return font_lc_an_co[ri][sc];
    if (li < 52) return font_lc_oz_co[ri][sc];
    if (li < 71) return font_dig_co[ri][sc];
    return font_sym_co[ri][sc];
}

// letter_idx: returns 0-25 for uppercase, 26-51 for lowercase, 52 for space/other.
// With petscii.h active:
//   source uppercase A-Z compiles to PETSCII 0x61-0x7A (97-122) → uppercase slots
//   source lowercase a-z compiles to PETSCII 0x41-0x5A (65-90)  → lowercase slots
static unsigned char letter_idx(unsigned char c)
{
    if (c >= 97 && c <= 122) return (unsigned char)(c - 97);       // uppercase A-Z
    if (c >= 65 && c <= 90)  return (unsigned char)(c - 65 + 26);  // lowercase a-z
    if (c >= 48 && c <= 57)  return (unsigned char)(c - 48 + 53);  // digits 0-9
    switch (c) {
        case 58: return 63;  // :
        case 46: return 64;  // .
        case 33: return 65;  // !
        case 59: return 66;  // ;
        case 44: return 67;  // ,
        case 47: return 68;  // /
        case 39: return 69;  // '
        case 34: return 70;  // "
        case 36: return 71;  // $
        case 38: return 72;  // &
        case 37: return 73;  // %
        case 45: return 74;  // -
        case 43: return 75;  // +
        case 63: return 76;  // ?
        case 61: return 77;  // =
        case 35: return 78;  // #
        case 40: return 79;  // (
        case 60: return 80;  // <
        case 41: return 81;  // )
        case 62: return 82;  // >
        case 91: return 83;  // [
        case 64: return 84;  // @
        case 93: return 85;  // ]
    }
    return 52;
}

// ---------------------------------------------------------------
// Screen helpers
// ---------------------------------------------------------------
// __noinline: prevents Oscar64 -O2 from constant-propagating ctrl1's known
// value (0x1B from vic_setmode) into the vic_waitFrame loops in scroller_run,
// which would make the second poll loop infinite. Also prevents elimination of
// the memptr write that switches to uppercase+graphics charset ($1000).
__noinline static void scr_init(void)
{
    // VIC bank 0, $1000 = uppercase+graphics charset ROM (not lowercase at $1800).
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1000);
    vic.color_back   = 0;
    vic.color_border = 0;
    for (scr_i = 0; scr_i < (unsigned int)(SCR_COLS * SCR_ROWS); scr_i++) {
        SCR_BASE[scr_i] = 32;
        COL_BASE[scr_i] = 6;
    }
    for (scr_i = 0; scr_i < SCR_COLS; scr_i++) {
        scr_letter[scr_i] = 52;
        scr_col[scr_i]    = 0;
    }
    vic.ctrl2 = (char)((vic.ctrl2 & 0xF8) | 7);
}

// __noinline: same reason as scr_init — ensures the memptr write that
// restores the lowercase+uppercase charset ($1800) for the end screen
// is not eliminated by cross-function optimization.
__noinline static void scr_done(void)
{
    vic.ctrl2 = (char)(vic.ctrl2 & 0xF8);
    // Restore lowercase+uppercase charset ($1800) for the CharWin end screen.
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
    for (scr_i = 0; scr_i < (unsigned int)(SCR_COLS * SCR_ROWS); scr_i++)
        SCR_BASE[scr_i] = 32;
}

// ---------------------------------------------------------------
// Plasma background — fills all 1000 cells before scroller overlay.
// Screen code 160 = solid reverse-space block (foreground color).
// ---------------------------------------------------------------
static void draw_plasma(void)
{
    for (dp_y = 0; dp_y < SCR_ROWS; dp_y++) {
        for (dp_x = 0; dp_x < SCR_COLS; dp_x++) {
            dp_v = (unsigned char)(
                (psin[((unsigned char)(dp_x * 5u) + plasma_phase) & 63u] +
                 psin[((unsigned char)(dp_y * 9u) + (unsigned char)(plasma_phase * 2u)) & 63u]) >> 1u
            );
            dp_pos = (unsigned int)dp_y * SCR_COLS + dp_x;
            SCR_BASE[dp_pos] = (unsigned char)160;
            COL_BASE[dp_pos] = pcolor[dp_v];
        }
    }
}

// ---------------------------------------------------------------
// Draw one frame: plasma → black scroll bar → letter overlay
//
// BASE_ROW = 10, sine ±4 → row0 in 6..14.
// Bar spans 9 rows per column (row0-2 .. row0+6):
//   row0-2: PETSCII 0x63, dark grey (top border line)
//   row0-1: black space (top clearance)
//   row0..row0+4: black space (letter area, overwritten by glyphs)
//   row0+5: black space (bottom clearance)
//   row0+6: PETSCII 0x64, dark grey (bottom border line)
// ---------------------------------------------------------------
#define BASE_ROW  10
#define FONT_H     5

static void draw_frame(void)
{
    draw_plasma();

    for (df_x = 0; df_x < SCR_COLS; df_x++) {
        df_yoff = 0;
        df_row0 = (unsigned char)((unsigned char)BASE_ROW + df_yoff);

        // Top border line
        df_pos = (unsigned int)(df_row0 - 2) * SCR_COLS + df_x;
        SCR_BASE[df_pos] = 0x63;
        COL_BASE[df_pos] = 11;

        // Black clearance + letter area + clearance (7 rows: row0-1 .. row0+5)
        for (df_r = 0; df_r < 7; df_r++) {
            df_pos = (unsigned int)(df_row0 - 1 + df_r) * SCR_COLS + df_x;
            SCR_BASE[df_pos] = 0x20;
            COL_BASE[df_pos] = 0;
        }

        // Bottom border line
        df_pos = (unsigned int)(df_row0 + 6) * SCR_COLS + df_x;
        SCR_BASE[df_pos] = 0x64;
        COL_BASE[df_pos] = 11;

        // Letter overlay
        df_li = scr_letter[df_x];
        df_ci = scr_col[df_x];
        if (df_li != 52) {
            for (df_r = 0; df_r < FONT_H; df_r++) {
                df_pos = (unsigned int)(df_row0 + df_r) * SCR_COLS + df_x;
                SCR_BASE[df_pos] = font_ch(df_li, df_ci, df_r);
                COL_BASE[df_pos] = font_co(df_li, df_ci, df_r);
            }
        }
    }
}

// ---------------------------------------------------------------
// Public entry point
// ---------------------------------------------------------------

void scroller_run(void)
{
    txt_pos      = 0;
    insert_col   = 0;
    fine_x       = 7;
    wave_phase   = 0;
    plasma_phase = 0;
    done         = 0;
    loops        = 0;

    scr_init();   // uppercase+graphics charset ($1000); __noinline prevents optimizer hang
    vic.color_border = 0;   // explicit barrier: forces volatile-write between scr_init and vic_waitFrame

    while (!done) {
        vic_waitFrame();

        // Direct CIA1 keypress: assert all rows ($DC00=0), read columns.
        // KERNAL GETIN is not used: modplay_irq uses RTI (no KERNAL chain),
        // so SCNKEY never runs and the KERNAL keyboard buffer is not filled.
        *((volatile unsigned char *)0xDC00) = 0;
        if (*((volatile unsigned char *)0xDC01) != (unsigned char)0xFF)
            done = 1;
        *((volatile unsigned char *)0xDC00) = (unsigned char)0xFF;

        if (fine_x == 0) {
            fine_x = 7;

            // Shift column buffer left
            for (sl_i = 0; sl_i < SCR_COLS - 1; sl_i++) {
                scr_letter[sl_i] = scr_letter[sl_i + 1];
                scr_col[sl_i]    = scr_col[sl_i + 1];
            }

            // Insert next column at position 39
            sl_cur_li = letter_idx(scroll_text[txt_pos]);
            sl_wid    = letter_width[sl_cur_li];

            if (insert_col < sl_wid) {
                scr_letter[SCR_COLS - 1] = sl_cur_li;
                scr_col[SCR_COLS - 1]    = insert_col;
                insert_col++;
            } else {
                // Inter-letter gap column
                scr_letter[SCR_COLS - 1] = 52;
                scr_col[SCR_COLS - 1]    = 0;
                insert_col = 0;
                txt_pos++;
                if (txt_pos >= SCROLL_LEN) {
                    txt_pos = 0;
                    loops++;
                    if (loops >= 2) done = 1;
                }
            }
        } else {
            fine_x--;
        }

        draw_frame();
        wave_phase    = (unsigned char)(wave_phase    + 1u);
        plasma_phase  = (unsigned char)(plasma_phase  + 1u);
        vic.ctrl2 = (char)((vic.ctrl2 & 0xF8) | fine_x);
    }

    scr_done();
}
