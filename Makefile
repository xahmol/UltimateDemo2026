
# UltimateDemo2026
# Demo framework for the Ultimate 64
# Written in 2026 by Xander Mol

# Target platform
SYS = c64

# Cross-platform shell detection
ifneq ($(shell echo),)
  CMD_EXE = 1
endif

ifdef CMD_EXE
  NULLDEV = nul:
  DEL     = -del /f
  RMDIR   = rmdir /s /q
  MKDIR   = mkdir
else
  NULLDEV = /dev/null
  DEL     = $(RM)
  RMDIR   = $(RM) -r
  MKDIR   = mkdir -p
endif

# Toolchain
CC = /home/xahmol/oscar64/bin/oscar64

# Application name
MAIN = udemo2026

# Build versioning
VERSION_MAJOR     = 1
VERSION_MINOR     = 0
VERSION_PATCH     = 1
VERSION_TIMESTAMP = $(shell date "+%Y%m%d-%H%M")
VERSION           = v$(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_PATCH)-$(VERSION_TIMESTAMP)

# Compile flags
#   -i=include   : add include/ to header search path
#   -tm=c64      : target Commodore 64
#   -tf=prg      : output standard .prg file
#   -O2          : optimise
#   -dNOFLOAT    : disable float support (saves space)
#   -n           : suppress default BASIC stub (Oscar64 adds one for prg)
#   -dVERSION    : pass version string to source
CFLAGS = -i=include \
         -tm=$(SYS) \
         -tf=prg \
         -O2 \
         -dNOFLOAT \
         -dHEAPCHECK \
         -dVERSION="\"$(VERSION)\""

# Main source (Oscar64 follows #pragma compile chains from here)
MAINSRC = src/main.c

# All sources that Oscar64 compiles via #pragma compile chains.
# Listed here so make rebuilds when any of them change.
ALLSRCS = $(MAINSRC) \
          src/screen.c \
          src/gears.c \
          src/mandel.c \
          src/plasma.c \
          src/vectors.c \
          src/ball.c \
          src/tunnel.c \
          src/scroller.c \
          include/turbo.c \
          include/audio.c \
          include/modplay.c \
          include/ultimate_common_lib.c \
          include/ultimate_dos_lib.c

# Output
TARGET = build/$(MAIN).prg

########################################

MODFILE = assets/4ev.mod

# Ultimate 64 config presets (Turbo Registers, 16 MB REU, Ultimate Audio,
# Command Interface). CONFIGFILE (U64E2) is deployed/zipped as $(MAIN).cfg --
# SAME base name as the .prg -- so firmware 3.15+ auto-loads it when the .prg
# is run, no manual "load config" step needed. Harmless/ignored on pre-3.15
# firmware. CONFIGFILE_C64U differs only in its Turbo Control value (see the
# file) -- C64U firmware doesn't yet auto-load by filename, so it's shipped
# under its own name in a config/ subfolder for manual "Load Settings from
# File" instead (see README).
CONFIGFILE      = config/UltimateDemo2026-U64E2.cfg
CONFIGFILE_C64U = config/UltimateDemo2026-C64U.cfg

# Demo install path on SD/USB (must match demo_path[] in src/main.c)
INSTALL_PATH = idi8b/ultdemo2026
# NOTE: The zip target hardcodes the first path component "idi8b" in the cleanup
#       RMDIR step. If you change INSTALL_PATH to a different top-level folder,
#       update the RMDIR line in the zip target accordingly.

# Deployment target (FTP to Ultimate device)
# Set your U64 IP in .env (see .env.example) — .env is gitignored
-include .env
ULTHOST  ?= <YOUR_U64_IP>
ULTPATH  = /usb0/$(INSTALL_PATH)/
ULTFTP   = ftp://$(ULTHOST)

# Versioned release ZIP
ZIPFILE  = build/$(MAIN)-$(VERSION).zip

.SUFFIXES:
.PHONY: all clean deploy zip check-deploy paltest paltest-deploy

all: $(TARGET) zip

$(TARGET): $(ALLSRCS)
	@$(MKDIR) build 2>$(NULLDEV) ; true
	$(CC) $(CFLAGS) -n -o=$(TARGET) $<

clean:
	$(DEL) build/*.prg 2>$(NULLDEV) ; true
	$(DEL) build/*.map 2>$(NULLDEV) ; true
	$(DEL) build/*.asm 2>$(NULLDEV) ; true
	$(DEL) build/*.lbl 2>$(NULLDEV) ; true
	$(DEL) build/*.zip 2>$(NULLDEV) ; true

zip: $(TARGET)
	$(MKDIR) build/$(INSTALL_PATH)/config 2>$(NULLDEV) ; true
	cp $(TARGET)   build/$(INSTALL_PATH)/$(MAIN).prg
	cp $(CONFIGFILE) build/$(INSTALL_PATH)/$(MAIN).cfg
	cp $(CONFIGFILE) build/$(INSTALL_PATH)/config/
	cp $(CONFIGFILE_C64U) build/$(INSTALL_PATH)/config/
	cp $(MODFILE)  build/$(INSTALL_PATH)/
	cp README.md   build/$(INSTALL_PATH)/README.md
	cd build && zip -r $(MAIN)-$(VERSION).zip idi8b/
	$(RMDIR) build/idi8b 2>$(NULLDEV) ; true

check-deploy:
	@curl -s --connect-timeout 3 $(ULTFTP)/ >/dev/null 2>&1 || \
		(echo "ERROR: Cannot reach U64 at $(ULTHOST) -- check ULTHOST in Makefile" && false)

deploy: check-deploy $(TARGET)
	wput -u $(TARGET) $(ULTFTP)$(ULTPATH)$(MAIN).prg
	wput -u $(CONFIGFILE) $(ULTFTP)$(ULTPATH)$(MAIN).cfg
	wput -u $(CONFIGFILE) $(ULTFTP)$(ULTPATH)config/$(notdir $(CONFIGFILE))
	wput -u $(CONFIGFILE_C64U) $(ULTFTP)$(ULTPATH)config/$(notdir $(CONFIGFILE_C64U))
	wput -u $(MODFILE) $(ULTFTP)$(ULTPATH)$(notdir $(MODFILE))

########################################
# Standalone Palette Morph test harness (dev tool -- see src/test_palette.c).
# Skips detection/gears/the rest of the demo entirely: just UCI + turbo_fast()
# + palette_morph_run(). Not part of the shipped demo, not included in zip.
########################################

PALTESTSRC     = src/test_palette.c
PALTESTTARGET  = build/paltest.prg
PALTESTALLSRCS = $(PALTESTSRC) \
                 src/screen.c \
                 src/palette_morph.c \
                 include/turbo.c \
                 include/ultimate_common_lib.c

$(PALTESTTARGET): $(PALTESTALLSRCS)
	@$(MKDIR) build 2>$(NULLDEV) ; true
	$(CC) $(CFLAGS) -n -o=$(PALTESTTARGET) $(PALTESTSRC)

paltest: $(PALTESTTARGET)

paltest-deploy: check-deploy $(PALTESTTARGET)
	wput -u $(PALTESTTARGET) $(ULTFTP)$(ULTPATH)paltest.prg
