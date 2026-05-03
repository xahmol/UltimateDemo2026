/*****************************************************************
Ultimate 64 Audio Hardware Layer — implementation
See audio.h for API documentation.
******************************************************************/

#include <c64/reu.h>
#include "audio.h"

// ---------------------------------------------------------------
// Channel base address table
// ---------------------------------------------------------------
const unsigned audio_ch_base[AUDIO_NUM_CHANNELS] = {
    AUDIO_CH0, AUDIO_CH1, AUDIO_CH2, AUDIO_CH3,
    AUDIO_CH4, AUDIO_CH5, AUDIO_CH6
};

// ---------------------------------------------------------------
// Internal helpers
// ---------------------------------------------------------------

// Write a byte to a channel register
static void ch_wr(char ch, char offset, unsigned char val) {
    volatile unsigned char *p =
        (volatile unsigned char *)(unsigned long)audio_ch_base[ch];
    p[offset] = val;
}

// Read a byte from a channel register
static unsigned char ch_rd(char ch, char offset) {
    volatile unsigned char *p =
        (volatile unsigned char *)(unsigned long)audio_ch_base[ch];
    return p[offset];
}

// Write a 32-bit value LSB-first starting at offset
static void ch_wr32(char ch, char offset, unsigned long val) {
    volatile unsigned char *p =
        (volatile unsigned char *)(unsigned long)audio_ch_base[ch];
    p[offset + 0] = (unsigned char)(val);
    p[offset + 1] = (unsigned char)(val >> 8);
    p[offset + 2] = (unsigned char)(val >> 16);
    p[offset + 3] = (unsigned char)(val >> 24);
}

// Write a 24-bit value LSB-first starting at offset
static void ch_wr24(char ch, char offset, unsigned long val) {
    volatile unsigned char *p =
        (volatile unsigned char *)(unsigned long)audio_ch_base[ch];
    p[offset + 0] = (unsigned char)(val);
    p[offset + 1] = (unsigned char)(val >> 8);
    p[offset + 2] = (unsigned char)(val >> 16);
}

// Write a 16-bit value LSB-first starting at offset
static void ch_wr16(char ch, char offset, unsigned val) {
    volatile unsigned char *p =
        (volatile unsigned char *)(unsigned long)audio_ch_base[ch];
    p[offset + 0] = (unsigned char)(val);
    p[offset + 1] = (unsigned char)(val >> 8);
}

// ---------------------------------------------------------------
// audio_reset
// ---------------------------------------------------------------
void audio_reset(void) {
    char ch, i;
    for (ch = 0; ch < AUDIO_NUM_CHANNELS; ch++) {
        volatile unsigned char *p =
            (volatile unsigned char *)(unsigned long)audio_ch_base[ch];
        for (i = 0x1E; i >= 0; i--)
            p[i] = 0;
    }
}

// ---------------------------------------------------------------
// audio_detect
//
// Behavioral test based on the reference ModPlayer_16k detectaudio
// routine by 6510nl.  Plays a minimal looping sample on channel 0
// and checks that the end-of-sample IRQ fires (audist bit 0 set).
//
// Rate=50 (125 kHz): each sample byte takes 8 µs.  With CTR=0x05
// (start+loop), the IRQ fires at the loop boundary every 8 µs.
// The 256-read wait covers ~16 µs at 64 MHz and ~1 ms at 1 MHz —
// the IRQ is always caught well within that window.
//
// Using CTR=AUDIO_CTR_START (0x01, no loop) does NOT trigger the
// end-of-sample IRQ on U64 audio — loop mode (bit 2) is required.
//
// Step 5 checks bit 0 of audist (AUDIO_ST_IRQ) rather than the
// exact value 0x01, in case the firmware sets additional status bits.
//
// Steps:
//  1. Stop all 7 channels; ack ch0 IRQ.
//  2. Read audist (ch0) 256 times — must stay 0.
//     Unmapped $DF20 returns open bus (0xFF), failing here.
//  3. Play 1-byte looping sample: start=0, length=1, rate=50,
//     CTR = start + loop (0x05).
//  4. Wait up to 256 reads for audist bit 0 to be set.
//  5. Read audist 256 times — bit 0 must be set each time.
//  6. Ack IRQ, stop ch0.
// ---------------------------------------------------------------
char audio_detect(void) {
    volatile unsigned char *ch0 =
        (volatile unsigned char *)(unsigned long)AUDIO_CH0;
    unsigned char i;
    char ch;

    __asm { sei }

    // Stop all 7 channels and ack every channel's IRQ for a clean slate.
    for (ch = 0; ch < AUDIO_NUM_CHANNELS; ch++) {
        volatile unsigned char *p =
            (volatile unsigned char *)(unsigned long)audio_ch_base[ch];
        p[AUDIO_OFF_CTR] = AUDIO_CTR_STOP;
        p[AUDIO_OFF_IRQ] = 0xFF;
    }

    // Presence check: an unmapped address returns open bus (0xFF) consistently.
    // Any other value (0x00 = idle, 0x01 = IRQ from previous run, etc.) means
    // the audio module is mapped here — do not fail on 0x01 from a prior run.
    i = 0;
    do {
        if (ch0[AUDIO_OFF_STATUS] == 0xFF) {
            __asm { cli }
            return 0;
        }
    } while (--i != 0);

    // Extra ack after the presence check loop
    ch0[AUDIO_OFF_IRQ] = 0xFF;

    // Start a 1-byte looping sample at rate=50 (125 kHz → 8 µs/cycle).
    // CTR=0x05 (start+loop) is required — loop mode is needed for the
    // end-of-sample IRQ to fire on U64 Audio; CTR=0x01 (one-shot) does not.
    ch0[AUDIO_OFF_VOL]     = 0;
    ch0[AUDIO_OFF_SMS + 0] = 0;
    ch0[AUDIO_OFF_SMS + 1] = 0;
    ch0[AUDIO_OFF_SMS + 2] = 0;
    ch0[AUDIO_OFF_SMS + 3] = 0;
    ch0[AUDIO_OFF_SML + 0] = 1;    // length = 1 byte
    ch0[AUDIO_OFF_SML + 1] = 0;
    ch0[AUDIO_OFF_SML + 2] = 0;
    ch0[AUDIO_OFF_RAT + 0] = 50;   // rate=50 → 125 kHz → 8 µs/sample
    ch0[AUDIO_OFF_RAT + 1] = 0;
    ch0[AUDIO_OFF_CTR]     = AUDIO_CTR_START | AUDIO_CTR_LOOP;

    // Wait for the IRQ: 16 × 256 = 4096 reads ≈ 256 µs at 64 MHz.
    // Rate=50 fires the loop IRQ every 8 µs; this window covers ~32 cycles.
    {
        char irq_found = 0;
        for (ch = 0; ch < 16 && !irq_found; ch++) {
            i = 0;
            do {
                if (ch0[AUDIO_OFF_STATUS] & AUDIO_ST_IRQ) {
                    irq_found = 1;
                    break;
                }
            } while (--i != 0);
        }
        if (!irq_found) {
            ch0[AUDIO_OFF_CTR] = AUDIO_CTR_STOP;
            __asm { cli }
            return 0;
        }
    }

    ch0[AUDIO_OFF_IRQ] = 0xFF;
    ch0[AUDIO_OFF_CTR] = AUDIO_CTR_STOP;

    __asm { cli }
    return 1;
}

// ---------------------------------------------------------------
// audio_get_version
// ---------------------------------------------------------------
unsigned char audio_get_version(void) {
    return ch_rd(0, AUDIO_OFF_VERSION);
}

// ---------------------------------------------------------------
// audio_channel_stop
// ---------------------------------------------------------------
void audio_channel_stop(char ch) {
    ch_wr(ch, AUDIO_OFF_CTR, AUDIO_CTR_STOP);
}

// ---------------------------------------------------------------
// audio_channel_play  (one-shot)
// ---------------------------------------------------------------
void audio_channel_play(char ch,
                        unsigned long start,
                        unsigned long length,
                        unsigned     rate,
                        unsigned char vol,
                        unsigned char pan) {
    ch_wr(ch, AUDIO_OFF_CTR, AUDIO_CTR_STOP);  // stop first
    ch_wr(ch, AUDIO_OFF_VOL, vol);
    ch_wr(ch, AUDIO_OFF_PAN, pan);
    ch_wr32(ch, AUDIO_OFF_SMS, start);
    ch_wr24(ch, AUDIO_OFF_SML, length);
    ch_wr16(ch, AUDIO_OFF_RAT, rate);
    ch_wr(ch, AUDIO_OFF_CTR, AUDIO_CTR_START);
}

// ---------------------------------------------------------------
// audio_channel_loop
// ---------------------------------------------------------------
void audio_channel_loop(char ch,
                        unsigned long start,
                        unsigned long length,
                        unsigned long loop_a,
                        unsigned long loop_b,
                        unsigned     rate,
                        unsigned char vol,
                        unsigned char pan) {
    ch_wr(ch, AUDIO_OFF_CTR, AUDIO_CTR_STOP);
    ch_wr(ch, AUDIO_OFF_VOL, vol);
    ch_wr(ch, AUDIO_OFF_PAN, pan);
    ch_wr32(ch, AUDIO_OFF_SMS, start);
    ch_wr24(ch, AUDIO_OFF_SML, length);
    ch_wr16(ch, AUDIO_OFF_RAT, rate);
    ch_wr24(ch, AUDIO_OFF_RPA, loop_a);
    ch_wr24(ch, AUDIO_OFF_RPB, loop_b);
    ch_wr(ch, AUDIO_OFF_CTR, AUDIO_CTR_START | AUDIO_CTR_LOOP);
}

// ---------------------------------------------------------------
// audio_channel_set_*
// ---------------------------------------------------------------
void audio_channel_set_volume(char ch, unsigned char vol) {
    ch_wr(ch, AUDIO_OFF_VOL, vol);
}
void audio_channel_set_pan(char ch, unsigned char pan) {
    ch_wr(ch, AUDIO_OFF_PAN, pan);
}
void audio_channel_set_rate(char ch, unsigned rate) {
    ch_wr16(ch, AUDIO_OFF_RAT, rate);
}
void audio_channel_ack_irq(char ch) {
    ch_wr(ch, AUDIO_OFF_IRQ, 0xFF);
}

// ---------------------------------------------------------------
// reu_fetch — wrapper over Oscar64's native reu_load
// ---------------------------------------------------------------
void reu_fetch(void *c64dest, unsigned long reu_src, unsigned len) {
    reu_load(reu_src, (volatile char *)c64dest, len);
}
