#ifndef MANDEL_H
#define MANDEL_H

void mandel_run(void);
/*
  Render the seahorse-medium Mandelbrot frame in MC hires mode at 64 MHz.
  Holds for 5 seconds, then restores text mode.
  Turbo stays at 64 MHz on return (caller handles shutdown).
*/

#pragma compile("mandel.c")

#endif
