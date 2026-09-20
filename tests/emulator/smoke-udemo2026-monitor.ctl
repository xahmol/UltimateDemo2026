# Full udemo2026.prg smoke test using UE2-C64U-Emulator v0.4.0's debug
# monitor (S23) instead of screen-scraping alone. Replaces guesswork
# ("trust the boot log", "eyeball a PNG") with direct verification:
#
#   monitor dir     confirms the USB staging tree actually has the files
#                   we think it has, before ever touching the menu.
#   monitor config  confirms the *.cfg loaded via --settings actually
#                   landed in the flash and is what the running firmware
#                   sees -- not just that ue2emu printed a "settings:"
#                   line at boot.
#   monitor m       raw screen-RAM read of the detection screen, once
#                   reached -- byte-for-byte, independent of font
#                   rendering or PNG comparison.
#
# Usage: point --usb-dir at a tree matching `make`'s own build/idi8b
# layout (config/, 4ev.mod, README.md, udemo2026.cfg, udemo2026.prg --
# 5 entries, cursor starts on `config`), and --settings at
# config/UltimateDemo2026-U64E2.cfg. `make` deletes build/idi8b right
# after zipping it, so stage a persistent copy yourself, e.g.:
#   mkdir -p /tmp/usb/idi8b/ultdemo2026/config
#   cp build/udemo2026.prg config/UltimateDemo2026-U64E2.cfg assets/4ev.mod README.md \
#      /tmp/usb/idi8b/ultdemo2026/   (udemo2026.cfg is the .cfg file, renamed)
#   cp config/*.cfg /tmp/usb/idi8b/ultdemo2026/config/
# The down×4 below is verified against exactly this 5-entry layout
# (2026-09-20, live run) -- if you stage a different file set, the
# down-count needs re-verifying, not assumed.
#
# monitor commands are sent over the SAME control connection as the
# scripted keys/waits -- no separate connection needed.

wait 4000
monitor config "C64 and Cartridge Settings" "RAM Expansion Unit"
monitor config "C64 and Cartridge Settings" "REU Size"
monitor config "U64 Specific Settings" "Turbo Control"
monitor dir /Usb0/idi8b/ultdemo2026

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
key down
key down
key down
key down
wait 300
screen
key return
wait 500
screen
key return
wait 3000
c64screen
png run/udemo2026-detect.png
monitor m 0400 04ff
monitor status
monitor clock
quit
