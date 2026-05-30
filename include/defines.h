#ifndef DEFINES_H_
#define DEFINES_H_

#include "c64/vic.h"
#include "c64/charwin.h"

// ---------------------------------------------------------------
// Screen codes
// ---------------------------------------------------------------
#define SC_SPACE    0x20   // space character screen code
#define SC_REVSPACE 0xA0   // reversed space (solid block)

// ---------------------------------------------------------------
// PETSCII character and control codes
// ---------------------------------------------------------------
#define CH_CURS_UP    145   // Cursor Up
#define CH_CURS_DOWN   17   // Cursor Down
#define CH_CURS_LEFT  157   // Cursor Left
#define CH_CURS_RIGHT  29   // Cursor Right
#define CH_PI         222   // Pi symbol
#define CH_HOME        19   // HOME
#define CH_CLEAR      147   // Clear screen (SHIFT+HOME)
#define CH_DEL         20   // Delete
#define CH_INS        148   // Insert (SHIFT+DEL)
#define CH_ENTER       13   // Return
#define CH_STOP         3   // RUN/STOP
#define CH_RUN         10   // RUN (SHIFT+STOP)
#define CH_TAB          9   // Tab
#define CH_LIRA        92   // Pound sign
#define CH_ESC         27   // Escape
#define CH_FONT_LOWER  14   // Switch to lowercase font
#define CH_FONT_UPPER 142   // Switch to uppercase font
#define CH_ARROW_UP    94   // Arrow up (^)
#define CH_ARROW_LEFT  95   // Arrow left (<-)
#define CH_SPACE       32   // Space
#define CH_MINUS       45   // Minus / hyphen
#define CH_BLACK      144   // Black         CTRL-1
#define CH_WHITE        5   // White         CTRL-2
#define CH_DRED        28   // Dark red       CTRL-3
#define CH_LCYAN      159   // Light cyan     CTRL-4
#define CH_LPURPLE    156   // Light purple   CTRL-5
#define CH_DGREEN      30   // Dark green     CTRL-6
#define CH_DBLUE       31   // Dark blue      CTRL-7
#define CH_LYELLOW    158   // Light yellow   CTRL-8
#define CH_RVSON       18   // Reverse on     CTRL-9
#define CH_RVSOFF     146   // Reverse off    CTRL-0
#define CH_DPURPLE    129   // Dark purple    C=-1
#define CH_DYELLOW    149   // Dark yellow    C=-2
#define CH_LRED       150   // Light red      C=-3
#define CH_DCYAN      151   // Dark cyan      C=-4
#define CH_DGREY      152   // Dark grey      C=-5
#define CH_LGREEN     153   // Light green    C=-6
#define CH_LBLUE      154   // Light blue     C=-7
#define CH_LGREY      155   // Light grey     C=-8
#define CH_F1         133   // F1
#define CH_F2         137   // F2
#define CH_F3         134   // F3
#define CH_F4         138   // F4
#define CH_F5         135   // F5
#define CH_F6         139   // F6
#define CH_F7         136   // F7
#define CH_F8         140   // F8

// ---------------------------------------------------------------
// Generic return codes
// ---------------------------------------------------------------
#define OK     0
#define ERROR -1
#define ABORT +1

// ---------------------------------------------------------------
// String and buffer size limits
// ---------------------------------------------------------------
#define MAXPATHLEN    256
#define MAXFILENAME    51
#define SAVE_BUF_SIZE 500

// ---------------------------------------------------------------
// Utility macro
// ---------------------------------------------------------------
#ifndef min
#define min(a, b) ((a) < (b) ? (a) : (b))
#endif

// ---------------------------------------------------------------
// Application identity
// ---------------------------------------------------------------
#define APP_NAME    "UltimateDemo2026"
#define APP_AUTHOR  "Xander Mol"

// ---------------------------------------------------------------
// Colour palette for the demo UI
// (COL_* used by screen.h / screen.c)
// ---------------------------------------------------------------
#define COL_BACKGROUND   VCOL_BLACK
#define COL_BORDER       VCOL_BLACK
#define COL_HEADER1      VCOL_GREEN
#define COL_HEADER2      VCOL_LT_GREEN
#define COL_LABEL        VCOL_WHITE
#define COL_OK           VCOL_GREEN
#define COL_FAIL         VCOL_RED
#define COL_DETAIL_OK    VCOL_CYAN
#define COL_DETAIL_FAIL  VCOL_YELLOW
#define COL_INFO         VCOL_LT_GREY
#define COL_HINT         VCOL_YELLOW
#define COL_SUCCESS      VCOL_LT_GREEN
#define COL_KEY          VCOL_WHITE

// ---------------------------------------------------------------
// Global CharWin — declared in screen.c, used everywhere
// ---------------------------------------------------------------
extern CharWin cw;
extern char linebuffer[81];

#endif
