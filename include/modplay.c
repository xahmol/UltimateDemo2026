/*****************************************************************
Ultimate 64 MOD Player — implementation
See modplay.h for API documentation.

Reference: ModPlayer_16k by 6510nl (assembly, used as algorithm
reference for period/timer maths and effect behaviour).
******************************************************************/

#include <string.h>
#include <c64/cia.h>
#include "audio.h"
#include "modplay.h"
#include "ultimate_common_lib.h"
#include "ultimate_dos_lib.h"

// ---------------------------------------------------------------
// Global player state
// ---------------------------------------------------------------
mod_player_t modplay;

// Scratch buffer for reading one pattern row (16 bytes) from REU
static unsigned char mod_row_buf[MOD_BYTES_PER_ROW];

// Saved previous IRQ vector ($0314/$0315)
static unsigned char mod_saved_irq[2];

// Paused flag (separate from active so we can resume cleanly)
static unsigned char mod_paused;

// ProTracker vibrato sine table (32 entries, quarter-wave)
static const unsigned char vib_sine[32] = {
    0, 24, 49, 74, 97, 120, 141, 161,
    180, 197, 212, 224, 235, 244, 250, 253,
    255, 253, 250, 244, 235, 224, 212, 197,
    180, 161, 141, 120, 97, 74, 49, 24};

// ---------------------------------------------------------------
// Internal: period ↔ UA rate conversion
// rate = amiga_period * 12500 / 7094   (PAL Amiga reference)
// ---------------------------------------------------------------
static unsigned period_to_rate(unsigned period)
{
    if (period == 0)
        return 0;
    return (unsigned)((unsigned long)period * 12500UL / 7094UL);
}

// Signed finetune nibble (raw nibble 0–15 → signed -8..+7)
static signed char finetune_signed(unsigned char raw)
{
    if (raw >= 8)
        return (signed char)((signed char)raw - 16);
    return (signed char)raw;
}

// Period adjusted for finetune.
// One finetune step ≈ 1/8 semitone. One semitone ≈ period * 0.0595.
// Per step: period * (1 + signed_ft * 0.00745)
static unsigned period_finetune(unsigned period, unsigned char finetune_raw)
{
    signed char ft = finetune_signed(finetune_raw);
    if (ft == 0 || period == 0)
        return period;
    // delta ≈ period * |ft| * 745 / 100000
    long delta = (long)period * (long)(ft < 0 ? -ft : ft) * 745L / 100000L;
    if (ft > 0)
        return (unsigned)(period - (unsigned)delta); // sharper = lower period
    else
        return (unsigned)(period + (unsigned)delta); // flatter = higher period
}

// ---------------------------------------------------------------
// Internal: BPM → CIA1 timer value  (PAL)
// timer = 2_463_120 / BPM
// ---------------------------------------------------------------
static unsigned bpm_to_timer(unsigned char bpm)
{
    if (bpm == 0)
        bpm = MOD_DEFAULT_BPM;
    return (unsigned)(2463120UL / (unsigned long)bpm);
}

// ---------------------------------------------------------------
// Internal: update a channel's UA hardware registers
// ---------------------------------------------------------------
static void ua_update_channel(char ch)
{
    mod_channel_t *c = &modplay.channel[ch];
    unsigned char ua_vol;

    // Scale volume: channel vol (0–64) × master (0–255) / 64
    ua_vol = (unsigned char)((unsigned)c->volume * (unsigned)modplay.master_volume / 64);

    if (c->needs_start)
    {
        c->needs_start = 0;
        if (c->needs_loop)
        {
            audio_channel_loop(ch,
                               c->smp_start, c->smp_length,
                               c->smp_loop_a, c->smp_loop_b,
                               c->rate, ua_vol, c->pan);
        }
        else
        {
            audio_channel_play(ch,
                               c->smp_start, c->smp_length,
                               c->rate, ua_vol, c->pan);
        }
        c->ua_vol = ua_vol;
        c->ua_rate = c->rate;
    }
    else
    {
        // Just update volume and/or rate in-place
        if (ua_vol != c->ua_vol)
        {
            audio_channel_set_volume(ch, ua_vol);
            c->ua_vol = ua_vol;
        }
        if (c->rate != c->ua_rate)
        {
            audio_channel_set_rate(ch, c->rate);
            c->ua_rate = c->rate;
        }
    }
}

// ---------------------------------------------------------------
// Internal: clamp volume to 0–64
// ---------------------------------------------------------------
static unsigned char clamp_vol(signed char v)
{
    if (v < 0)
        return 0;
    if (v > 64)
        return 64;
    return (unsigned char)v;
}

// ---------------------------------------------------------------
// Internal: clamp period to ProTracker bounds
// ---------------------------------------------------------------
static unsigned clamp_period(unsigned p)
{
    if (p < MOD_PERIOD_MIN)
        return MOD_PERIOD_MIN;
    if (p > MOD_PERIOD_MAX)
        return MOD_PERIOD_MAX;
    return p;
}

// ---------------------------------------------------------------
// Internal: vibrato/tremolo waveform table lookup
// ---------------------------------------------------------------
static unsigned char wave_value(unsigned char wave, unsigned char pos)
{
    unsigned char idx = pos & 0x1F;
    switch (wave & 0x03)
    {
    case 0:
        return vib_sine[idx]; // sine
    case 1:
        return (unsigned char)(255 - idx * 8); // ramp down
    case 2:
        return 255; // square
    default:
        return (unsigned char)(idx * 8); // ramp up (random approx)
    }
}

// ---------------------------------------------------------------
// Internal: load note cell from row buffer
// ---------------------------------------------------------------
typedef struct
{
    unsigned char sample_num; // 1-based; 0 = no sample
    unsigned period;          // Amiga period; 0 = no note
    unsigned char effect;
    unsigned char eparam;
} note_cell_t;

static void parse_cell(unsigned char *buf4, note_cell_t *n)
{
    n->sample_num = (buf4[0] & 0xF0) | ((buf4[2] >> 4) & 0x0F);
    n->period = (((unsigned)(buf4[0] & 0x0F)) << 8) | (unsigned)buf4[1];
    n->effect = buf4[2] & 0x0F;
    n->eparam = buf4[3];
}

// ---------------------------------------------------------------
// Internal: apply a new note to a channel on tick 0
// ---------------------------------------------------------------
static void apply_note(char ch_idx, note_cell_t *n)
{
    mod_channel_t *c = &modplay.channel[ch_idx];
    unsigned char do_trigger = 0;

    // New sample → load its parameters into channel state
    if (n->sample_num >= 1 && n->sample_num <= modplay.num_samples)
    {
        mod_sample_t *s = &modplay.sample[n->sample_num - 1];
        c->sample_num = n->sample_num;
        c->volume = s->volume;
        c->smp_start = s->reu_addr;
        c->smp_length = s->length;
        c->smp_loop_a = s->reu_addr + s->loop_a;
        c->smp_loop_b = s->reu_addr + s->loop_b;
        c->needs_loop = s->has_loop;
    }

    // New period → set rate (unless porta-to-note effect)
    if (n->period != 0 && n->effect != FX_PORTA_TO_NOTE)
    {
        unsigned char ft = (c->sample_num >= 1) ? modplay.sample[c->sample_num - 1].finetune : 0;
        unsigned adj = period_finetune(n->period, ft);
        c->period = adj;
        c->rate = period_to_rate(adj);
        c->last_note = n->sample_num; // store for arpeggio
        do_trigger = 1;
    }

    if (do_trigger && n->effect != FX_PORTA_TO_NOTE)
    {
        c->needs_start = 1;
        c->arp_counter = 0;
        c->vib_pos = 0;
        c->trm_pos = 0;
    }

    // Porta-to-note: save target rate, don't retrigger
    if (n->effect == FX_PORTA_TO_NOTE && n->period != 0)
    {
        unsigned char ft = (c->sample_num >= 1) ? modplay.sample[c->sample_num - 1].finetune : 0;
        c->porta_target = period_to_rate(period_finetune(n->period, ft));
    }
}

// ---------------------------------------------------------------
// Internal: row effects (tick 0)
// ---------------------------------------------------------------
static void fx_row(char ch_idx)
{
    mod_channel_t *c = &modplay.channel[ch_idx];
    unsigned char hi = c->eparam >> 4;
    unsigned char lo = c->eparam & 0x0F;

    switch (c->effect)
    {
    case FX_ARPEGGIO:
        // Arpeggio is driven on ticks; reset counter on tick 0
        c->arp_counter = 0;
        break;

    case FX_PORTA_UP:
    case FX_PORTA_DOWN:
        if (c->eparam)
            c->porta_speed = c->eparam;
        break;

    case FX_PORTA_TO_NOTE:
        if (c->eparam)
            c->porta_speed = c->eparam;
        c->needs_start = 0; // don't retrigger
        break;

    case FX_VIBRATO:
        if (lo)
            c->vib_depth = lo;
        if (hi)
            c->vib_speed = hi;
        break;

    case FX_PORTA_VOLSLIDE:
        // Volume-slide amount (porta happens in tick handler)
        c->volslide = hi ? (signed char)hi : -(signed char)lo;
        c->needs_start = 0;
        break;

    case FX_VIB_VOLSLIDE:
        c->volslide = hi ? (signed char)hi : -(signed char)lo;
        break;

    case FX_TREMOLO:
        if (lo)
            c->trm_depth = lo;
        if (hi)
            c->trm_speed = hi;
        c->trm_basvol = c->volume;
        break;

    case FX_SET_PAN:
        // 8xx: pan = (xx >> 4) mapped to 0–255
        c->pan = (unsigned char)((unsigned)hi * 17);
        break;

    case FX_SAMPLE_OFFSET:
        // 9xx: skip first xx * 256 bytes of sample
        if (c->eparam && c->smp_length > 0)
        {
            unsigned long skip = (unsigned long)c->eparam << 8;
            if (skip < c->smp_length)
            {
                c->smp_start += skip;
                c->smp_length -= skip;
            }
        }
        break;

    case FX_VOLUME_SLIDE:
        c->volslide = hi ? (signed char)hi : -(signed char)lo;
        break;

    case FX_JUMP_ORDER:
        modplay.skip_row_advance = 1;
        modplay.next_order = c->eparam;
        modplay.next_row = 0;
        break;

    case FX_SET_VOLUME:
        c->volume = (c->eparam <= 64) ? c->eparam : 64;
        break;

    case FX_PATTERN_BREAK:
    {
        // Dxy: break to row = x*10 + y in next pattern
        unsigned char br = (unsigned char)(hi * 10 + lo);
        modplay.skip_row_advance = 1;
        modplay.next_order = modplay.order_pos + 1;
        modplay.next_row = (br < MOD_ROWS_PER_PATTERN) ? br : 0;
        break;
    }

    case FX_SET_SPEED:
        if (c->eparam == 0)
            break;
        if (c->eparam < 0x20)
            modplay.ticks_per_row = c->eparam;
        else
        {
            modplay.bpm = c->eparam;
            // Reprogram CIA timer on next tick boundary
            // (timer is reprogrammed at start of tick 0)
        }
        break;

    case FX_EXTENDED:
        switch (hi)
        {
        case EFX_FINE_PORTA_UP:
            if (c->period > MOD_PERIOD_MIN)
                c->period = clamp_period(c->period - (unsigned)lo);
            c->rate = period_to_rate(c->period);
            break;
        case EFX_FINE_PORTA_DOWN:
            c->period = clamp_period(c->period + (unsigned)lo);
            c->rate = period_to_rate(c->period);
            break;
        case EFX_SET_GLISSANDO:
            // Glissando mode flag in bit 1 of a spare variable
            // (simplified: ignored in this version)
            break;
        case EFX_SET_VIB_WAVE:
            c->vib_wave = lo & 0x07;
            break;
        case EFX_SET_TRM_WAVE:
            c->trm_wave = lo & 0x07;
            break;
        case EFX_SET_FINETUNE:
            if (c->sample_num >= 1 && c->sample_num <= modplay.num_samples)
                modplay.sample[c->sample_num - 1].finetune = lo;
            break;
        case EFX_PATTERN_LOOP:
            if (lo == 0)
            {
                c->loop_row = modplay.row;
            }
            else
            {
                if (c->loop_count == 0)
                {
                    c->loop_count = lo;
                    modplay.skip_row_advance = 1;
                    modplay.next_order = modplay.order_pos;
                    modplay.next_row = c->loop_row;
                }
                else
                {
                    c->loop_count--;
                    if (c->loop_count)
                    {
                        modplay.skip_row_advance = 1;
                        modplay.next_order = modplay.order_pos;
                        modplay.next_row = c->loop_row;
                    }
                }
            }
            break;
        case EFX_NOTE_RETRIG:
            c->tick_stop = lo;
            c->tick_cur = 0;
            c->cmd_backup = c->needs_start;
            if (lo)
                c->needs_start = 0;
            break;
        case EFX_FINE_VOL_UP:
            c->volume = clamp_vol((signed char)c->volume + (signed char)lo);
            break;
        case EFX_FINE_VOL_DOWN:
            c->volume = clamp_vol((signed char)c->volume - (signed char)lo);
            break;
        case EFX_CUT_NOTE:
            c->tick_stop = lo;
            c->tick_cur = 0;
            break;
        case EFX_NOTE_DELAY:
            c->tick_stop = lo;
            c->tick_cur = 0;
            c->cmd_backup = c->needs_start;
            c->needs_start = 0; // delay trigger until tick lo
            break;
        case EFX_PATTERN_DELAY:
            modplay.pattern_delay = lo;
            break;
        }
        break;
    }
}

// ---------------------------------------------------------------
// Internal: tick (n > 0) effects
// ---------------------------------------------------------------
static void fx_tick(char ch_idx)
{
    mod_channel_t *c = &modplay.channel[ch_idx];
    unsigned char tick = modplay.tick;

    switch (c->effect)
    {

    case FX_ARPEGGIO:
        if (c->eparam && c->sample_num)
        {
            unsigned char note;
            unsigned char arp_step = c->arp_counter % 3;
            if (arp_step == 0)
                note = c->last_note;
            else if (arp_step == 1)
                note = c->last_note + (c->eparam >> 4);
            else
                note = c->last_note + (c->eparam & 0x0F);
            // Map note offset to period adjustment (semitone steps)
            // Simple: multiply rate by 2^(note_offset/12)
            // Approximate: skip for now, use period table offset
            c->arp_counter++;
        }
        break;

    case FX_PORTA_UP:
        if (c->period > MOD_PERIOD_MIN)
        {
            c->period = clamp_period(
                c->period - (unsigned)c->porta_speed);
            c->rate = period_to_rate(c->period);
        }
        break;

    case FX_PORTA_DOWN:
        c->period = clamp_period(c->period + (unsigned)c->porta_speed);
        c->rate = period_to_rate(c->period);
        break;

    case FX_PORTA_TO_NOTE:
    case FX_PORTA_VOLSLIDE:
        // Slide rate toward target
        if (c->porta_target && c->rate != c->porta_target)
        {
            if (c->rate < c->porta_target)
            {
                c->rate += c->porta_speed;
                if (c->rate > c->porta_target)
                    c->rate = c->porta_target;
            }
            else
            {
                if (c->rate > c->porta_speed)
                    c->rate -= c->porta_speed;
                else
                    c->rate = c->porta_target;
                if (c->rate < c->porta_target)
                    c->rate = c->porta_target;
            }
        }
        if (c->effect == FX_PORTA_VOLSLIDE)
        {
            c->volume = clamp_vol(
                (signed char)c->volume + c->volslide);
        }
        break;

    case FX_VIBRATO:
    case FX_VIB_VOLSLIDE:
    {
        unsigned char val = wave_value(c->vib_wave, c->vib_pos);
        unsigned char half = c->vib_pos & 0x10;
        unsigned delta;
        // delta = (val * depth) >> 7
        delta = (unsigned)((unsigned)val * c->vib_depth >> 7);
        if (!half)
            c->rate = period_to_rate(
                clamp_period(c->period + delta));
        else
            c->rate = period_to_rate(
                clamp_period(c->period - delta));
        c->vib_pos = (c->vib_pos + c->vib_speed) & 0x3F;
        if (c->effect == FX_VIB_VOLSLIDE)
            c->volume = clamp_vol(
                (signed char)c->volume + c->volslide);
        break;
    }

    case FX_TREMOLO:
    {
        unsigned char val = wave_value(c->trm_wave, c->trm_pos);
        unsigned char half = c->trm_pos & 0x10;
        unsigned char delta = (unsigned char)((unsigned)val * c->trm_depth >> 6);
        if (!half)
            c->volume = clamp_vol(
                (signed char)c->trm_basvol + (signed char)delta);
        else
            c->volume = clamp_vol(
                (signed char)c->trm_basvol - (signed char)delta);
        c->trm_pos = (c->trm_pos + c->trm_speed) & 0x3F;
        break;
    }

    case FX_VOLUME_SLIDE:
        c->volume = clamp_vol(
            (signed char)c->volume + c->volslide);
        break;

    case FX_EXTENDED:
    {
        unsigned char sub = (c->eparam >> 4);
        unsigned char lo = (c->eparam & 0x0F);
        switch (sub)
        {
        case EFX_NOTE_RETRIG:
            c->tick_cur++;
            if (c->tick_cur >= c->tick_stop)
            {
                c->tick_cur = 0;
                c->needs_start = 1;
            }
            break;
        case EFX_CUT_NOTE:
            c->tick_cur++;
            if (c->tick_cur >= c->tick_stop)
            {
                c->volume = 0;
            }
            break;
        case EFX_NOTE_DELAY:
            c->tick_cur++;
            if (c->tick_cur == c->tick_stop)
            {
                c->needs_start = 1;
            }
            break;
        }
        break;
    }
    }
}

// ---------------------------------------------------------------
// Internal: load and process one pattern row (tick 0)
// ---------------------------------------------------------------
static void process_new_row(void)
{
    unsigned long row_reu;
    char ch;
    note_cell_t note;

    // Compute REU address of current row's data
    // row_reu = reu_base + 1084 + pattern_num * 1024 + row * 16
    row_reu = modplay.reu_base + MOD_HDR_PATTERNS + (unsigned long)modplay.pattern_num * 1024UL + (unsigned long)modplay.row * MOD_BYTES_PER_ROW;

    // Fetch all 16 bytes of this row into C64 RAM
    reu_fetch(mod_row_buf, row_reu, MOD_BYTES_PER_ROW);

    // Clear skip flags
    modplay.skip_row_advance = 0;
    modplay.next_order = 0xFF;
    modplay.next_row = 0;

    // Apply notes for each channel
    for (ch = 0; ch < MOD_CHANNELS; ch++)
    {
        parse_cell(&mod_row_buf[ch * MOD_BYTES_PER_NOTE], &note);
        modplay.channel[ch].effect = note.effect;
        modplay.channel[ch].eparam = note.eparam;
        apply_note(ch, &note);
        fx_row(ch); // row-0 effect setup
    }
}

// ---------------------------------------------------------------
// Internal: advance to next row / pattern / order
// ---------------------------------------------------------------
static void advance_position(void)
{
    if (modplay.pattern_delay > 0)
    {
        modplay.pattern_delay--;
        return;
    }

    if (modplay.skip_row_advance)
    {
        // B or D effect set next position
        if (modplay.next_order != 0xFF)
            modplay.order_pos = modplay.next_order;
        if (modplay.order_pos >= modplay.song_length)
        {
            if (modplay.loop_song)
                modplay.order_pos = 0;
            else
            {
                modplay.active = 0;
                return;
            }
        }
        modplay.pattern_num = modplay.order_table[modplay.order_pos];
        modplay.row = modplay.next_row;
        return;
    }

    modplay.row++;
    if (modplay.row >= MOD_ROWS_PER_PATTERN)
    {
        modplay.row = 0;
        modplay.order_pos++;
        if (modplay.order_pos >= modplay.song_length)
        {
            if (modplay.loop_song)
                modplay.order_pos = 0;
            else
            {
                modplay.active = 0;
                return;
            }
        }
        modplay.pattern_num = modplay.order_table[modplay.order_pos];
    }
}

// ---------------------------------------------------------------
// modplay_tick  — called from CIA1 IRQ every tick.
// __interrupt: Oscar64 allocates a separate ZP region for this
// function and its entire call tree, so main-code ZP is never
// touched regardless of what callees do.
// ---------------------------------------------------------------
__interrupt void modplay_tick(void)
{
    char ch;

    if (!modplay.active || mod_paused)
        return;

    if (modplay.tick == 0)
    {
        // --- New row: reprogram CIA if BPM changed ---
        unsigned timer_val = bpm_to_timer(modplay.bpm);
        cia1.ta = timer_val;

        // Load and process the row data
        process_new_row();
        modplay.tick = modplay.ticks_per_row;
    }
    else
    {
        // --- Ticks 1..N: apply running effects ---
        for (ch = 0; ch < MOD_CHANNELS; ch++)
            fx_tick(ch);
    }

    modplay.tick--;

    // Update UA hardware for each channel
    for (ch = 0; ch < MOD_CHANNELS; ch++)
        ua_update_channel(ch);

    // If tick just became 0, we'll advance position next time
    if (modplay.tick == 0)
        advance_position();
}

// ---------------------------------------------------------------
// CIA1 IRQ handler — installed at $0314/$0315.
//
// The KERNAL's $FF48 dispatcher runs on every hardware IRQ:
//   $FF48 saves A/X/Y to the hardware stack, then JMPs to ($0314).
//
// __asm function: no C prologue/epilogue.
//
// We do NOT chain to the saved KERNAL handler ($EA31).  Chaining
// causes $EA31 (keyboard scan + JIFFIE update) to run after our
// save/restore of ADDR ($1F:$20), meaning any ZP use by the KERNAL
// or the U64 extended firmware (UCI hooks) in the $21-$42 gap —
// not covered by __interrupt prologue — would corrupt registers
// held live by the interrupted draw loop.
//
// Instead: run modplay_tick when Timer A fires, then manually pop
// the A/X/Y that $FF48 pushed and RTI.  The KERNAL keyboard scan
// is not needed during the demo — all scenes use direct CIA reads.
// modplay_stop() restores $0314 to mod_saved_irq ($EA31) when
// music stops, re-enabling the KERNAL chain for the end screen.
//
// ASM verification: modplay_tick (grep .asm) does NOT use ADDR
// ($1F:$20), so no save/restore of ADDR is needed here.
// ---------------------------------------------------------------
__asm modplay_irq
{
    lda $dc0d               // read + acknowledge CIA1 ICR
    and #$01                // Timer A flag set?
    beq modirq_exit
    jsr modplay_tick        // __interrupt: saves $03-$06,$0D-$13,$1B-$1E,$43-$51; RTS
modirq_exit:
    pla                     // restore Y (pushed last by $FF48)
    tay
    pla                     // restore X
    tax
    pla                     // restore A
    rti                     // pop hardware IRQ SR+PC → return to interrupted code
}

// ---------------------------------------------------------------
// modplay_start
// ---------------------------------------------------------------
void modplay_start(void)
{
    unsigned timer_val;
    char ch;

    if (!modplay.song_length)
        return;

    // Reset playback position
    modplay.order_pos = 0;
    modplay.pattern_num = modplay.order_table[0];
    modplay.row = 0;
    modplay.tick = 0; // will trigger row load on first IRQ
    modplay.ticks_per_row = MOD_DEFAULT_TICKS;
    modplay.bpm = MOD_DEFAULT_BPM;
    modplay.pattern_delay = 0;
    modplay.skip_row_advance = 0;
    modplay.active = 1;
    mod_paused = 0;

    // Set channel panning
    for (ch = 0; ch < MOD_CHANNELS; ch++)
    {
        if (modplay.stereo)
        {
            // ProTracker LRRL hard panning
            modplay.channel[ch].pan =
                (ch == 0 || ch == 3) ? MOD_PAN_LEFT : MOD_PAN_RIGHT;
        }
        else
        {
            modplay.channel[ch].pan = MOD_PAN_CENTRE;
        }
    }

    timer_val = bpm_to_timer(modplay.bpm);

    __asm { sei }

    // Save old $0314/$0315 vector so modplay_irq can chain to it.
    mod_saved_irq[0] = *(volatile unsigned char *)0x0314;
    mod_saved_irq[1] = *(volatile unsigned char *)0x0315;

    // Disable all CIA1 interrupts, program Timer A, re-enable.
    cia1.icr = 0x7F;
    cia1.ta  = timer_val;

    // Install modplay_irq at $0314/$0315.
    // KERNAL's $FF48 dispatcher calls ($0314) on every hardware IRQ,
    // so our handler receives both CIA1 and VIC interrupts.  It
    // handles CIA1 Timer A and chains to the old vector for the rest.
    *(volatile unsigned char *)0x0314 =
        (unsigned char)((unsigned)modplay_irq & 0xFF);
    *(volatile unsigned char *)0x0315 =
        (unsigned char)((unsigned)modplay_irq >> 8);

    // Enable CIA1 Timer A interrupt and start timer (continuous).
    cia1.icr = 0x81;
    cia1.cra = 0x01;

    __asm { cli }
}

// ---------------------------------------------------------------
// modplay_stop
// ---------------------------------------------------------------
void modplay_stop(void)
{
    char ch;

    __asm { sei }

    modplay.active = 0;

    // Silence all MOD channels
    for (ch = 0; ch < MOD_CHANNELS; ch++)
        audio_channel_stop(ch);

    // Restore $0314/$0315 to the handler that was there before us.
    *(volatile unsigned char *)0x0314 = mod_saved_irq[0];
    *(volatile unsigned char *)0x0315 = mod_saved_irq[1];

    // Restore Oscar64/KERNAL CIA1 timer A (~50 Hz PAL)
    cia1.icr = 0x7F;
    cia1.ta  = 0x4D25;   // 19749 ≈ 985248 Hz / 50 Hz
    cia1.icr = 0x81;
    cia1.cra = 0x01;

    __asm { cli }
}

// ---------------------------------------------------------------
// modplay_pause / modplay_resume
// ---------------------------------------------------------------
void modplay_pause(void)
{
    char ch;
    mod_paused = 1;
    for (ch = 0; ch < MOD_CHANNELS; ch++)
        audio_channel_stop(ch);
}

void modplay_resume(void)
{
    mod_paused = 0;
}

// ---------------------------------------------------------------
// modplay_set_master_volume / set_stereo
// ---------------------------------------------------------------
void modplay_set_master_volume(unsigned char vol)
{
    modplay.master_volume = vol;
}

void modplay_set_stereo(char enable)
{
    modplay.stereo = enable ? 1 : 0;
}

// ---------------------------------------------------------------
// Status accessors
// ---------------------------------------------------------------
unsigned char modplay_get_order(void) { return modplay.order_pos; }
unsigned char modplay_get_pattern(void) { return modplay.pattern_num; }
unsigned char modplay_get_row(void) { return modplay.row; }
unsigned char modplay_get_bpm(void) { return modplay.bpm; }
unsigned char modplay_is_playing(void) { return modplay.active && !mod_paused; }

// ---------------------------------------------------------------
// modplay_load  — fetch MOD via UCI directly into REU
// ---------------------------------------------------------------
char modplay_load(char *filename, unsigned long reu_addr)
{
    unsigned long size;

    unsigned long cur_addr;
    unsigned char i;

    // Open file — cursor starts at position 0.
    // Do NOT call uii_file_size() / uii_file_info() after opening:
    // that command corrupts the file cursor, causing uii_load_reu to load
    // only the low 16 bits of the file size (6792 of 334472 bytes for 4ev.mod).
    uii_open_file(0x01, filename);
    if (!UII_SUCCESS)
        return 0;

    // Load in 32767-byte chunks (max safe 16-bit size).
    // 16 iterations × 32767 = 524,272 bytes — covers any 4-channel MOD.
    // The file cursor advances each call; extra calls past EOF are no-ops.
    cur_addr = reu_addr;
    for (i = 0; i < 16; i++)
    {
        uii_load_reu(cur_addr, 32767UL);
        cur_addr += 32767UL;
        if (!UII_SUCCESS)
            break;
    }

    return (cur_addr > reu_addr) ? 1 : 0;
}

// ---------------------------------------------------------------
// modplay_init  — parse MOD header, build sample table
// ---------------------------------------------------------------
char modplay_init(unsigned long reu_addr)
{
    static unsigned char hdr[MOD_HDR_PATTERNS]; // BSS; called once — static avoids 1084-byte shadow-stack frame
    unsigned char *p;
    unsigned char i;
    unsigned long sample_data_base;
    unsigned long acc;

    modplay.reu_base = reu_addr;

    // Read the full 1084-byte MOD header into C64 RAM
    reu_fetch(hdr, reu_addr, MOD_HDR_PATTERNS);

    // ---- Detect format / number of samples ----
    // Use raw hex constants — petscii.h charmap remaps letter literals,
    // so 'M' compiles as 0x6D instead of 0x4D.  Hex is immune to charmap.
    p = &hdr[MOD_HDR_MAGIC];
    if (p[0] == 0x4D && p[1] == 0x2E && p[2] == 0x4B && p[3] == 0x2E)       // M.K.
        modplay.num_samples = 31;
    else if (p[0] == 0x4D && p[1] == 0x21 && p[2] == 0x4B && p[3] == 0x21)  // M!K!
        modplay.num_samples = 31;
    else if (p[0] == 0x34 && p[1] == 0x43 && p[2] == 0x48 && p[3] == 0x4E)  // 4CHN
        modplay.num_samples = 31;
    else if (p[0] == 0x46 && p[1] == 0x4C && p[2] == 0x54 && p[3] == 0x34)  // FLT4
        modplay.num_samples = 31;
    else
    {
        // Check for 15-sample format: magic area contains printable ASCII
        unsigned char ok = 1;
        for (i = 0; i < 4; i++)
        {
            if (p[i] < 0x20 || p[i] >= 0x7F)
            {
                ok = 0;
                break;
            }
        }
        if (!ok)
            return 0;
        modplay.num_samples = 15;
    }

    // ---- Song length and order table ----
    modplay.song_length = hdr[MOD_HDR_SONGLEN];
    if (modplay.song_length == 0 || modplay.song_length > 128)
        modplay.song_length = 128;

    memcpy(modplay.order_table, &hdr[MOD_HDR_ORDERTBL], 128);

    // ---- Determine number of patterns ----
    // Scan all 128 order table entries (not just song_length) to match the
    // reference player (ModPlayer_16k): unused entries can hold higher pattern
    // indices that define where sample data actually starts in the file.
    {
        unsigned char max_pat = 0;
        for (i = 0; i < 128; i++)
        {
            if (modplay.order_table[i] > max_pat)
                max_pat = modplay.order_table[i];
        }
        modplay.num_patterns = max_pat + 1;
    }

    // ---- Compute sample data base address in REU ----
    // Header: name(20) + samples(num_samples*30) + songlen(1) + pad(1)
    //       + order(128) + magic(4) + patterns(num_patterns * 1024)
    if (modplay.num_samples == 31)
        sample_data_base = reu_addr + MOD_HDR_PATTERNS + (unsigned long)modplay.num_patterns * 1024UL;
    else
        // 15-sample: header is 20+15*30+2+128 = 600 bytes (no magic)
        sample_data_base = reu_addr + 600UL + (unsigned long)modplay.num_patterns * 1024UL;

    // ---- Parse sample headers ----
    acc = 0;
    for (i = 0; i < modplay.num_samples; i++)
    {
        unsigned char *sh = &hdr[MOD_HDR_SAMPLES + i * 30];
        unsigned long len_words = ((unsigned long)sh[MSMP_LEN_HI] << 8) | (unsigned long)sh[MSMP_LEN_LO];
        unsigned long len_bytes = len_words * 2;

        unsigned long rep_words = ((unsigned long)sh[MSMP_REPA_HI] << 8) | (unsigned long)sh[MSMP_REPA_LO];
        unsigned long replen_w = ((unsigned long)sh[MSMP_REPLEN_HI] << 8) | (unsigned long)sh[MSMP_REPLEN_LO];

        modplay.sample[i].reu_addr = sample_data_base + acc;
        modplay.sample[i].length = len_bytes;
        modplay.sample[i].volume = (sh[MSMP_VOLUME] <= 64) ? sh[MSMP_VOLUME] : 64;
        modplay.sample[i].finetune = sh[MSMP_FINETUNE] & 0x0F;
        modplay.sample[i].loop_a = rep_words * 2;
        modplay.sample[i].loop_b = (rep_words + replen_w) * 2;
        modplay.sample[i].has_loop = (replen_w > 1) ? 1 : 0;

        acc += len_bytes;
    }

    // ---- Initialise player state ----
    modplay.order_pos = 0;
    modplay.pattern_num = modplay.order_table[0];
    modplay.row = 0;
    modplay.tick = 0;
    modplay.ticks_per_row = MOD_DEFAULT_TICKS;
    modplay.bpm = MOD_DEFAULT_BPM;
    modplay.master_volume = 200;
    modplay.stereo = 1;
    modplay.loop_song = 1;
    modplay.active = 0;
    mod_paused = 0;

    memset(modplay.channel, 0, sizeof(modplay.channel));
    for (i = 0; i < MOD_CHANNELS; i++)
    {
        modplay.channel[i].pan =
            (modplay.stereo && (i == 1 || i == 2)) ? MOD_PAN_RIGHT : MOD_PAN_LEFT;
    }

    return 1;
}
