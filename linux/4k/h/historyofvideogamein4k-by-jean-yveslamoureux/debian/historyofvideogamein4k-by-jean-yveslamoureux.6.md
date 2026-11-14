% historyofvideogamein4k-by-jean-yveslamoureux(6) History of video game in 4k User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Claude Opus 5.5,Jean-Yves Lamoureux
% 2026-11-14

# NAME
historyofvideogamein4k-by-jean-yveslamoureux - the command to run History of video game in 4k.

# SYNOPSIS
historyofvideogamein4k-by-jean-yveslamoureux [**\--fullscreen**]

# DESCRIPTION
History of video game in 4k is a 4k intro written in ANSI C by Jean-Yves
Lamoureux for the 4k source compo of 2004. It is a brief history of video
games, from the 70's to the 90's, in less than 4096 bytes of source code:
a title in bitmap font, a pong, a road (vroom), a raycaster (doom), and a
scroller whose text is the name of the source file.

The intro runs in a 640x480 window, without sound, and stops by itself
after about 2 minutes 10 seconds.

# OPTIONS
\--fullscreen
:   Start in fullscreen

# KEYS
Escape
:   Quit (closing the window also quits)

Any other key
:   Skip to the next part

# NOTES
The Debian version enables V-Sync (SDL12COMPAT_SYNC_TO_VBLANK=1, unless
already set in the environment): the pong moves one step per frame, and it
would last a fraction of a second without V-Sync.

# INFOS
https://320x200.org/2004/4k/

# BUGS
No known bugs.
