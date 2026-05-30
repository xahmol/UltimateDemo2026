#ifndef GEARS_H
#define GEARS_H

// ---------------------------------------------------------------
// Gear demo — two meshing gears in hires mode with turbo speed ramp.
// ---------------------------------------------------------------

void gears_run(void);
/*
  Run the gear demo.  Enters full-screen hires mode, ramps the CPU
  from 1 MHz to max speed while displaying two connected gears that
  rotate progressively faster.  Returns after the 64 MHz hold with
  hires mode still active for mandel_run() to take over.
*/

#pragma compile("gears.c")

#endif
