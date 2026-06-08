% propulse(1) "Propulse Tracker 0.9.6.1" "" "2026-06-10" "General Commands Manual"
% Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-06-10

# NAME

**propulse** - crossplatform tracker compatible with Amiga ProTracker modules

# SYNOPSIS

**propulse** [*file*]

# DESCRIPTION

**Propulse** is a tracker for creating and playing Amiga ProTracker compatible
modules (.MOD), using an interface inspired by Impulse Tracker and Schism
Tracker.

It features a highly accurate playback engine based on 8bitbubsy's work,
itself derived from a disassembly of the original Amiga ProTracker firmware.
Test cases such as *black_queen.mod* and MPT test modules play correctly.

An optional *file* argument can be passed to open a module directly on startup.

# OPTIONS

**propulse** does not currently support command-line options beyond opening a
file on startup.

# FEATURES

- Familiar keyboard commands from Impulse Tracker and Schism Tracker
- Fully configurable keybindings, colour palettes, bitmap fonts, and screen
  layouts
- WAV export with optional loop and fade out
- Integrated mouse-driven sample editor

# SUPPORTED FORMATS

**MOD**
:   Loads and saves Amiga ProTracker modules, including 15-sample Ultimate
    SoundTracker mods, NoiseTracker, and PowerPacked files.

**P61A**
:   Imports The Player 6.1a crunched modules.

**IT**, **S3M**
:   Imports Impulse Tracker and Scream Tracker 3 modules.

**Samples**
:   raw, IFF 8SVX, WAV, MP3, and Ogg Vorbis (requires BASS library).

# FILES

*~/.config/propulse/*
:   Per-user configuration directory (keybindings, colour palette, settings).

*/usr/share/propulse/data/*
:   Shared data files (fonts, palettes, icons).

# BUGS

No known bugs. Please report issues at <https://github.com/hukkax/Propulse/issues>.

# SEE ALSO

**schismtracker**(1)

# AUTHOR

Propulse was written by hukka <https://github.com/hukkax>.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>.
