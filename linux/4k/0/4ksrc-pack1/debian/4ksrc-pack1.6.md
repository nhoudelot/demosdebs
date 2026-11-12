% 4ksrc-pack1(6) 4k source compo pack User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Claude Opus 5.5,Jylam,tonic,spectre/flare,termos and styx
% 2026-11-13

# NAME
4ksrc-pack1-3d, 4ksrc-pack1-hogwagen, 4ksrc-pack1-dwitvs, 4ksrc-pack1-randomname - entries of the 2003 #demoscene 4k source compo

# SYNOPSIS
**4ksrc-pack1-3d**

**4ksrc-pack1-hogwagen**

**4ksrc-pack1-dwitvs** [**-f** | **\-\-fullscreen**]

**4ksrc-pack1-randomname**

# DESCRIPTION
The first #demoscene 4k source compo was organized in March 2003 by the
regulars of the #demoscene IRC channel. Unlike usual 4k compos, the 4 KB
limit applied to the C source code of the entries, not to the executable.
This package contains the four entries, in their final ranking:

**4ksrc-pack1-3d**
:   "3d" by Jylam, winner of the compo (7 votes out of 15): textured voxel
    particles, plasma, noise, rasters, zoom, sinus bars and a sinus scroll,
    with generated sound. SDL, 400x300 window.

**4ksrc-pack1-hogwagen**
:   "Lollipop hogwagen" by tonic (5 votes): a tunnel effect with a music-like
    noise based on a composition by Tense. SDL, 400x300 window.

**4ksrc-pack1-dwitvs**
:   "different wavelengths in the visible spectrum" by spectre/flare
    (2 votes): one minute of colour grids, rotozoom and wobbling logo. SDL,
    400x300 window.

**4ksrc-pack1-randomname**
:   "oh the nos! its termos and styx' code!" by termos and styx (1 vote):
    a textured, blended icosahedron. OpenGL and GLUT, fullscreen.

"3d" and dwitvs advance their animation by a fixed step at each frame: the
Debian package limits them to 60 frames per second so that they keep their
original speed on current hardware.

# OPTIONS
**-f**, **\-\-fullscreen**
:   (4ksrc-pack1-dwitvs only) run in fullscreen.

The other programs have no options.

# KEYS
Any key quits the intros. "3d" and dwitvs also stop by themselves at the
end of their last scene. Closing the window does not quit the SDL entries:
press a key instead.

# INFOS
https://320x200.org/2003/4k/

https://www.pouet.net/prod.php?which=50507

# BUGS
No known bugs.
