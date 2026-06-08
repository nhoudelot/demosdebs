% exe2adf(1) exe2adf "User Manual"
% Nicolas HOUDELOT (nicolas@demosdebs.org); Bonefish/Reality
% 2019-12-21

# NAME
exe2adf - convert Amiga executables to ADF disk images

# SYNOPSIS
**exe2adf** **-i** *filename.exe* [*options*]

# DESCRIPTION
**exe2adf** converts Amiga executable (**.exe**) files into bootable ADF
(Amiga Disk File) disk images, suitable for use with Amiga emulators or
real hardware.

Created by Bonefish of the demo group Reality and released in 2015, the
tool places the executable onto a bootable floppy image with optional
support for boot-time text display, custom disk labels, directory
inclusion, custom bootblocks, and palette configuration.

# OPTIONS

## Mandatory

**-i** *file*, **--input** *file*
:   Amiga executable file to convert to ADF.

## Optional

**-a** *file*, **--adf** *file*
:   Output ADF filename.

**-t** *file*, **--txt** *file*
:   Text file to display at boot time.

**-l** *label*, **--label** *label*
:   Label of the ADF disk.

**-k**, **--add21k**
:   Free 21 KB before loading the rest of the floppy.

**-c**, **--cls**
:   Clear the screen before displaying the text file.
    Only usable with **--txt**.

**-w**, **--wide**
:   Set AmigaDOS/CLI to 80 columns instead of the default 60 columns.

**-p** *colors*, **--palette** *colors*
:   Set AmigaDOS/CLI palette. Accepts 3 or 7 comma-separated RGB hex
    triplets:

    - color 1: background (mandatory)
    - color 2: foreground (mandatory)
    - color 3: minimise icon
    - color 4: cursor
    - color 5: pointer main
    - color 6: pointer shadow
    - color 7: pointer highlight

**-d** *directory*, **--directory** *directory*
:   Directory to include on the floppy.

**-b** *file*, **--bootblock** *file*
:   Install a custom bootblock.

**-0**
:   Show the sector allocation map.

# EXAMPLES

Fast usage:

    exe2adf -i intro.exe

Simple usage:

    exe2adf -i intro.exe -l myfloppy -a floppy.adf
    exe2adf --input intro.exe --label myfloppy --adf floppy.adf

Advanced usage:

    exe2adf -i intro.exe -l myfloppy -t readme.txt -a floppy.adf -k -c

Palette usage (CLI colors only):

    exe2adf -i intro.exe -t readme.txt -a floppy.adf -p 000,fff,00f,f0f

Palette usage (CLI and pointer colors):

    exe2adf -i intro.exe -t readme.txt -a floppy.adf \
            -p 000,fff,00f,f0f,888,444,fff

# BUGS
No known bugs.

# AUTHORS
Bonefish/Reality (upstream author).
Packaged for Debian by Nicolas HOUDELOT <nicolas@demosdebs.org>.
