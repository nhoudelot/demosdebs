% strata-by-luminaire(6) Strata User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Claude Opus 5.5,Luminaire
% 2026-11-19

# NAME
strata-by-luminaire - the command to run Strata.

# SYNOPSIS
strata-by-luminaire [*options*]

# DESCRIPTION
Strata is a 4k intro released by Luminaire in august 2015.
Ended 5th in the combined 4k competition at Assembly 2015.

The intro runs in a 1280x720 window, synchronized with the vertical
refresh. The music is generated as raw audio (16 bits, stereo, 44100 Hz)
on the standard output of the intro, and the command pipes it to
**pw-play**(1) when PipeWire runs, else to **paplay**(1) when PulseAudio
runs, else to **aplay**(1).

cyndis [code, graphics]
Jontte [code, graphics]
jnalanko [music]

# OPTIONS
\--help
:   Display help for the command

The intro stops by itself after 118 seconds. Escape quits.

# NOTES
Only a packed 32-bit binary was released. The Debian version is the
unpacked binary, patched to stay in a window.

The binary is also patched at build time so that the picture is displayed
with current OpenGL drivers: with NVIDIA, the shader program was never used
and the window stayed white, and Mesa refused the shader. The intro now
quits cleanly at the end instead of crashing.

# INFOS
https://www.pouet.net/prod.php?which=66090

# SEE ALSO
**pw-play**(1), **paplay**(1), **aplay**(1)

# BUGS
No known bugs.
