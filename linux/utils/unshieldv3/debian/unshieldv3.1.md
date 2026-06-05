% unshieldv3(1) unshieldv3 User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org), Wolfgang Frisch
% 2026-06-05

# NAME
**unshieldv3** - extract InstallShield V3 (Z) archives

# SYNOPSIS
**unshieldv3** *COMMAND* [*options*] [*arguments*]

# DESCRIPTION
**unshieldv3** extracts files from InstallShield V3 archives (Z format).

InstallShield Z format is a compressed archive format used by version 3 of
the InstallShield installation software. Z files can be recognised by their
magic marker: `13 5D 65 8C 3A 01 02 00`. Contained files are compressed with
the PKware implode algorithm.

# COMMANDS

**help**
:   Display a usage summary and exit.

**info** *ARCHIVE.Z*
:   Show metadata for *ARCHIVE.Z*: file count, compressed size, uncompressed
    size, and multi-volume information when applicable.

**list** [**-v**] *ARCHIVE.Z*
:   List the contents of *ARCHIVE.Z*.
    With **-v**, also display the uncompressed size and the timestamp of each
    file.

**extract** *ARCHIVE.Z* *DESTDIR*
:   Extract all files from *ARCHIVE.Z* into the existing directory *DESTDIR*,
    recreating the internal directory structure.

# EXAMPLES

List files in an archive with verbose output:

    unshieldv3 list -v NETSCAPE.Z

Show archive metadata:

    unshieldv3 info NETSCAPE.Z

Extract an archive to /tmp/out:

    unshieldv3 extract NETSCAPE.Z /tmp/out

# EXIT STATUS

**0**
:   Success.

**1**
:   An error occurred (archive not found, destination directory missing, write
    failure, or invalid usage).

# BUGS
No known bugs. Please report issues at
<https://github.com/wfrisch/unshieldv3/issues>.

# SEE ALSO
**unshield**(1) — extracts later InstallShield archive formats.

# AUTHORS
Wolfgang Frisch <wfrisch@riseup.net>.

Packaged for Debian by Nicolas HOUDELOT <nicolas@demosdebs.org>.
