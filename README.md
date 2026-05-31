# UltimateDemo2026

A demo for the Ultimate 64, showcasing turbo mode, Ultimate Audio DMA, and
various visual effects running at 64 MHz.

---

## Requirements

- **Ultimate 64** (U64 or U64 Elite) with firmware configured as follows:
  - **Turbo Mode** enabled: F2 → Turbo Mode → *U64 Turbo Registers*
  - **REU** set to 16 MB: F2 → C64 settings → REU → *16 MB*
  - **Ultimate Audio** enabled: F2 → C64/Cart settings → *Audio*
- One SD card or USB drive connected with the demo files (see Installation)

---

## Installation

1. Download `udemo2026-vX.Y.Z.zip` from the releases page.
2. Extract the ZIP to the **root** of an SD card or USB drive.
   The ZIP already contains the `idi8b/ultdemo2026/` folder — extracting at the
   drive root creates the correct directory layout automatically.
3. Insert the SD card or connect the USB drive to your Ultimate 64.
4. In the Ultimate menu, navigate to `idi8b/ultdemo2026/` and load `udemo2026.prg`.

> **Note:** The demo auto-detects all connected SD and USB drives and locates the
> `idi8b/ultdemo2026/` folder automatically. If you have multiple drives connected,
> place the demo files on only **one** of them to avoid ambiguity.

> **Power-user tip:** Set your Ultimate home directory
> (F2 → User Interface Settings → Home Directory) to `idi8b/ultdemo2026/`.
> The demo will find its files instantly without scanning all drives.

---

## Scenes

| Scene | Description |
|-------|-------------|
| **Gears** | Speed ramp from 1 to 64 MHz with rotating XOR gear pattern |
| **Mandelbrot** | Multicolor Mandelbrot fractal zoom |
| **Ball** | 3D shaded ball with rotating wireframe floor |
| **Vectors** | 3D wireframe rotating cube |
| **Plasma** | Sine-interference plasma effect |
| **Tunnel** | Texture-mapped 3D tunnel |
| **Scroller** | Full-screen PETSCII font scroller with music |

---

## Credits

- **Code:** Xander Mol
- **Music:** *4ev.mod* (Forever Young)
- **UCI/DOS library:** Scott Hutter & Francesco Sblendorio
- **MOD player:** based on ModPlayer_16k by 6510nl / Freshness
- **Font:** Small Round PETSCII Font by Cupid
- **Compiler:** Oscar64 by drmortalwombat

---

## Building from source

Requirements: [Oscar64](https://github.com/drmortalwombat/oscar64), `zip`, `wput`, `curl`.

```
make          # compile → build/udemo2026.prg + versioned ZIP in build/
make clean    # remove build artefacts
make deploy   # upload PRG + MOD to Ultimate 64 via FTP (edit ULTHOST in Makefile)
```

Edit `ULTHOST` in the Makefile to match your Ultimate 64's IP address.
The `make deploy` target checks connectivity before uploading and prints a
friendly error if the device is unreachable.
