% IXALANCE(1) ixalance 1.0.6 | User Commands
% Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% June 2026

# NAME

ixalance — DOS32 demo loader for Linux (The Black Lotus demo system)

# SYNOPSIS

**ixalance** [*OPTIONS*] *demo.ixa*

# DESCRIPTION

**ixalance** is a DOS32 protected-mode demo loader for Linux.
It was originally written by Jurjen Katsman (The Black Lotus, TBL) and ported
to Linux and SDL by Jarno Paananen.

It runs TBL demo files (**.ixa** archives) by emulating the 32-bit protected-mode
environment the demos expect, while rendering graphics through SDL2 and playing
music through libopenmpt and SDL2 audio.

The program opens a resizable SDL2 window at the native resolution of each demo
effect (typically 320×200, 640×480, or 800×600) and scales it to fill the window
while preserving the original aspect ratio.

# OPTIONS

**-m***x*
:   Set the audio mixing rate to *x* Hz (e.g. **-m44100**).

**-o***x*
:   Set the output mode.
    Valid values: **8** (8-bit), **1** (16-bit), **s** (stereo), **m** (mono).

**-f***x*
:   Set the interpolation filter.
    Valid values: **0** (none), **1** (less), **2** (more).

**-i**
:   Enable oversampling (interpolation).

**-s***W***x***H*
:   Force the initial window size to *W*×*H* pixels (e.g. **-s800x600**).

**-d**
:   Write debugging output to **debug.txt** in the current directory.

**-t**
:   Print frames per second to standard output.

**-F**
:   Start in fullscreen mode.

# KEYBOARD SHORTCUTS

**F**
:   Toggle fullscreen / windowed mode at any time during playback.
    Fullscreen uses **SDL_WINDOW_FULLSCREEN_DESKTOP** so the desktop
    resolution is preserved; the demo image is centred and letter-boxed
    to maintain the correct aspect ratio.

**ESC**
:   Quit the program cleanly.

# FILES

*debug.txt*
:   Debug log written in the current working directory when **-d** is used.

# EXIT STATUS

**0**
:   Normal exit (demo finished or user pressed **ESC**).

**1**
:   Error (missing or unreadable demo file, SDL initialisation failure, etc.).

# BUGS

The program only runs **.ixa** archives produced by The Black Lotus demo system;
it is not a general-purpose DOS emulator.

Code compiled from **code.asm** is i386 protected-mode only; the binary must be
built as a 32-bit ELF executable (**-m32**).

# SEE ALSO

**sdl2-config**(1)

Upstream iXalance/Linux home page: <http://www.s2.org/iXalance/>

TBL demo archive: <http://www.tbl.org/tbl32.htm>

# AUTHORS

Jurjen Katsman (The Black Lotus) — original DOS32 demo system.

Jarno Paananen <jpaana@s2.org> — Linux/SDL port.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>.
