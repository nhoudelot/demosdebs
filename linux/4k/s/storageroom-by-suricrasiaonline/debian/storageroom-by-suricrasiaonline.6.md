% storageroom-by-suricrasiaonline(6) Storage Room User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Claude Opus 5.5,Suricrasia Online
% 2026-11-19

# NAME
storageroom-by-suricrasiaonline - the command to run Storage Room.

# SYNOPSIS
storageroom-by-suricrasiaonline [*GTK options*]

# DESCRIPTION
Storage Room is a 2k executable graphics released by Suricrasia Online in
June 2020, ranked 3rd in the 4k procedural graphics competition at NOVA 2020.

blackle [code, gfx]

The demo opens fullscreen and renders, line by line, a single 1920x1080
image with a GLSL path tracer. The time spent on the rendering is printed
on the standard output when it is finished.

The screen must be at least 1920 pixels wide, otherwise nothing is
rendered. On a larger screen, the image is drawn in the bottom left corner.
OpenGL 4.3 is required.

Press Escape to quit.

# OPTIONS
The demo only accepts the standard GTK options (see **gtk-options**(7)),
for example **\-\-display**.

# ENVIRONMENT
**SAMPLES**=*number*
:   Number of samples per pixel. A higher number gives a cleaner image but
    takes longer to render. The default value is 300.

    Example: **SAMPLES=50 storageroom-by-suricrasiaonline**

# SEE ALSO
* Official page: <https://suricrasia.online/demoscene/storage_room.html>
* Source code: <https://github.com/Suricrasia-Online/Storage-Room>
* Pouët: <https://www.pouet.net/prod.php?which=85914>
* Demozoo: <https://demozoo.org/productions/279417/>
* Shadertoy: <https://www.shadertoy.com/view/WtsyRH>

# BUGS
Nothing is rendered on screens less than 1920 pixels wide.
