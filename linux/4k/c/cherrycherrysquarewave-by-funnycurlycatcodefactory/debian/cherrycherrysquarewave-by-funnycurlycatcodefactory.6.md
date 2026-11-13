% cherrycherrysquarewave-by-funnycurlycatcodefactory(6) Cherry Cherry Square Wave User Manuals
% Nicolas HOUDELOT <nicolas@demosdebs.org>,Claude Opus 5.5,Funny Curly Cat Code Factory
% 2026-11-13

# NAME
cherrycherrysquarewave-by-funnycurlycatcodefactory - run the Cherry Cherry Square Wave 4k intro

# SYNOPSIS
**cherrycherrysquarewave-by-funnycurlycatcodefactory** [**\-\-help**]

# DESCRIPTION
Cherry Cherry Square Wave is a Linux 4k intro released by Funny Curly Cat
Code Factory (FCCCF) in March 2019. It ranked 4th in the combined intro
compo at Instanssi 2019.

muffintrap [code]

The intro opens an SDL 1.2 window and draws flowers with OpenGL, on a raw
square wave soundtrack. Tools used: Lubuntu 18.04, Spacemacs, Clang and
zopfli.

Upstream ships an original version, whose audio is very clippy and
distorted, and a "fixed audio" version. This package installs the fixed
audio version only.

# OPTIONS
**\-\-help**
:   display a short usage message and exit.

# INFOS
https://www.pouet.net/prod.php?which=80567

# BUGS
Since Ubuntu 24.04 and Debian 13, SDL 1.2 is provided by sdl12-compat
(on top of SDL 2).
