---
title: RRIP_GUI
section: 1
header: User Commands
date: 2026-06-10
author: "Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>"
---

# NAME

rrip_gui - secure audio CD ripper, GTK3 graphical interface

# SYNOPSIS

**rrip_gui**

# DESCRIPTION

**rrip_gui** is the GTK3 graphical interface of Rubyripper, a secure audio CD
ripper inspired by Exact Audio Copy (EAC). It uses **cdparanoia**(1) in a
sophisticated way to ensure accurate rips: each track is ripped multiple times
and the results compared chunk by chunk to detect and correct read errors.

On startup, **rrip_gui** automatically scans the CD drive and fetches disc
metadata from GnuDB or MusicBrainz (according to preferences). The main
window presents five buttons in a left-side panel:

**Preferences**
: Opens the preferences dialog with sections for Secure ripping, TOC analysis,
Codecs, Metadata, and Other settings. These mirror the options available in
the command-line interface **rrip_cli**(1).

**Scan drive**
: Re-reads the disc currently in the drive and refreshes the track listing
and metadata.

**Open tray / Close tray**
: Ejects or loads the disc drive.

**Rip cd now!**
: Starts the ripping and encoding process using the current preferences and
track selection. A progress view shows ripping and encoding progress along
with the live log output.

**Exit / Abort**
: Exits the application, or aborts an ongoing rip when one is in progress.

## Preferences dialog

The preferences dialog provides the same configuration options as the
interactive menus in **rrip_cli**(1):

- **Secure ripping**: drive device, offset, padding, cdparanoia parameters,
  chunk match counts, maximum attempts, ejection policy, log policy.
- **TOC analysis**: cuesheet, single-file image mode, hidden tracks,
  pre-gap handling, pre-emphasis.
- **Codecs**: FLAC, Ogg Vorbis, MP3 (LAME), AAC (Nero or Fraunhofer),
  WavPack, Opus, WAV, external encoder, playlist generation, encoding
  threads, audio normalisation.
- **Metadata**: provider selection (GnuDB or MusicBrainz), server settings,
  country and date preferences.
- **Other**: output directory, file naming schemes, log viewer, file manager.

# FILES

**$XDG_CONFIG_HOME/rubyripper/settings**
: User configuration file (defaults to **~/.config/rubyripper/settings** when
  **XDG_CONFIG_HOME** is not set). Created on first run and shared with
  **rrip_cli**(1).

**~/.local/share/rubyripper/**
: Local cache for GnuDB metadata entries.

# SEE ALSO

**rrip_cli**(1), **cdparanoia**(1), **flac**(1), **oggenc**(1), **lame**(1)

# AUTHOR

Rubyripper was written by Bouke Woudstra and is maintained at
<https://github.com/bleskodev/rubyripper>.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
