
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
VERSION_MAJOR     = 0
VERSION_MINOR     = 1
VERSION_PATCH     = 0
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

# Output
TARGET = build/$(MAIN).prg

# Hostname of Ultimate device for deployment (edit IP and path)
ULTHOST = ftp://192.168.1.233/usb0/Dev/

########################################

.SUFFIXES:
.PHONY: all clean deploy

all: $(TARGET)

$(TARGET): $(MAINSRC)
	@$(MKDIR) build 2>$(NULLDEV) ; true
	$(CC) $(CFLAGS) -n -o=$(TARGET) $<

clean:
	$(DEL) build/*.prg 2>$(NULLDEV) ; true
	$(DEL) build/*.map 2>$(NULLDEV) ; true
	$(DEL) build/*.asm 2>$(NULLDEV) ; true
	$(DEL) build/*.lbl 2>$(NULLDEV) ; true

deploy: $(TARGET)
	wput -u $(TARGET) $(ULTHOST)
