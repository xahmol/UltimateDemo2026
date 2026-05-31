/*****************************************************************
Ultimate 64 MOD Player

ProTracker / compatible 4-channel .MOD playback engine.
Samples are read directly from REU via DMA.
Timing is driven by CIA1 timer A (takes over from KERNAL).
Output goes to Ultimate Audio channels 0–3.
Channels 4–6 are left free for sound effects.

Supported formats:  M.K.  M!K!  4CHN  FLT4  (31-sample)
                    15-sample format auto-detected.

Firmware prerequisite: Ultimate Audio must be mapped at $DF20.
Load a MOD to REU first (e.g. with modplay_load), then call
modplay_init → modplay_start.
******************************************************************/

#ifndef _MODPLAY_H_
#define _MODPLAY_H_

// ---------------------------------------------------------------
// MOD file constants
// ---------------------------------------------------------------

#define MOD_MAX_SAMPLES     31
#define MOD_ROWS_PER_PATTERN 64
#define MOD_CHANNELS         4
#define MOD_BYTES_PER_NOTE   4   // bytes per note cell in pattern
#define MOD_BYTES_PER_ROW    (MOD_CHANNELS * MOD_BYTES_PER_NOTE) // 16

// Header offsets within the MOD file (31-sample format)
#define MOD_HDR_TITLE        0     // 20 bytes
#define MOD_HDR_SAMPLES      20    // 31 × 30 bytes
#define MOD_HDR_SONGLEN      950   // 1 byte
#define MOD_HDR_PADDING      951   // 1 byte (ignored)
#define MOD_HDR_ORDERTBL     952   // 128 bytes
#define MOD_HDR_MAGIC        1080  // 4 bytes ("M.K." etc.)
#define MOD_HDR_PATTERNS     1084  // pattern data starts here

// Per-sample header offsets (30 bytes per sample slot)
#define MSMP_NAME            0    // 22 bytes
#define MSMP_LEN_HI          22   // sample length in words, big-endian HI
#define MSMP_LEN_LO          23   // sample length in words, big-endian LO
#define MSMP_FINETUNE        24   // signed nibble finetune
#define MSMP_VOLUME          25   // default volume 0–64
#define MSMP_REPA_HI         26   // repeat start in words, big-endian HI
#define MSMP_REPA_LO         27
#define MSMP_REPLEN_HI       28   // repeat length in words, big-endian HI
#define MSMP_REPLEN_LO       29

// ProTracker period bounds
#define MOD_PERIOD_MAX       856
#define MOD_PERIOD_MIN       113

// Default playback parameters
#define MOD_DEFAULT_BPM      125
#define MOD_DEFAULT_TICKS    6

// ProTracker panning for UA (LRRL hard panning)
#define MOD_PAN_LEFT         0x00
#define MOD_PAN_RIGHT        0xFF
#define MOD_PAN_CENTRE       0x80

// ---------------------------------------------------------------
// Effect numbers (upper nibble of effect byte)
// ---------------------------------------------------------------
#define FX_ARPEGGIO          0x0
#define FX_PORTA_UP          0x1
#define FX_PORTA_DOWN        0x2
#define FX_PORTA_TO_NOTE     0x3
#define FX_VIBRATO           0x4
#define FX_PORTA_VOLSLIDE    0x5
#define FX_VIB_VOLSLIDE      0x6
#define FX_TREMOLO           0x7
#define FX_SET_PAN           0x8
#define FX_SAMPLE_OFFSET     0x9
#define FX_VOLUME_SLIDE      0xA
#define FX_JUMP_ORDER        0xB
#define FX_SET_VOLUME        0xC
#define FX_PATTERN_BREAK     0xD
#define FX_EXTENDED          0xE
#define FX_SET_SPEED         0xF

// Extended (E) effect sub-commands (lower nibble of effect param)
#define EFX_FINE_PORTA_UP    0x1
#define EFX_FINE_PORTA_DOWN  0x2
#define EFX_SET_GLISSANDO    0x3
#define EFX_SET_VIB_WAVE     0x4
#define EFX_SET_FINETUNE     0x5
#define EFX_PATTERN_LOOP     0x6
#define EFX_SET_TRM_WAVE     0x7
#define EFX_NOTE_RETRIG      0x9
#define EFX_FINE_VOL_UP      0xA
#define EFX_FINE_VOL_DOWN    0xB
#define EFX_CUT_NOTE         0xC
#define EFX_NOTE_DELAY       0xD
#define EFX_PATTERN_DELAY    0xE

// ---------------------------------------------------------------
// Per-sample information (populated by modplay_init)
// ---------------------------------------------------------------
typedef struct {
    unsigned long reu_addr;   // REU address of sample data
    unsigned long length;     // byte length
    unsigned long loop_a;     // loop start (bytes from reu_addr)
    unsigned long loop_b;     // loop end   (bytes from reu_addr)
    unsigned char has_loop;   // 1 = looped sample
    unsigned char volume;     // default volume 0–64
    unsigned char finetune;   // raw nibble 0–15
} mod_sample_t;

// ---------------------------------------------------------------
// Per-channel playback state
// ---------------------------------------------------------------
typedef struct {
    // Current note/sample
    unsigned char  sample_num;    // 1-based; 0 = no sample
    unsigned       period;        // current Amiga period
    unsigned       rate;          // UA rate = period * 12500 / 7094
    unsigned char  volume;        // current channel volume 0–64
    unsigned char  pan;           // UA panning byte

    // Effect state
    unsigned char  effect;        // current effect number
    unsigned char  eparam;        // effect parameter byte

    // Portamento
    unsigned       porta_target;  // target rate for effect 3
    unsigned char  porta_speed;   // portamento speed

    // Vibrato
    unsigned char  vib_wave;      // waveform (0=sine,1=ramp,2=square)
    unsigned char  vib_pos;       // 0–63 table position
    unsigned char  vib_depth;     // amplitude (lower nibble of param)
    unsigned char  vib_speed;     // speed     (upper nibble of param)

    // Tremolo
    unsigned char  trm_wave;
    unsigned char  trm_pos;
    unsigned char  trm_depth;
    unsigned char  trm_speed;
    unsigned char  trm_basvol;    // volume before tremolo modulation

    // Volume slide saved value
    signed char    volslide;      // signed: + = up, - = down

    // Arpeggio
    unsigned char  arp_counter;
    unsigned char  last_note;     // last played note index (1-based)

    // Pattern loop (E6)
    unsigned char  loop_row;      // row to loop back to
    unsigned char  loop_count;

    // Note retrigger / cut / delay
    unsigned char  tick_stop;     // target tick
    unsigned char  tick_cur;      // tick counter
    unsigned char  cmd_backup;    // saved command flags

    // UA hardware state tracking
    unsigned char  ua_vol;        // what was last written to UA vol
    unsigned       ua_rate;       // what was last written to UA rate
    unsigned char  needs_start;   // 1 = (re)trigger the UA channel this tick
    unsigned char  needs_loop;    // 1 = looped trigger
    unsigned long  smp_start;     // REU start for current sample
    unsigned long  smp_length;
    unsigned long  smp_loop_a;
    unsigned long  smp_loop_b;
} mod_channel_t;

// ---------------------------------------------------------------
// Global player state (accessible for display)
// ---------------------------------------------------------------
typedef struct {
    unsigned long  reu_base;          // REU address where MOD was loaded
    unsigned char  song_length;       // number of order entries
    unsigned char  num_samples;       // 15 or 31
    unsigned char  num_patterns;      // highest pattern index + 1
    unsigned char  order_table[128];  // pattern play order

    unsigned char  order_pos;         // current position in order_table
    unsigned char  pattern_num;       // current pattern (= order_table[order_pos])
    unsigned char  row;               // current row within pattern (0–63)
    unsigned char  tick;              // current tick within row (0 = new row)
    unsigned char  ticks_per_row;     // default 6
    unsigned char  bpm;               // beats per minute (default 125)
    unsigned char  pattern_delay;     // EE effect delay counter

    unsigned char  master_volume;     // global scale 0–255 (default 200)
    unsigned char  stereo;            // 1=LRRL hard pan, 0=mono centre

    unsigned char  active;            // 1 while playing
    unsigned char  loop_song;         // 1 = loop when song ends

    unsigned char  skip_row_advance;  // set by B/D effects
    unsigned char  next_order;        // for B effect
    unsigned char  next_row;          // for D effect

    mod_sample_t   sample[MOD_MAX_SAMPLES];
    mod_channel_t  channel[MOD_CHANNELS];
} mod_player_t;

extern mod_player_t modplay;   // single global instance

// ---------------------------------------------------------------
// Function prototypes
// ---------------------------------------------------------------

char modplay_load(char *filename, unsigned long reu_addr);
/*
  Load `filename` from the Ultimate filesystem directly into REU
  at `reu_addr` using the UCI DOS interface (uii_load_reu).

  Returns 1 on success, 0 on failure (check uii_status for error).

  Prerequisites:
    - uii_detect() must have returned 1.
    - REU must be present and at least as large as the MOD file.
    - Call uii_change_dir() first to navigate to the MOD location.

  Example:
    uii_change_dir("/usb0/mods/");
    modplay_load("mysong.mod", 0x010000);
    modplay_init(0x010000);
*/

char modplay_init(unsigned long reu_addr);
/*
  Parse the MOD file header from REU at `reu_addr`.
  Builds sample address table, reads order table, prepares player.

  Returns 1 if the MOD format is supported (M.K./4CHN/FLT4/M!K!
  or 15-sample format), 0 if unrecognised.

  Must be called before modplay_start().
  Does NOT start playback.
*/

void modplay_start(void);
/*
  Begin playback from the beginning of the song.
  Programs CIA1 Timer A for BPM-accurate ticks, saves the current
  $0314/$0315 vector, and installs modplay_irq there.  The handler
  chains to the saved vector on exit, so keyboard scan and any other
  $0314 user (rirq etc.) continue to work.
  Requires KERNAL ROM mapped ($01 bit 1 set).
*/

void modplay_stop(void);
/*
  Stop playback immediately.  Silences all 4 MOD channels.
  Restores CIA1 timer A and the previous $0314/$0315 vector.
*/

void modplay_pause(void);
/*
  Suspend playback without resetting position.
  Silences channels; CIA timer continues but tick is ignored.
*/

void modplay_resume(void);
/*
  Resume playback from where pause() was called.
*/

void modplay_set_master_volume(unsigned char vol);
/*
  Set the global volume scalar (0–255, default 200).
  Applied to all channels every tick.
*/

void modplay_set_stereo(char enable);
/*
  enable=1 : ProTracker hard panning (LRRL).
  enable=0 : all channels centred (mono-compatible).
  Applied on the next note trigger.
*/

unsigned char modplay_get_order(void);
unsigned char modplay_get_pattern(void);
unsigned char modplay_get_row(void);
unsigned char modplay_get_bpm(void);
unsigned char modplay_is_playing(void);

__interrupt void modplay_tick(void);
/*
  Called from modplay_irq (the __asm $0314 handler) every tick.
  __interrupt: Oscar64 saves/restores $03-$06,$0D-$13,$1B-$1E,$43-$51.
  modplay_irq additionally saves gaps $07-$0C,$14-$1A,$1F-$42 so the
  full Oscar64 ZP region $03-$51 is protected.  Do NOT call from main.
*/

#pragma compile("modplay.c")

#endif
