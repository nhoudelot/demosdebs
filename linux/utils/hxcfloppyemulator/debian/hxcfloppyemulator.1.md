% hxcfloppyemulator(1) HxC Floppy Emulator User Manual
% Jean-François DEL NERO; Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-06-09

# NAME

hxcfloppyemulator - graphical floppy disk image converter and USB HxC floppy server

# SYNOPSIS

**hxcfloppyemulator**

# DESCRIPTION

**HxCFloppyEmulator** is a graphical application (built with FLTK) released by
Jean-François DEL NERO in 2006. It is the companion software for the HxC Floppy
Emulator hardware devices (USB and SD-card based).

The software allows users to import, analyze and convert floppy disk images
across a wide range of formats, browse DOS/FAT and AmigaDOS floppy images,
inspect tracks at low level, read physical floppy disks, and drive a USB HxC
Floppy Emulator device directly as a floppy image server.

Supported image formats include (but are not limited to): HFE, ADF, IMG, DSK,
MFM, Kryoflux stream files, SCP, IPF, and many more. Use the companion
command-line tool **hxcfe**(1) to list all supported formats.

# OPTIONS

**hxcfloppyemulator** does not accept command-line options. All operations are
performed through its graphical user interface.

# FILES

*$HOME/.hxcfe/*
:   User configuration and settings directory.

# SEE ALSO

**hxcfe**(1)

Project website: <https://hxc2001.com>

# BUGS

Report bugs at <https://github.com/jfdelnero/HxCFloppyEmulator/issues>.

# AUTHORS

Jean-François DEL NERO <hxc2001@hxc2001.com>

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>

# COPYRIGHT

Copyright (C) 2006-2026 Jean-François DEL NERO / HxC2001.
License GPLv2+: GNU GPL version 2 or later <https://www.gnu.org/licenses/gpl-2.0.html>.
