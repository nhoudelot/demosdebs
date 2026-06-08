---
title: RRIP_CLI
section: 1
header: User Commands
date: 2026-06-10
author: "Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>"
---

# NAME

rrip_cli - secure audio CD ripper, command-line interface

# SYNOPSIS

**rrip_cli** [**-V**] [**-f** *FILE*] [**-v**] [**-c**] [**-d**] [**-B**] [**-h**]

# DESCRIPTION

**rrip_cli** is the command-line interface of Rubyripper, a secure audio CD
ripper inspired by Exact Audio Copy (EAC). It uses **cdparanoia**(1) in a
sophisticated way to ensure accurate rips: each track is ripped multiple times
and the results compared chunk by chunk to detect and correct read errors.

When launched without **-d**, **rrip_cli** presents an interactive text menu
allowing the user to review disc metadata, select tracks, and configure all
ripping parameters before starting.

## Interactive menus

The main menu provides access to five preference categories:

**Secure ripping**
: Drive device path, drive read offset, missing sample padding, extra
cdparanoia parameters, required chunk matches (normal and erroneous), maximum
rip attempts, automatic disc ejection after ripping, and log file policy.

**TOC analysis**
: Cuesheet generation, single-file (image) rip mode, hidden audio sector
ripping, pre-gap handling (prepend or append), and pre-emphasis correction
(cuesheet tag or sox processing).

**Codecs**
: Enable/disable and configure encoding options for FLAC, Ogg Vorbis (oggenc),
MP3 (LAME), AAC (Nero), AAC (Fraunhofer), WavPack, Opus, WAV, and any
external encoder. Also controls playlist generation, maximum encoding threads,
and audio normalisation (replaygain or normalize).

**Metadata**
: Choice of metadata provider (none, GnuDB, or MusicBrainz), GnuDB server
and credentials, and MusicBrainz country/date preferences.

**Other**
: Output base directory, file naming schemes for normal albums, various-artist
albums, and single-file rips (using substitution variables **%a** artist,
**%b** album, **%g** genre, **%y** year, **%f** codec, **%n** track number,
**%t** track title, **%va** various artist). Also configures log viewer,
file manager, and verbose/debug modes.

# OPTIONS

**-V**, **\-\-version**
: Print the current version of Rubyripper and exit.

**-f** *FILE*, **\-\-file** *FILE*
: Load preferences from *FILE* instead of the default configuration file.
  If the file does not exist, default preferences are used and a warning is
  printed.

**-v**, **\-\-verbose**
: Enable verbose output during ripping and encoding.

**-c**, **\-\-configure**
: Open the interactive preferences menu on startup, before scanning the disc.

**-d**, **\-\-defaults**
: Skip all interactive menus and start ripping immediately using the current
  preferences.

**-B**, **\-\-batch**
: Exit automatically once the rip is complete. Useful in combination with
  **-d** for unattended operation.

**-h**, **\-\-help**
: Print a usage summary and exit.

# FILES

**$XDG_CONFIG_HOME/rubyripper/settings**
: User configuration file (defaults to **~/.config/rubyripper/settings** when
  **XDG_CONFIG_HOME** is not set). Created on first run.

# SEE ALSO

**rrip_gui**(1), **cdparanoia**(1), **flac**(1), **oggenc**(1), **lame**(1)

# AUTHOR

Rubyripper was written by Bouke Woudstra and is maintained at
<https://github.com/bleskodev/rubyripper>.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
