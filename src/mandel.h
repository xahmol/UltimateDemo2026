#ifndef MANDEL_H
#define MANDEL_H

void mandel_run(void);
/*
  Render a Mandelbrot fractal in multicolor hires mode at 64 MHz.
  Three zoom levels; ~1.5 s render per level.  Restores text mode
  and 1 MHz on return.
*/

#pragma compile("mandel.c")

#endif
