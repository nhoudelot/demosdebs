% sugarconvdsk(1) SugarConvDsk 1.0.216 User Manual
% Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-03-28

# NAME

sugarconvdsk - convert Amstrad CPC disk image formats

# SYNOPSIS

**sugarconvdsk** *source* [*destination*] [**-s=**_side_] [**-second=**_path_] [**-o=**_outputformat_] [**-r**] [**-f=**_filter_]

**sugarconvdsk** **-cat=**_user_ [**-sort**] [**-l**] [**-c**] *source*

# DESCRIPTION

**SugarConvDsk** converts Amstrad CPC disk dump files between various formats.
It supports a wide range of input and output formats including DSK, EDSK, HFE,
IPF, SCP, CT-RAW, and Kryoflux.

When the **-cat** option is not used, **sugarconvdsk** performs a format
conversion. When **-cat** is used, it displays the disk directory contents
without performing any conversion; in that case, *destination* and all
conversion flags are ignored.

Internally, the tool converts any supported format into an MFM-based
representation that handles weak bits, optional bits, and multi-revolution
tracks, then writes it back in the chosen output format.

# OPTIONS

## Conversion mode

**-s=**_side_
:   Select the disk side to convert. *side* must be **1** or **2**.
    If omitted, both sides are written (where relevant for the chosen format).

**-second=**_path_
:   Replace the second side of the disk with the dump source file at *path*.

**-o=**_outputformat_
:   Select the output format. Accepted values:

    **EDSK** — Extended DSK format (default),
    **HFE**  — HFE format,
    **IPF**  — Interchangeable Preservation Format,
    **SCP**  — Supercard Pro format.

    If omitted, the default output format is EDSK.

**-r**
:   If *source* is a directory, convert files recursively.

**-f=**_filter_
:   If *source* is a directory, apply a filename filter (e.g. **[CPC]*.dsk**).

## Catalog mode

**-cat=**_user_
:   Display the disk directory for the given CP/M *user* number (0–15).
    Use **ALLUSERS** to display entries for all users.
    This option prevents any conversion from taking place.

**-sort**
:   Sort the listed files in alphabetical order.

**-l**
:   Display one file per line. Adds flag **H** for hidden files and **R** for
    read-only files.

**-c**
:   Display files on a single line, separated by semicolons.

## General

**--help**
:   Display a usage summary and exit.

# OPERANDS

*source*
:   Source disk image file or directory. Supported input formats:

    **CTRAW**    — CT-RAW format,
    **DSK**      — standard DSK format,
    **EDSK**     — Extended DSK format,
    **HFE**      — HFE format,
    **IPF**      — Interchangeable Preservation Format,
    **SCP**      — Supercard Pro format,
    **KRYOFLUX** — Kryoflux RAW file set.

    If *source* is a directory, every file in that directory is converted
    and saved to the *destination* directory.

*destination*
:   Output file or directory. If *source* is a directory, *destination* is
    used as the output directory.

# EXAMPLES

Convert a single file to IPF format:

    sugarconvdsk disk.dsk output.ipf -o=IPF

Recursively convert all **[CPC]*.dsk** files from **/dump** to IPF, storing
results in **/result**:

    sugarconvdsk /dump /result -o=IPF -r -f=[CPC]*.dsk

Display the directory of a disk image for CP/M user 0:

    sugarconvdsk -cat=0 disk.dsk

Display all users' files, sorted alphabetically, one per line:

    sugarconvdsk -cat=ALLUSERS -sort -l disk.dsk

# BUGS

No known bugs. Please report issues at <https://github.com/Tom1975/SugarConvDsk/issues>.

# AUTHORS

Tom1975.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>.
