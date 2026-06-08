% UNLZX(1) unlzx 2.0 | General Commands Manual
% Nicolas HOUDELOT
% 2026

# NAME

unlzx - extract or list files from Amiga LZX archives

# SYNOPSIS

**unlzx** [**-v**|**-x**] [**-c**] [*archive* ...]

# DESCRIPTION

**unlzx** extracts or lists the contents of LZX archives.

LZX is a lossless data compression format based on the LZ77 algorithm,
originally developed for the Amiga computer platform. It uses Huffman coding
with two compression modes: stored (uncompressed) and packed (compressed).
Merged blocks spanning multiple files within a single compressed stream are
also supported.

Each extracted file is verified against a CRC-32 checksum stored in the
archive header. A mismatch is reported but does not abort further processing.

Without any option, **unlzx** defaults to extraction mode (**-x**).

# OPTIONS

**-c**
:   Read the archive from standard input instead of a named file.

**-v**
:   List the contents of the archive: file sizes, timestamps, protection
    attributes, and filenames. Does not extract any file.

**-x**
:   Extract files from the archive into the current directory, recreating
    sub-directory trees as needed. This is the default mode.

# EXIT STATUS

**0**
:   All archives processed successfully.

**1**
:   An error occurred during extraction or listing (corrupt data, I/O
    error, invalid archive).

**2**
:   Invalid usage (unknown option or missing file arguments).

# EXAMPLES

List the contents of an archive:

    unlzx -v game.lzx

Extract all files from an archive:

    unlzx game.lzx

Extract from standard input:

    cat game.lzx | unlzx -c

# SEE ALSO

**lha**(1), **unar**(1)

# BUGS

No known bugs.
Report issues to the Debian package maintainer.

# AUTHORS

Originally written by Jonathan Forbes and Tomi Poutanen (1995).
Stdin support added by Erik Meusel (2001).

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
