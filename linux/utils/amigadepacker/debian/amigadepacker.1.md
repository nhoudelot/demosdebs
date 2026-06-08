---
title: AMIGADEPACKER
section: 1
date: 2026-06-08
header: User Commands
footer: amigadepacker 0.04
---

# NAME

amigadepacker - Tool for depacking compressed Amiga formats

# SYNOPSIS

**amigadepacker** [**-c**] [**-h**] [**-o** *outfile*] [**-p**] [**-v**] *FILE* ...

# DESCRIPTION

**amigadepacker** depacks compressed Amiga formats. PowerPacker (PP20/PX20),
XPK SQSH, MMCMP and StoneCracker 4.04 (S404) formats are supported.
Amigadepacker will automatically determine the compressed format by content.
Among other things, the tool is useful for playing packed Amiga music formats
with **uade**(1).

If no files are given, the data is read from standard input and written to
standard output.

If files are given, amigadepacker tries to unpack them in place, overwriting
the given files with unpacked data.

If a single file and **-c** is given, unpacked data is written to standard output.

If a single file and **-o** *outfile* is given, unpacked data is written to
*outfile*.

The tool can also be used to decrypt PowerPacker encrypted files. Note that
this operation may take a significant amount of time.

# OPTIONS

**-c**
:   Unpack to standard output (when regular files have been given as parameters).

**-h**, **--help**
:   Display help and exit.

**-o** *outfile*, **--output-file** *outfile*
:   Write decrunched data into *outfile* instead of overwriting the source file.

**-p**, **--pretend**
:   Pretend to unpack, but do not write any output. Prints names of packed files
    to standard error. Pretend mode always returns success if arguments are valid.
    This is useful for searching packed files.

**-v**, **--version**
:   Display version information and exit.

# EXAMPLES

Unpack a file in place:

    amigadepacker foo

Unpack a file from standard input to standard output:

    amigadepacker < foo > foo.depacked

Find all packed files under /path without unpacking:

    find /path/ -type f -print0 | xargs -0 amigadepacker --pretend --

# SUPPORTED FORMATS

**PowerPacker (PP20/PX20)**
:   A popular compression format from the Amiga era, widely used for music modules.

**XPK SQSH**
:   A squash compression format from the XPK (eXternal PacKer) library.

**MMCMP**
:   Music Module Compression, identified by the "ziRCONia" signature.

**StoneCracker 4.04 (S404)**
:   A compression format from the Amiga demoscene.

# GIT REPOSITORY

The latest version of amigadepacker can be obtained with:

    git clone https://gitlab.com/heikkiorsila/amigadepacker.git 

# AUTHORS

**amigadepacker** was written by Heikki Orsila \<heikki.orsila@iki.fi\>.

- XPK SQSH decompressor by Bert Jahn \<jah@fh-zwickau.de\>
- PowerPacker depacker and decrypter by Stuart Caie \<kyzer@4u.net\>
- MMCMP depacker by Olivier Lapicque \<olivierl@jps.net\>
- StoneCracker (S404) depacker by Jouni "Spiv" Korhonen

The amigadepacker web site is at: <https://gitlab.com/heikkiorsila/amigadepacker>

# SEE ALSO

**lha**(1), **ppcrack**(1), **unadf**(1), **unlzx**(1), **xdms**(1), **xPK**(1)
