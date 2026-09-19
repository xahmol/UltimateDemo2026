# UltimateDemo2026 smoke test: paltest.prg (standalone Palette Morph
# harness -- UCI enable + turbo_fast() + palette_morph_run()). Skips the
# hardware-detection screen/gears entirely, so it avoids turbo_detect()'s
# benchmark-based busy loop, found to take excessively long (multiple
# real minutes, still running) against this emulator build when tested
# via the full udemo2026.prg -- see the accompanying report.
#
# Usb-dir layout expected: <usb-dir>/idi8b/ultdemo2026/paltest.prg
#   (mkdir -p <usb-dir>/idi8b/ultdemo2026 && cp build/paltest.prg <usb-dir>/idi8b/ultdemo2026/)
#
# c64screen/png only DUMP -- the control protocol's expect/expect-not
# match the firmware overlay's text_dump, not the C64's own screen, so
# this script can't assert on C64 screen content automatically. Pass
# criteria (verify from the dumps this script produces): the first
# c64screen dump shows the idi8b logo (ASCII-art), the second shows
# "READY." (clean return to BASIC once palette_morph_run() completes its
# loop and turbo_slow() runs) -- no hang, no crash, no garbage.
wait 6000
button
wait 800
key down
key down
key down
wait 300
key right
wait 800
key right
wait 800
key right
wait 800
screen
key return
wait 500
key return
wait 3000
c64screen
png run/paltest-logo.png
wait 8000
c64screen
png run/paltest-ready.png
quit
