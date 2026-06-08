% hxcfe(1) HxC Floppy Emulator User Manual
% Jean-François DEL NERO; Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-06-09

# NAME

hxcfe - command-line floppy disk image converter and USB HxC floppy server

# SYNOPSIS

**hxcfe** [*OPTIONS*]

# DESCRIPTION

**hxcfe** is the command-line companion to the HxC Floppy Emulator hardware devices.
It exposes the full power of the **libhxcfe** library through a simple command-line
interface and allows users to convert floppy disk images between many formats, apply
raw disk layouts, list or extract files from floppy images, and drive a USB HxC
Floppy Emulator device as a floppy image server.

Multiple **-conv** / **-foutput** pairs may be given in a single invocation to produce
several output formats at once.

# OPTIONS

**-help**
:   Display a summary of available options and usage examples.

**-license**
:   Print the full license text.

**-verbose**
:   Enable verbose output.

**-script**:*filename*
:   Execute the batch script *filename*.

**-modulelist**
:   List all supported floppy image formats (FORMAT identifiers) with their
    access mode (R = read, W = write) and file extensions.

**-rawlist**
:   List all available raw disk layouts (DISKLAYOUT identifiers).

**-interfacelist**
:   List all available floppy interface modes (INTERFACE_MODE identifiers).

**-finput**:*filename*
:   Specify the input floppy image file.

**-foutput**:*filename*
:   Specify the output floppy image file.

**-conv**:*FORMAT*
:   Convert the input image to the given format. Use **-modulelist** for the list
    of valid FORMAT values.

**-reffile**:*filename*
:   Sector-to-sector copy mode. Use *filename* as the reference image that
    provides the disk layout; each sector is then updated from the input image.
    Must be combined with **-conv**.

**-uselayout**:*DISKLAYOUT*
:   Apply the raw disk layout *DISKLAYOUT* to the image. Use **-rawlist** for
    the list of valid DISKLAYOUT values.

**-usb**:*DRIVE*
:   Start the USB HxC Floppy Emulator server using *DRIVE* as the floppy image.

**-infos**
:   Print detailed information about the input image.

**-ifmode**:*INTERFACE_MODE*
:   Select the floppy interface mode. Use **-interfacelist** for valid values.

**-singlestep**
:   Force single-step mode when writing the output image.

**-doublestep**
:   Force double-step mode when writing the output image.

**-list**
:   List the files contained in the floppy image.

**-getfile**:*FILE*
:   Extract *FILE* from the floppy image to the current directory.

**-putfile**:*FILE*
:   Inject *FILE* into the floppy image.

# EXAMPLES

Convert a disk image to HFE format:

    hxcfe -finput:"input.img" -conv:HXC_HFE -foutput:"output.hfe"

Convert a disk image to both HFE and BMP in one pass:

    hxcfe -finput:"input.img" -conv:HXC_HFE -foutput:"output.hfe" \
          -conv:BMP_DISK_IMAGE -foutput:"output.bmp"

Convert a raw image to HFE using a specific disk layout:

    hxcfe -finput:"input.img" -uselayout:PUMA_ROBOT_DD_640KB \
          -conv:HXC_HFE -foutput:"output.hfe"

Generate an empty HFE image from a disk layout (no input image needed):

    hxcfe -uselayout:PUMA_ROBOT_DD_640KB -conv:HXC_HFE -foutput:"output.hfe"

Sector-to-sector copy using a reference image for the layout:

    hxcfe -finput:"input.hfe" -conv:HXC_HFE -foutput:"output.hfe" \
          -reffile:"reference.hfe"

# SEE ALSO

**hxcfloppyemulator**(1)

Project website: <https://hxc2001.com>

# BUGS

Report bugs at <https://github.com/jfdelnero/HxCFloppyEmulator/issues>.

# AUTHORS

Jean-François DEL NERO <hxc2001@hxc2001.com>

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>

# COPYRIGHT

Copyright (C) 2006-2026 Jean-François DEL NERO / HxC2001.
License GPLv2+: GNU GPL version 2 or later <https://www.gnu.org/licenses/gpl-2.0.html>.
