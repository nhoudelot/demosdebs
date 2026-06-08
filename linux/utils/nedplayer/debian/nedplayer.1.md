% nedplayer(1) NED Player User Manual
% bartoshe; Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-06-09

# NAME

nedplayer - runtime player for NED scripting language productions

# SYNOPSIS

**nedplayer**

# DESCRIPTION

**nedplayer** is a runtime engine for productions written in the NED
scripting language, part of the Dead Deer framework developed by
bartoshe. It is primarily used for demoscene content, interactive
presentations and simple games.

The player must be invoked from the directory that contains the
**data/** sub-directory with a valid **player.conf** file. On startup
it reads that configuration file to determine which NED script to load
and which display mode to use.

The engine supports:

- OpenGL hardware-accelerated 3-D rendering
- OpenAL positional audio
- Vorbis/Ogg music playback
- JPEG 2000 image decoding
- TrueType font rendering via FreeType
- A built-in NED scripting virtual machine for animations, particle
  systems, physics and finite-state machines

# OPTIONS

**nedplayer** takes no command-line options. All configuration is read
from the **data/player.conf** file located in the current working
directory.

# FILES

*./data/player.conf*
: Main configuration file. The first line gives the path to the NED
  script to execute (relative to the current directory). Subsequent
  lines may contain display-mode hints such as **fullscreen**,
  **windowed** or **fullscreenlowres**.

*./data/*
: Directory containing all assets (scripts, images, sounds, fonts)
  used by the production.

# EXIT STATUS

**0**
: Normal exit.

**non-zero**
: The player could not initialise (missing **data/player.conf**,
  OpenGL context failure, etc.).

# BUGS

No known bugs. Please report issues to the Debian package maintainer.

# SEE ALSO

The Dead Deer project homepage: <https://deaddeer.free.fr/>

# AUTHORS

bartoshe.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>.
