% luisita(1) User Commands | luisita
% Soledad Penades; Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-06-09

# NAME

luisita - Lua-scripted OpenGL graphics environment for real-time demos

# SYNOPSIS

**luisita** **-s** *script* [*options*]

# DESCRIPTION

**luisita** is a scriptable graphics environment inspired by Processing, built
on top of Lua and C++. It provides a simple, minimalist API for writing
real-time graphical applications (demos) without requiring deep OpenGL knowledge
or manual C++ memory management.

A Luisita demo consists of a Lua script that calls the built-in functions for
graphics, image loading, camera control, lighting, fog, and audio playback.
The script must define at least a **setup()** function and a **draw(ticks)**
function. **setup()** is called once at startup; **draw()** is called every
frame with the elapsed time in milliseconds.

Luisita uses **Lua** for scripting, **BASS** for audio playback, **OpenGL**
(via GLEW) for rendering, and **SOIL** for image loading.

# OPTIONS

**-s** *filename*, **--script-name** *filename*
: Name of the Lua script to execute. This option is required.

**-w** *pixels*, **--width** *pixels*
: Window width in pixels (default: 1024).

**-h** *pixels*, **--height** *pixels*
: Window height in pixels (default: 768).

**--fullscreen**
: Run in fullscreen mode (default: windowed).

**--antialias**
: Enable multisample antialiasing (default: disabled).

**--antialias-samples** *N*
: Number of multisample antialiasing samples to use (default: 4).
  Has no effect unless **--antialias** is also specified.

**-t** *seconds*, **--start-time** *seconds*
: Begin playback at *seconds* into the timeline (default: 0).
  Useful for debugging a specific moment in a demo.

**-l**, **--list-modes**
: List available hardware-accelerated fullscreen resolutions and exit.

**-?**, **--help**
: Show a brief usage summary and exit.

# LUA API

The following global functions are available inside Lua scripts:

## Setup and control

**setupIsDone**()
: Signal that the **setup()** function has completed initialisation.

**quit**()
: Request application exit.

**windowTitle**(*title*)
: Set the window title string.

**width**(), **height**()
: Return the current window width or height in pixels.

**trace**(*message*)
: Print *message* to standard output (debugging aid).

## 2D / 3D primitives

**beginShape**([*type*]), **endShape**()
: Begin and end a vertex sequence. *type* can be SHAPE_POINTS,
  SHAPE_LINES, SHAPE_LINE_STRIP, SHAPE_TRIANGLES, SHAPE_TRIANGLE_STRIP,
  SHAPE_QUADS, SHAPE_QUAD_STRIP, or SHAPE_POLYGON.

**vertex**(*x*, *y*[, *z*]), **normal**(*nx*, *ny*, *nz*)
: Add a vertex or surface normal to the current shape.

**line**(*x1*, *y1*, *x2*, *y2*), **triangle**(*x1*, *y1*, *x2*, *y2*, *x3*, *y3*)
: Draw a line or triangle directly.

**stipple**(), **noStipple**()
: Enable or disable line stippling.

## Colour

**background**(*r*, *g*, *b*[, *a*])
: Set the background (clear) colour.

**fill**(*r*, *g*, *b*[, *a*]), **noFill**()
: Set or disable the fill colour for shapes.

**stroke**(*r*, *g*, *b*[, *a*]), **noStroke**()
: Set or disable the outline colour for shapes.

**color**(*r*, *g*, *b*[, *a*]), **colorMode**(*mode*)
: Set the current drawing colour or the colour interpretation mode.

**strokeWeight**(*w*), **pointSize**(*s*)
: Set the stroke width or point size in pixels.

## Images and textures

**loadImage**(*filename*)
: Load an image file and return a texture identifier.

**image**(*texId*, *x*, *y*, *w*, *h*)
: Draw texture *texId* at (*x*, *y*) with size *w* × *h*.

**useTexture**(*texId*), **noTexture**()
: Bind or unbind a texture for subsequent geometry.

## Camera and projection

**ortho**([*w*, *h*]), **restoreProjection**()
: Switch to orthographic (2D) projection or restore the previous one.

**camera**(*eyeX*, *eyeY*, *eyeZ*, *centerX*, *centerY*, *centerZ*, *upX*, *upY*, *upZ*)
: Position the 3D camera (equivalent to gluLookAt).

**perspective**(*fov*, *aspect*, *zNear*, *zFar*)
: Set a perspective projection.

**depthTest**(), **noDepthTest**()
: Enable or disable OpenGL depth testing.

## Blending

**blending**(*mode*), **noBlending**()
: Enable a blending mode or disable blending entirely.
  *mode* is one of BLENDING_ALPHABLEND, BLENDING_ADDITIVE,
  BLENDING_SUBSTRACTIVE, BLENDING_MULTIPLY, BLENDING_COLORMULTIPLY.

## Lights

**lightEnabled**(*n*), **noLights**()
: Enable OpenGL light *n* or disable all lights.

**lightPosition**(*n*, *x*, *y*, *z*), **lightAmbient**(*n*, *r*, *g*, *b*, *a*)
: Set the position or ambient colour of light *n*.

**lightDiffuse**(*n*, *r*, *g*, *b*, *a*), **lightSpotDirection**(*n*, *x*, *y*, *z*)
: Set the diffuse colour or spot direction of light *n*.

## Fog

**fogMode**(*mode*), **fogDensity**(*d*), **fogStartEnd**(*start*, *end*), **fogColor**(*r*, *g*, *b*, *a*)
: Configure OpenGL fog. *mode* is one of FOG_NONE, FOG_LINEAR, FOG_EXP,
  FOG_EXP2.

## Audio

**loadMusicStream**(*filename*)
: Load an audio file and return a stream handle.

**playMusicStream**(*handle*)
: Start playback of stream *handle*.

**isMusicStreamFinished**(*handle*)
: Return true when stream *handle* has finished playing.

**getMusicStreamTime**(*handle*), **getMusicStartPosition**()
: Return the current playback position in seconds, or the value passed
  via **--start-time**.

# EXAMPLES

Run the bundled hello-world script in a 1280 × 720 window:

    luisita -s samples/001-hello.lua -w 1280 -h 720

Run a demo in fullscreen with antialiasing from the 30-second mark:

    luisita -s demo.lua --fullscreen --antialias -t 30

List available fullscreen resolutions:

    luisita --list-modes

# BUGS

No known bugs. Please report issues at
<https://github.com/sole/luisita/issues>.

# AUTHORS

Luisita was written by Soledad Penades <http://soledadpenades.com>.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>.

# SEE ALSO

**lua**(1), **glew**(3)
