% bythepond-by-tkln(6) By the Pond User Manuals
% Nicolas HOUDELOT <nicolas@demosdebs.org>,Claude Opus 5.5,tkln
% 2026-11-13

# NAME
bythepond-by-tkln - run the By the Pond 4k intro

# SYNOPSIS
**bythepond-by-tkln** [**\-\-help**]

# DESCRIPTION
By the Pond is a 4k intro released by tkln in August 2018.
It ranked 12th in the combined 4k compo at Assembly 2018.

tkln [code, graphics, music]

The intro opens a window and renders a pond scene raymarched in a single
OpenGL 3.3 fragment shader. It needs an OpenGL 3.3 capable driver.

# OPTIONS
**\-\-help**
:   display a short usage message and exit.

# INFOS
https://www.pouet.net/prod.php?which=77426

# BUGS
Since Ubuntu 24.04 and Debian 13, SDL 1.2 is provided by sdl12-compat
(on top of SDL 2): the intro runs slower than with the original SDL 1.2.
See /usr/share/doc/bythepond-by-tkln/README.Debian.
