% raytro-by-wamma(6) Raytro User Manuals
% Nicolas HOUDELOT <nicolas@demosdebs.org>,Claude Opus 5.5,glaze/wAMMA
% 2026-11-17

# NAME
raytro-by-wamma - run Raytro, a 4k intro by glaze/wAMMA

# SYNOPSIS
raytro-by-wamma [*-f*|*\--fullscreen*]

# DESCRIPTION
Raytro 4k intro for GNU/Linux by glaze/wAMMA, released @ Pouet.net 2008-02-27

This is my first released 4k intro. I don't like C, especially
when coding 3D stuff, but C++ is too bloaty and asm is non-portable.
I didn't use music in this intro, because I'm more interested to
discover how much graphics code I can get into 4k.

I also tried to compile a win32 version using i586-mingw32msvc-gcc that
came with Kubuntu (it uses gcc 3.4.5). There was missing/weird graphics
in some places, so I didn't include a win32 build.

The intro is rendered in a 512x384 window, which can be resized.

# OPTIONS
-f, \--fullscreen
:   Run in fullscreen mode, as the original release did. The picture is
    scaled to the screen, keeping its aspect ratio.

# KEYS
F
:   Toggle fullscreen mode.

Any other key
:   Quit the intro.

# INFOS
https://www.pouet.net/prod.php?which=49797

# BUGS
No known bugs.
