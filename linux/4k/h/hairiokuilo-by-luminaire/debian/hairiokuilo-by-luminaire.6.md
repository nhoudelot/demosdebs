% hairiokuilo-by-luminaire(6) Häiriökuilo User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Claude Opus 5.5,Luminaire
% 2026-11-14

# NAME
hairiokuilo-by-luminaire - the command to run Häiriökuilo.

# SYNOPSIS
hairiokuilo-by-luminaire [*options*]

# DESCRIPTION
Häiriökuilo is a 4k intro released by Luminaire in august 2017.
Ended 7th in the combined 4k competition at Assembly 2017.

The intro runs in a window. The music is generated as raw audio
(16 bits, stereo, 44100 Hz) on the standard output of the intro, and the
command pipes it to **aplay**(1).

# OPTIONS
\--help
:   Display help for the command

The intro stops by itself after about 53 seconds. Escape quits.

# NOTES
Only a packed 32-bit binary was released. The Debian version is the
unpacked binary, patched to stay in a window, because fullscreen breaks the
display with SDL 1.2. The intro always renders in 1920x1080.

The binary is also patched at build time so that the picture is displayed
with current OpenGL drivers (it stayed white): with NVIDIA, the shader
program was never used, and Mesa refused the shader.

# INFOS
https://www.pouet.net/prod.php?which=71449

# SEE ALSO
**aplay**(1)

# BUGS
No known bugs.
