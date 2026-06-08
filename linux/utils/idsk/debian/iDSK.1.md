% IDSK(1) iDSK User Manual | iDSK 0.20
% Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-06-09

# NAME

idsk - command-line editor for Amstrad CPC DSK disk images

# SYNOPSIS

**iDSK** *DSKfile* [*OPTION*]... [*file*]...

# DESCRIPTION

**iDSK** is a command-line utility for editing DSK disk image files used by
Amstrad CPC home computers. DSK files are virtual floppy disk images
containing files stored in AMSDOS format.

It allows listing, importing, exporting, and removing files within a disk
image, as well as creating new empty disk images. It can also display the
contents of BASIC and DAMS source files (stored in a tokenized format, not
plain ASCII), and disassemble Z80 binary files.

# OPTIONS

## File operations

**-l**
:   List the disk catalog.

**-g** *file*
:   Export (get) a file from the image.

**-i** *file*
:   Import a file into the image.

**-r** *file*
:   Remove a file from the image.

**-n**
:   Create a new empty DSK image file.

**-f**
:   Force overwriting if the destination file already exists.

## File attributes (used with **-i**)

**-t** *type*
:   Set the file type: **0** for ASCII, **1** for binary.

**-e** *address*
:   Set the execution address (hexadecimal) for a binary file.

**-c** *address*
:   Set the loading address (hexadecimal) for a binary file.

**-o**
:   Mark the imported file as read-only.

**-s**
:   Mark the imported file as a system file.

**-u** *number*
:   Set the user number for the imported file.

## Display and analysis

**-b** *file*
:   Display a tokenized Amstrad BASIC source file.

**-p**
:   Split lines longer than 80 characters (used with **-b**).

**-d** *file*
:   Display a DAMS assembly source file.

**-h** *file*
:   Display a binary file as hexadecimal.

**-z** *file*
:   Disassemble a Z80 binary file.

# EXAMPLES

List the contents of a disk image:

    iDSK floppy.dsk -l

Export a file from a disk image:

    iDSK floppy.dsk -g myprog.bas

Import a binary file with specific load and execution addresses:

    iDSK floppy.dsk -i myprog.bin -t 1 -c 4000 -e C000

Create a new empty disk image:

    iDSK floppy2.dsk -n

Display a tokenized BASIC file, wrapping at 80 characters:

    iDSK floppy.dsk -b myprog.bas -p

# BUGS

No known bugs. Please report bugs at <https://github.com/cpcsdk/idsk/issues>.

# SEE ALSO

**dsktools**(1)

# AUTHORS

**iDSK** was originally written by Sid (IMPACT) and further developed by
PulkoMandy (Shinra Team), Thierry JOUIN (Ramlaid), Demoniak, and other
contributors from the cpcsdk project.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>.
