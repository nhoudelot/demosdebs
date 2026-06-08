% funzy_getmemo7(1) | funzyto770 User Manuals
% Nicolas HOUDELOT <nicolas@demosdebs.org>; Sylvain Huet
% 2026-06-09

# NAME

funzy_getmemo7 - extract a memo7 ROM cartridge from a Thomson TO7 tape file

# SYNOPSIS

**funzy_getmemo7** *file.k7*

# DESCRIPTION

**funzy_getmemo7** reads a Thomson TO7 or TO7-70 cassette tape file (.k7
format) and extracts the memo7 ROM cartridge image from it, writing a
16384-byte .rom file.

The cartridge must have been previously saved on the TO7 or TO7-70 computer
using the following BASIC command:

    SAVEM"MEMO7",0,&H3FFF,0

The output file takes the name of the input file with the **.k7** extension
replaced by **.rom**.

A memo7 ROM cartridge holds 16384 bytes (address range 0x0000–0x3FFF).
Multiple cartridges can be used with the **funzyto770** emulator by placing
them in its **memo7/** directory.

# OPTIONS

This program accepts no options.

# FILES

*file.k7*
:   Input cassette tape file.

*file.rom*
:   Output ROM cartridge image (16384 bytes), named after the input file.

# EXAMPLES

Extract a memo7 cartridge from a tape recording:

    funzy_getmemo7 memo7.k7

The file **memo7.rom** is created in the current directory.

# SEE ALSO

**funzy_getrom**(1), **funzy_wav2k7**(1)

# BUGS

No known bugs.

# AUTHORS

Written by Sylvain Huet in 1996. Packaged for Debian by Nicolas HOUDELOT
<nicolas@demosdebs.org>.
