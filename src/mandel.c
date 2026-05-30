// UltimateDemo2026 — Fractal demo with MC colorization
//
// Standard multicolor hires (160×200):
//   4 colours per 4×8-pixel cell: background (c0), c1/c2 from screen RAM,
//   c3 from color RAM.  Colour palette varies by diagonal zone and content type.
//
// Memory — VIC bank 3 ($C000–$FFFF):
//   $C000–$C3FF  Screen RAM (1 KB, one page)
//   $E000–$FFFF  MC bitmap (8 KB)
//   $D800–$DBFF  Color RAM c3 (hardware chip, always at $D800)
//
// Five frames: 3 Mandelbrot zoom levels + 2 Julia sets.

#include <c64/vic.h>
#include <c64/cia.h>
#include <c64/memmap.h>
#include <gfx/mcbitmap.h>
#include <fixmath.h>
#include <string.h>
#include "turbo.h"
#include "mandel.h"

// ---------------------------------------------------------------
// Memory addresses
// ---------------------------------------------------------------
#define MC_SCREEN  ((char *)0xC000)  // 1-KB screen page
#define MC_HIRES   ((char *)0xE000)  // 8-KB MC bitmap
#define MC_CRAM    ((char *)0xD800)  // 1-KB color RAM (hardware I/O)

// ---------------------------------------------------------------
// Fixed-point: 4.12 format (4096 = 1.0)
// lsqr4f12s(x) → x² as unsigned long (8.24)
// lmul4f12s(x,y) → x*y as int (4.12)
// Escape: |z|² ≥ 4.0 → zr²+zi² ≥ 4×4096² = 0x04000000
// ---------------------------------------------------------------
#define SCALE_4F12    4096
#define ESCAPE_4F12   0x04000000UL
#define MAXITER  32

// 2-bit pixel value → byte pattern (all 4 pixels in a byte set to that value)
static const char cbytes[4] = { 0x00, 0x55, 0xAA, 0xFF };

static inline char iter_to_value(char iter)
{
    char band = (char)((iter * 8) / MAXITER);
    return (char)((band % 3) + 1);
}

// ---------------------------------------------------------------
// Frame descriptor
// ---------------------------------------------------------------
typedef struct {
    int  real_min, imag_min;
    char step_r,   step_i;
    int  julia_cr, julia_ci;
} Frame;

static const Frame frames[5] = {
    { -10240, -6400, 96, 64,    0,    0 },   // Mandelbrot full
    {  -7168, -2785, 51, 32,    0,    0 },   // Seahorse medium
    {  -5120, -2048, 26, 16,    0,    0 },   // Seahorse deep
    { -10240, -6400, 96, 64, -2867, 1106 },  // Julia c=(-0.7+0.27i)
    { -10240, -6400, 96, 64, -3277,  639 },  // Julia c=(-0.8+0.156i)
};
#define NUM_FRAMES  5

// ---------------------------------------------------------------
// Per-cell colour palettes — content_type × diagonal_zone.
// content_type: 0=deep-ext, 1=mid-ext, 2=near-boundary, 3=boundary.
// zone: 0=top-left … 3=bottom-right (from cx+cy).
// ---------------------------------------------------------------
typedef struct { char c1, c2, c3; } CPal;

// Frame 0: Full Mandelbrot — blue centre, warm edges
static const CPal f0c[4][4] = {
  {{ VCOL_LT_GREY, VCOL_MED_GREY, VCOL_WHITE    }, { VCOL_YELLOW,  VCOL_ORANGE,  VCOL_WHITE   }, { VCOL_ORANGE,  VCOL_YELLOW,  VCOL_WHITE    }, { VCOL_WHITE,   VCOL_LT_GREY, VCOL_YELLOW  }},
  {{ VCOL_LT_BLUE, VCOL_BLUE,     VCOL_CYAN     }, { VCOL_CYAN,    VCOL_LT_BLUE, VCOL_WHITE   }, { VCOL_YELLOW,  VCOL_ORANGE,  VCOL_WHITE    }, { VCOL_WHITE,   VCOL_YELLOW,  VCOL_ORANGE  }},
  {{ VCOL_BLUE,    VCOL_PURPLE,   VCOL_CYAN     }, { VCOL_CYAN,    VCOL_LT_BLUE, VCOL_GREEN   }, { VCOL_GREEN,   VCOL_YELLOW,  VCOL_WHITE    }, { VCOL_WHITE,   VCOL_LT_GREEN,VCOL_GREEN   }},
  {{ VCOL_PURPLE,  VCOL_BLUE,     VCOL_LT_BLUE  }, { VCOL_LT_BLUE, VCOL_CYAN,    VCOL_LT_GREEN}, { VCOL_LT_GREEN,VCOL_GREEN,   VCOL_YELLOW   }, { VCOL_YELLOW,  VCOL_WHITE,   VCOL_LT_GREY }},
};

// Frame 1: Seahorse medium — green/teal
static const CPal f1c[4][4] = {
  {{ VCOL_LT_GREY, VCOL_WHITE,    VCOL_LT_GREEN }, { VCOL_LT_GREEN,VCOL_GREEN,   VCOL_WHITE   }, { VCOL_YELLOW,  VCOL_LT_GREEN,VCOL_WHITE    }, { VCOL_WHITE,   VCOL_YELLOW,  VCOL_ORANGE  }},
  {{ VCOL_LT_BLUE, VCOL_CYAN,     VCOL_WHITE    }, { VCOL_CYAN,    VCOL_LT_BLUE, VCOL_LT_GREEN}, { VCOL_LT_GREEN,VCOL_YELLOW,  VCOL_WHITE    }, { VCOL_WHITE,   VCOL_LT_GREEN,VCOL_YELLOW  }},
  {{ VCOL_BLUE,    VCOL_CYAN,     VCOL_LT_BLUE  }, { VCOL_LT_BLUE, VCOL_GREEN,   VCOL_CYAN    }, { VCOL_GREEN,   VCOL_LT_GREEN,VCOL_WHITE    }, { VCOL_WHITE,   VCOL_GREEN,   VCOL_LT_GREEN}},
  {{ VCOL_BLUE,    VCOL_PURPLE,   VCOL_CYAN     }, { VCOL_CYAN,    VCOL_LT_BLUE, VCOL_WHITE   }, { VCOL_LT_GREEN,VCOL_CYAN,    VCOL_WHITE    }, { VCOL_WHITE,   VCOL_LT_GREY, VCOL_LT_GREEN}},
};

// Frame 2: Deep seahorse — orange/red heat
static const CPal f2c[4][4] = {
  {{ VCOL_LT_GREY, VCOL_MED_GREY, VCOL_WHITE    }, { VCOL_ORANGE,  VCOL_YELLOW,  VCOL_WHITE   }, { VCOL_LT_RED,  VCOL_ORANGE,  VCOL_YELLOW   }, { VCOL_WHITE,   VCOL_LT_RED,  VCOL_ORANGE  }},
  {{ VCOL_BROWN,   VCOL_ORANGE,   VCOL_YELLOW   }, { VCOL_YELLOW,  VCOL_ORANGE,  VCOL_WHITE   }, { VCOL_ORANGE,  VCOL_LT_RED,  VCOL_WHITE    }, { VCOL_WHITE,   VCOL_ORANGE,  VCOL_YELLOW  }},
  {{ VCOL_PURPLE,  VCOL_RED,      VCOL_ORANGE   }, { VCOL_ORANGE,  VCOL_YELLOW,  VCOL_WHITE   }, { VCOL_YELLOW,  VCOL_WHITE,   VCOL_LT_GREY  }, { VCOL_LT_GREY, VCOL_WHITE,   VCOL_YELLOW  }},
  {{ VCOL_BLUE,    VCOL_PURPLE,   VCOL_LT_RED   }, { VCOL_LT_RED,  VCOL_ORANGE,  VCOL_YELLOW  }, { VCOL_YELLOW,  VCOL_WHITE,   VCOL_LT_GREY  }, { VCOL_WHITE,   VCOL_LT_GREY, VCOL_YELLOW  }},
};

// Frame 3: Julia 1 — ice crystal (cool blues)
static const CPal f3c[4][4] = {
  {{ VCOL_LT_GREY, VCOL_WHITE,    VCOL_LT_BLUE  }, { VCOL_LT_BLUE, VCOL_WHITE,   VCOL_LT_GREY }, { VCOL_CYAN,    VCOL_LT_BLUE, VCOL_WHITE    }, { VCOL_WHITE,   VCOL_CYAN,    VCOL_LT_BLUE }},
  {{ VCOL_LT_BLUE, VCOL_BLUE,     VCOL_CYAN     }, { VCOL_CYAN,    VCOL_LT_BLUE, VCOL_WHITE   }, { VCOL_LT_BLUE, VCOL_CYAN,    VCOL_WHITE    }, { VCOL_WHITE,   VCOL_LT_BLUE, VCOL_CYAN    }},
  {{ VCOL_BLUE,    VCOL_PURPLE,   VCOL_LT_BLUE  }, { VCOL_LT_BLUE, VCOL_CYAN,    VCOL_WHITE   }, { VCOL_CYAN,    VCOL_LT_GREEN,VCOL_WHITE    }, { VCOL_WHITE,   VCOL_LT_GREEN,VCOL_CYAN    }},
  {{ VCOL_PURPLE,  VCOL_BLUE,     VCOL_CYAN     }, { VCOL_CYAN,    VCOL_LT_BLUE, VCOL_LT_GREEN}, { VCOL_LT_GREEN,VCOL_WHITE,   VCOL_LT_GREY  }, { VCOL_LT_GREY, VCOL_WHITE,   VCOL_LT_GREEN}},
};

// Frame 4: Julia 2 — volcanic orange
static const CPal f4c[4][4] = {
  {{ VCOL_BROWN,   VCOL_ORANGE,   VCOL_YELLOW   }, { VCOL_YELLOW,  VCOL_ORANGE,  VCOL_WHITE   }, { VCOL_ORANGE,  VCOL_YELLOW,  VCOL_WHITE    }, { VCOL_WHITE,   VCOL_YELLOW,  VCOL_ORANGE  }},
  {{ VCOL_RED,     VCOL_ORANGE,   VCOL_YELLOW   }, { VCOL_ORANGE,  VCOL_YELLOW,  VCOL_WHITE   }, { VCOL_YELLOW,  VCOL_WHITE,   VCOL_LT_GREY  }, { VCOL_WHITE,   VCOL_LT_GREY, VCOL_YELLOW  }},
  {{ VCOL_PURPLE,  VCOL_RED,      VCOL_ORANGE   }, { VCOL_LT_RED,  VCOL_ORANGE,  VCOL_YELLOW  }, { VCOL_ORANGE,  VCOL_WHITE,   VCOL_LT_GREY  }, { VCOL_WHITE,   VCOL_ORANGE,  VCOL_YELLOW  }},
  {{ VCOL_BLUE,    VCOL_PURPLE,   VCOL_RED      }, { VCOL_RED,     VCOL_ORANGE,  VCOL_YELLOW  }, { VCOL_YELLOW,  VCOL_WHITE,   VCOL_LT_GREY  }, { VCOL_LT_GREY, VCOL_WHITE,   VCOL_YELLOW  }},
};

static const CPal (* const frame_pal[5])[4] = { f0c, f1c, f2c, f3c, f4c };

// ---------------------------------------------------------------
// render — compute fractal, write 2-bit pixel values to bitmap.
// Runs under MMAP_NO_ROM so MC_HIRES ($E000) is accessible as RAM.
// ---------------------------------------------------------------
static void render(const Frame *f)
{
    char  is_julia = (f->julia_cr != 0 || f->julia_ci != 0);
    int   py;

    memset(MC_HIRES, 0, 8000);

    for (py = 0; py < 200; py++) {
        int ci_or_yz = f->imag_min + py * (int)f->step_i;
        int px;
        char *row_ptr = MC_HIRES + ((unsigned)py & ~7u) * 40u + ((unsigned)py & 7u);

        for (px = 0; px < 160; px++) {
            int  cv = f->real_min + px * (int)f->step_r;
            int  zr, zi, c_r, c_i;
            char iter;

            if (is_julia) {
                zr = cv;  zi = ci_or_yz;
                c_r = f->julia_cr;  c_i = f->julia_ci;
            } else {
                zr = 0;   zi = 0;
                c_r = cv; c_i = ci_or_yz;
            }

            for (iter = 0; iter < MAXITER; iter++) {
                unsigned long zr2 = lsqr4f12s(zr);
                unsigned long zi2 = lsqr4f12s(zi);
                if (zr2 + zi2 >= ESCAPE_4F12) break;
                int nzr = (int)(((zr2 - zi2) >> 12)) + c_r;
                zi  = 2 * lmul4f12s(zr, zi) + c_i;
                zr  = nzr;
            }

            char val = (iter >= MAXITER) ? (char)0 : iter_to_value(iter);

            {
                char *dp   = row_ptr + ((unsigned)px >> 2) * 8u;
                char  mask = (char)(0xC0 >> (((unsigned)px & 3u) << 1));
                char  pat  = cbytes[(unsigned char)val];
                *dp = (*dp & ~mask) | (pat & mask);
            }
        }
    }
}

// ---------------------------------------------------------------
// colorize_standard — write c1/c2 to screen RAM and c3 to color RAM.
//
// Runs under MMAP_NO_ROM: $C000 (screen), $E000 (bitmap), and
// $D800 (color RAM via I/O) are all accessible.  No SEI needed.
//
// Resolution: per 4×8-pixel cell (standard MC hardware limit).
// Colour chosen by diagonal zone (cx+cy) and content_type derived
// from the pixel distribution within each cell.
// ---------------------------------------------------------------
static void colorize_standard(const CPal pal[4][4])
{
    char *scr  = MC_SCREEN;
    char *cram = MC_CRAM;
    char cy, cx;

    for (cy = 0; cy < 25; cy++) {
        char *cell_base = MC_HIRES + (unsigned)cy * 320u;
        for (cx = 0; cx < 40; cx++) {
            char *cell = cell_base + (unsigned)cx * 8u;
            char n0=0, n1=0, n2=0, n3=0, t, v;
            for (t = 0; t < 8; t++) {
                char b = cell[t];
                v=(char)((b>>6)&3); if(v==0)n0++;else if(v==1)n1++;else if(v==2)n2++;else n3++;
                v=(char)((b>>4)&3); if(v==0)n0++;else if(v==1)n1++;else if(v==2)n2++;else n3++;
                v=(char)((b>>2)&3); if(v==0)n0++;else if(v==1)n1++;else if(v==2)n2++;else n3++;
                v=(char)( b    &3); if(v==0)n0++;else if(v==1)n1++;else if(v==2)n2++;else n3++;
            }
            char has_interior = (n0 > 0);
            char has_exterior = (char)(n1 + n2 + n3 > 0);
            char content_type;
            if (has_interior && has_exterior) { content_type = 3; }
            else if (!has_exterior) { content_type = 0; }
            else {
                char dom = 1;
                if (n2 > n1) dom = 2;
                if (n3 > n2 && n3 > n1) dom = 3;
                content_type = (char)(dom - 1);
            }
            char zone = (char)(((unsigned)((unsigned char)cx + (unsigned char)cy) * 4u) / 65u);
            if (zone > 3) zone = 3;
            const CPal *p = &pal[zone][content_type];
            *scr++ = (char)((p->c1 << 4) | p->c2);
            *cram++ = p->c3;
        }
    }
}

// ---------------------------------------------------------------
// display_wait — hold the frame on screen for `secs` seconds.
// Uses CIA1 TOD timer; VIC IRQs remain enabled so the modplay
// $0314 chain (keyboard scan) continues to function.
// ---------------------------------------------------------------
static void display_wait(char secs)
{
    cia1.tods = 0;
    cia1.todt = 0;
    while (cia1.tods < secs) ;
}

// ---------------------------------------------------------------
// mc_init — set up standard MC mode in VIC bank 3.
// Runs under MMAP_NO_ROM so $E000 bitmap and $D800 color RAM
// are both accessible.  VIC IRQs are NOT disabled here, keeping
// the modplay $0314 handler and keyboard scan alive.
// ---------------------------------------------------------------
static void mc_init(void)
{
    mmap_set(MMAP_NO_ROM);

    memset(MC_SCREEN, 0, 1000);
    memset(MC_HIRES,  0, 8000);
    memset(MC_CRAM,   VCOL_WHITE, 1000);

    // VIC bank 3 already selected (CIA2 default / gears handoff).
    // Screen at $C000, bitmap at $E000 → $D018 = $08.
    vic_setmode(VICM_HIRES_MC, MC_SCREEN, MC_HIRES);
    vic.color_back   = VCOL_BLACK;
    vic.color_border = VCOL_BLACK;
}

// ---------------------------------------------------------------
// mc_done — restore text mode and memory map.
// ---------------------------------------------------------------
static void mc_done(void)
{
    mmap_set(MMAP_NO_BASIC);
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
    vic.color_border = 0;
    vic.color_back   = 0;
}

// ---------------------------------------------------------------
// mandel_run
// ---------------------------------------------------------------
// Best single frame: seahorse medium (frames[1], f1c palette).
// Shows the full seahorse valley with dense boundary complexity.
#define MANDEL_FRAME  1

void mandel_run(void)
{
    const Frame  *fr  = &frames[MANDEL_FRAME];
    const CPal  (*pal)[4] = frame_pal[MANDEL_FRAME];

    turbo_fast();
    mc_init();
    render(fr);
    colorize_standard(pal);
    display_wait(5);
    mc_done();
    // turbo_slow() removed — full demo stays at 64 MHz; caller handles shutdown
}
