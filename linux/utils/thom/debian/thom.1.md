% thom(1) | thom User Manuals
% Nicolas HOUDELOT <nicolas@demosdebs.org>; Eric Botcazou; Sylvain Huet
% 2026-06-10

# NAME

thom - Thomson TO7-70 home computer emulator

# SYNOPSIS

**thom** [**-m** *file.m7*] [**-nodisk**] [**-fast**] [**-nosound**]
[**-geometry** *wxh+x+y*] [**-noshm**] [**-display** *displayname*]
[**-help**]

# DESCRIPTION

**thom** emulates the Thomson TO7-70, a French 8-bit home computer based on
the Motorola MC6809E processor. It faithfully reproduces the hardware of the
TO7-70, including the MC6809E CPU, memory card, video card, and the following
peripherals: optical pen (light pen), joysticks, cassette tape reader, and
floppy disk controller.

The emulator requires an X11 display and GTK+ 1.2. Sound output is provided
via PulseAudio.

The TO7-70 ROM is not included for copyright reasons and must be obtained
separately. ROM files must be placed in **/usr/share/thom/**.

## Control Panel

Pressing **ESC** suspends emulation and opens the control panel. From this
menu, the following operations are available:

- Reset the TO7-70 (equivalent to pressing the Reset button on the machine)
- Cold restart (power cycle)
- Adjust emulation speed: exact (MC6809E at 1 MHz) or maximum (full speed,
  disables sound)
- Manage the cartridge slot (Mémo7 format, *.m7*)
- Manage the cassette tape reader (*.k7* format)
- Manage up to four floppy disk drives (*.sap* format, Thomson 5"25 360 KB)

## Keyboard

The TO7-70 keyboard is fully emulated on an AZERTY layout. Key mappings:

- **STOP** → Tab
- **CNT** → Left Ctrl
- **RAZ** → End
- **ACC** → Alt
- **HOME** → Home
- **INS** → Insert
- **EFF** → Delete
- Arrow keys → Arrow keys
- **#** is mapped to **ù** (Shift+2)

## Joysticks

The numeric keypad emulates joystick 0 (8 directions); Fire is mapped to
Right Ctrl.
The left keyboard block (A–E, Q–D, W–C) emulates joystick 1 while still
sending the corresponding letters to the TO7-70; Fire is mapped to Left Ctrl.

## Optical Pen

The mouse emulates the TO7-70 optical pen. The left button acts as the pen
tip. The right button toggles the mouse cursor visibility.

## Sound

Both the internal 1-bit sound generator and the external 6-bit generator
(Musique et Jeux interface) are emulated. Sound is output via PulseAudio.

## Graphics Modes

The emulator supports 8, 16, 24, and 32-bit X11 color depths. The default
window size is 640x400; the **-geometry 320x200** option selects a smaller,
faster-rendering window.

# OPTIONS

**-help**
:   Display command-line help.

**-m** *file.m7*
:   Load the Mémo7 ROM cartridge image *file.m7* at startup.

**-nodisk**
:   Disable the floppy disk controller.

**-fast**
:   Start the emulator at maximum speed (sound is disabled in this mode).

**-nosound**
:   Disable sound output.

**-geometry** *wxh+x+y*
:   Set the window geometry. Two sizes are supported: **640x400** (default)
    and **320x200** (faster rendering).

**-noshm**
:   Disable the MIT-SHM X11 shared memory extension.

**-display** *displayname*
:   Specify the X server to connect to.

# FILES

*/usr/share/thom/*
:   Directory where the TO7-70 ROM files must be placed.

*memo7/*
:   Recommended directory for Mémo7 ROM cartridge images (*.m7*).

*k7/*
:   Recommended directory for cassette tape images (*.k7*).

*disks/*
:   Recommended directory for Thomson 5"25 floppy disk images (*.sap*).

# EXAMPLES

Start the emulator with default settings:

    thom

Start the emulator with a Mémo7 cartridge preloaded:

    thom -m memo7/basic128.m7

Start at maximum speed (no sound):

    thom -fast -nosound

Start in 320x200 windowed mode:

    thom -geometry 320x200

Connect to a specific X server:

    thom -display :1

# SEE ALSO

**xrandr**(1)

# BUGS

No known bugs.

# AUTHORS

Written by Sylvain Huet in 1996. Extended and ported to Linux/Windows by
Eric Botcazou (1999-2003). Updated for modern Linux systems in 2016.
Packaged for Debian by Nicolas HOUDELOT <nicolas@demosdebs.org>.
