% funzy_wav2k7(1) | funzyto770 User Manuals
% Nicolas HOUDELOT <nicolas@demosdebs.org>; Sylvain Huet
% 2026-06-09

# NAME

funzy_wav2k7 - convert a cassette WAV audio recording to Thomson TO7 .k7 format

# SYNOPSIS

**funzy_wav2k7** *file.wav*

# DESCRIPTION

**funzy_wav2k7** converts a WAV audio file recorded from a Thomson TO7 or
TO7-70 cassette tape into the .k7 binary format used by the **funzyto770**
emulator and the companion utilities **funzy_getrom**(1) and
**funzy_getmemo7**(1).

The input WAV file must be 8-bit mono recorded at 44100 Hz. The output file
takes the name of the input file with the **.wav** extension replaced by
**.k7**.

If the conversion does not yield a usable .k7 file, check that the recording
level was adequate. If necessary, apply equalisation by boosting the
4.5 kHz–6.3 kHz frequency band.

# OPTIONS

This program accepts no options.

# FILES

*file.wav*
:   Input audio file (8-bit mono, 44100 Hz).

*file.k7*
:   Output cassette tape image in TO7 format.

# EXAMPLES

Convert a WAV recording to .k7 format:

    funzy_wav2k7 myprog.wav

This produces **myprog.k7**, which can then be loaded by the **funzyto770**
emulator.

Convert a ROM dump for extraction with **funzy_getrom**(1):

    funzy_wav2k7 romto770.wav
    funzy_getrom romto770.k7

# SEE ALSO

**funzy_getrom**(1), **funzy_getmemo7**(1)

# BUGS

No known bugs.

# AUTHORS

Written by Sylvain Huet in 1996 (version 2.1). Packaged for Debian by Nicolas HOUDELOT
<nicolas@demosdebs.org>.
