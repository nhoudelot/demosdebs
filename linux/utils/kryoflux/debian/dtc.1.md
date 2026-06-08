% DTC(1) KryoFlux 3.50 | User Commands

# NAME

dtc - KryoFlux Disk Tool Console, floppy disk acquisition and conversion tool

# SYNOPSIS

**dtc** [*OPTIONS*]

# DESCRIPTION

**dtc** (Disk Tool Console) is the command-line component of the KryoFlux
software suite. It controls the KryoFlux USB floppy controller board and
provides facilities to read, convert, store, and write the contents of legacy
floppy disk formats.

KryoFlux replaces a standard floppy disk controller and captures the raw
magnetic flux data stream from the disk surface, independently of the disk's
encoding scheme. Supported media include 3", 3.5", 5.25", and 8" disks from
a wide range of platforms: Acorn Electron, Apple, Amstrad CPC, Archimedes,
Atari 8-bit, Atari ST, BBC Micro, Commodore 64, Commodore Amiga, MSX, IBM
PC, PC-8801, Sam Coupé, ZX Spectrum, E-MU Emulator II, and many others.

**dtc** can operate in two modes:

- **Hardware mode** (default): uses a connected KryoFlux board via USB to
  read from or write to a physical floppy drive.
- **Image file mode** (**-m1**): operates on previously captured KryoFlux
  STREAM files without requiring hardware (deviceless mode). All image
  conversion and analysis functions remain available.

A key feature of **dtc** is its ability to produce several output image
formats simultaneously in a single disk pass. A raw STREAM file can be
captured alongside a sector-decoded guide format (e.g. AmigaDOS ADF): if the
guide format signals decoding errors, **dtc** automatically retries the track,
ensuring both verified raw data and decoded images in one operation.

# OPTIONS

## Image and filename options

**-f**_name_
:   Set the output filename (without extension). Wildcards are supported:
    `##` expands to a two-digit track number, `#` to a single digit.

**-i**_type_
:   Set the image type. May be repeated to produce multiple output formats
    in a single pass. See **IMAGE TYPES** below. Image-local options must
    appear **before** each **-i** they apply to.

**-m**_id_
:   Set the device mode. **1** = image file (deviceless), **2** = KryoFlux
    hardware (default).

## Drive and hardware options

**-d**_id_
:   Select the floppy drive (default: 0).

**-dd**_val_
:   Set the drive density line. **0** = Low density (default), **1** = High
    density.

**-a**_trk_
:   Set the physical position of track 0 on side 0/A (default: 0).

**-b**_trk_
:   Set the physical position of track 0 on side 1/B (default: 0).

## Track selection

**-s**_trk_
:   Set the start track (default: 0). Image-local.

**-e**_trk_
:   Set the end track (default: 83). Image-local.

**-g**_side_
:   Single-sided mode. **0** = side 0, **1** = side 1, **2** = both (default).

**-k**_step_
:   Track density. **1** = 80-track / step 1 (default), **2** = 40-track /
    step 2.

**-ks**
:   Use only the explicitly selected tracks during analysis (default: auto).

## Sampling options

**-r**_rev_
:   Number of revolutions to sample per track (default: by image type).

**-t**_try_
:   Maximum number of retries per track, minimum 1 (default: 5).

**-tc**_try_
:   Number of retry cycles per track, minimum 1 (default: 2).

**-tm**_try_
:   Treat missing sectors as bad sectors. **0** = off, **1** = on (default).

**-l**_mask_
:   Output verbosity level bitmask (default: 62). Add values:
    1 = device, 2 = read, 4 = cell, 8 = format, 16 = write, 32 = verify,
    64 = TI.

**-v**_rpm_
:   Target system drive speed in RPM (default: by image type). Image-local.

**-x**_mode_
:   Extended cell band search (default: by image type). Image-local.
    **0** = image only, **1** = all, **2** = reference only.

**-y**
:   Flippy disk mode: reverses the bitstream on the flip side. Also used as
    **-wy** for write operations.

## Sector format options

**-z**_size_
:   Sector size. **0** = 128 B, **1** = 256 B, **2** = 512 B (default),
    **3** = 1024 B. Image-local.

**-n**_scnt_
:   Sector count. **0** = any (default), **+Z** = exactly Z, **-Z** = at
    most |Z|. Image-local.

## Output image options

**-oo**_ord_
:   Output image track order bitmask (default: by image type). Image-local.
    1 = side 0 descending, 2 = side 1 descending, 4 = side 1 first,
    8 = side-oriented.

**-os**_trk_
:   Output image start track (default: by image type). Image-local.

**-oe**_trk_
:   Output image end track (default: by image type). Image-local.

**-ot**_pct_
:   Data band threshold in percent (default: 30). Image-local.

**-p**
:   Enable the Path Solver from this point in the command line.

## Calibration

**-c**_mode_
:   Calibration mode. **1** = track read, **2** = maximum track,
    **3** = RPM calibration.

## Write options

**-w**
:   Write image data to a physical disk.

**-wi**_type_
:   Source image type for writing (default: 0 = auto-detect).

**-wp**_par_
:   Platform-specific write parameter (default: 0).

**-wm**_mode_
:   Write mode bitmask (default: 0).

**-wv**_mode_
:   Write verification. **0** = off, **1** = on (default).

**-we**_mode_
:   Erase mode (default: by bias). **0** = normal, **1** = used sectors
    only, **2** = full wipe.

**-wb**_bias_
:   Write bias (default: by image). **0** = neutral, **1** = bias out,
    **2** = bias in.

**-wg**_side_
:   Unformatted side filter (default: 3 = both sides).

**-wk**_side_
:   Track crosstalk filter (default: 3 = both sides).

**-ww**_ns_
:   Write precompensation window in nanoseconds, max 10000 (default: auto).

**-wt**_ns_
:   Write precompensation time in nanoseconds, max 1000 (default: auto).

**-wo**_mode_
:   Save output stream to file during write. **0** = off (default), **1** = on.

## Graph / plot options

**-pg**_type_
:   Graph type (default: 0). **0** = none, **1** = sample,
    **2** = consistency, **3** = path map.

**-pf**_mode_
:   Flip mode for graphs (default: 0). **0** = off, **1** = side 1,
    **2** = both sides.

**-pw**_size_
:   Graph width in pixels (default: 800).

**-ph**_size_
:   Graph height in pixels (default: 600).

**-px**_fval_
:   Graph X origin (default: 0.0).

**-py**_fval_
:   Graph Y origin (default: 0.0).

**-pd**_fval_
:   Graph domain (default: entire track based on RPM).

**-pr**_fval_
:   Graph range (default: 0.000020).

**-pv**_rpm_
:   Target drive speed for graph rendering in RPM (default: 300).

## EDOS support

**-ec**
:   Add a catalogue/database filename for EDOS encryption key recovery.

**-ep**
:   Add an EDOS image file path.

**-ek**
:   Set the EDOS key output filename (default: `edos_key.txt`).

**-er**_cnt_
:   Recover EDOS encryption keys (default: first key only; **-1** = all).

**-ed**
:   Decrypt EDOS image header(s) to TXT format.

**-edc**
:   Decrypt EDOS image header(s) to CSV format.

# IMAGE TYPES

## Supported for reading from disk

| Type | Description |
|------|-------------|
| 0    | KryoFlux STREAM files, preservation |
| 0a   | KryoFlux STREAM files, format-guided |
| 2    | CT Raw image, 84 tracks, DS, DD, 300 RPM, MFM |
| 3    | FM sector image, 40/80+ tracks, SS/DS, SD/DD, 300 RPM, FM |
| 3a   | FM XFD (Atari 8-bit) |
| 4    | MFM sector image, 40/80+ tracks, SS/DS, DD/HD, 300 RPM, MFM |
| 4a   | MFM XFD (Atari 8-bit) |
| 5    | AmigaDOS sector image, 80+ tracks, DS, DD/HD, 300 RPM, MFM |
| 6    | CBM DOS sector image, 35+ tracks, SS, DD, 300 RPM, GCR |
| 6a   | CBM DOS sector image with error map |
| 7    | Apple DOS 3.2 sector image, 35+ tracks, SS, DD, 300 RPM, GCR |
| 8    | Apple DOS 3.3+ sector image, 35+ tracks, SS, DD, 300 RPM, GCR |
| 8a   | DSK, DOS 3.3 interleave |
| 9    | Apple DOS 400K/800K sector image, 80+ tracks, SS/DS, DD, CLV, GCR |
| 10   | Emu sector image, 35+ tracks, SS, DD, 300 RPM, FM |
| 11   | Emu II sector image, 80+ tracks, DS, DD, 300 RPM, FM |
| 12   | Amiga DiskSpare sector image, 80+ tracks, DS, DD/HD, 300 RPM, MFM |
| 13   | DEC RX01 sector image, 77+ tracks, SS, SD, 360 RPM, FM |
| 14   | DEC RX02 sector image, 77+ tracks, SS, SD/DD, 360 RPM, FM/DMMFM |
| 15   | CBM MicroProse sector image, 35+ tracks, SS, DD, 300 RPM, GCR |
| 16   | CBM RapidLok sector image, 35+ tracks, SS, DD, 300 RPM, GCR |
| 17   | CBM Datasoft sector image, 35+ tracks, SS, DD, 300 RPM, GCR |
| 18   | CBM Vorpal sector image, 35+ tracks, SS, DD, 300 RPM, GCR |
| 19   | CBM V-MAX! sector image, 35+ tracks, SS, DD, 300 RPM, GCR |
| 20   | CBM Teque sector image, 35+ tracks, SS, DD, 300 RPM, GCR |
| 21   | CBM TDP sector image, 35+ tracks, SS, DD, 300 RPM, GCR |
| 22   | CBM GCR image, SS, DD, 300 RPM, GCR |
| 22a  | CBM GCR image with mastering info, SS, DD, 300 RPM, GCR |
| 23   | CBM Big Five sector image, 35+ tracks, SS, DD, 300 RPM, GCR |
| 24   | CBM DOS extended sector image, 35+ tracks, SS, DD, 300 RPM, GCR |
| 25   | CBM OziSoft sector image, 35+ tracks, SS, DD, 300 RPM, GCR |

## Supported for writing to disk

| Type | Description |
|------|-------------|
| 0    | Auto-detect from file |
| 1    | IPF image |
| 2    | Amiga ADF sector image |
| 3    | CBM G64 image |
| 4    | KryoFlux STREAM files |

# PARAMETER ORDER

Certain options are **image-local** and must appear **before** the **-i**
option they apply to; they are automatically reset after each **-i** is
processed:

> **-f**, **-y**, **-s**, **-e**, **-os**, **-oe**, **-oo**, **-g**,
> **-z**, **-n**, **-k**, **-v**, **-ot**, **-x**

**Global** options affect all images regardless of their position in the
command line:

> **-m**, **-l**, **-r**, **-t**, **-a**/**-b**, **-p**, **-c**

**Correct:**

    dtc -ffilename.ext -v360 -z3 -i4

**Wrong** (image-local options after -i are ignored):

    dtc -ffilename.ext -i4 -v360 -z3

# EXAMPLES

Run drive calibration (maximum track detection):

    dtc -c2

Dump an Amiga disk to KryoFlux STREAM files with AmigaDOS verification:

    dtc -f/tmp/amiga/track -i0 -i5

Dump a Commodore 64 disk to a G64 image with mastering information:

    dtc -f/tmp/c64/track -i22a

Dump an IBM PC 3.5" HD disk to an MFM sector image:

    dtc -f/tmp/pc/disk -i4

Convert STREAM files to AmigaDOS ADF without hardware (deviceless mode):

    dtc -m1 -f/tmp/amiga/track -fadiga.adf -i5

Write an ADF image back to a physical Amiga disk:

    dtc -f/tmp/amiga.adf -wi2 -w

Generate a consistency graph from previously captured STREAM files:

    dtc -m1 -f/tmp/amiga/track -pg2 -i0

Dump a 5.25-inch 40-track DD disk (360 RPM):

    dtc -f/tmp/disk/track -v360 -k2 -i4

# FILES

`/usr/share/dtc/firmware_kf_usb_rosalie.bin`
:   KryoFlux firmware image, loaded to the board at each session start.

`/usr/lib/udev/rules.d/80-kryoflux.rules`
:   udev rules granting non-root access to the KryoFlux USB device.

# SEE ALSO

**kryofluxui**(1)

Full documentation: `/usr/share/doc/dtc-doc/`

# AUTHORS

KryoFlux software and firmware by István Fábián.
Linux port by Adam Nielsen.
GUI by Kieron Wilkinson.
Additional documentation by Christian Bartsch.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
