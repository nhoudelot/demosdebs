% funzy_getrom(1) | funzyto770 User Manuals
% Nicolas HOUDELOT <nicolas@demosdebs.org>; Sylvain Huet
% 2026-06-09

# NAME

funzy_getrom - extract the Thomson TO7 high ROM from a tape file

# SYNOPSIS

**funzy_getrom** *file.k7*

# DESCRIPTION

**funzy_getrom** reads a Thomson TO7 or TO7-70 cassette tape file (.k7
format) and extracts the high ROM image from it, writing a 6144-byte .rom
file.

The ROM must have been previously saved on the TO7 or TO7-70 computer using
the following BASIC command:

    SAVEM"ROM",&HE800,&HFFFF,0

The output file takes the name of the input file with the **.k7** extension
replaced by **.rom**.

The TO7 high ROM covers 6144 bytes (address range 0xE800–0xFFFF) and is
required to run the **funzyto770** emulator. The resulting .rom file must be
renamed **romto770** and placed in the emulator's working directory.

# OPTIONS

This program accepts no options.

# FILES

*file.k7*
:   Input cassette tape file.

*file.rom*
:   Output ROM image (6144 bytes), named after the input file.

# EXAMPLES

Extract the TO7 ROM from a tape recording:

    funzy_getrom romto770.k7

Then rename the output for use with the emulator:

    mv romto770.rom romto770

# SEE ALSO

**funzy_getmemo7**(1), **funzy_wav2k7**(1)

# BUGS

No known bugs.

# AUTHORS

Written by Sylvain Huet in 1996. Packaged for Debian by Nicolas HOUDELOT
<nicolas@demosdebs.org>.
