% funzy_enterkey(1) | funzyto770 User Manuals
% Nicolas HOUDELOT <nicolas@demosdebs.org>; Sylvain Huet
% 2026-06-09

# NAME

funzy_enterkey - interactively define the keyboard layout for funzyto770

# SYNOPSIS

**funzy_enterkey**

# DESCRIPTION

**funzy_enterkey** is an interactive X11 utility that creates the keyboard
layout file **keyto7** required by **funzyto770**(1). It prompts the user to
press each of the 68 keys one by one: 58 TO7 keyboard keys and 10 joystick
directions and buttons (5 per joystick).

The program opens an empty X11 window. The user must keep the mouse pointer
inside that window during the entire procedure. Instructions for each key are
printed to the terminal.

The resulting **keyto7** file is written in the current working directory and
must be present in that directory when **funzyto770**(1) is launched (unless
a different file is specified with the **-k** option).

This program only needs to be run once, or again whenever the keyboard mapping
needs to be redefined.

# OPTIONS

This program accepts no options.

# FILES

*keyto7*
:   Output keyboard layout file, written in the current directory.
    Contains 68 X11 key codes, one per line.

# EXAMPLES

Define the keyboard layout before running the emulator for the first time:

    funzy_enterkey

Follow the prompts in the terminal, pressing the corresponding key on the
physical keyboard for each TO7 key name displayed. Once all 68 keys have been
entered, the file **keyto7** is created automatically.

Then launch the emulator:

    funzyto770

# SEE ALSO

**funzyto770**(1)

# BUGS

No known bugs.

# AUTHORS

Written by Sylvain Huet in 1994. Packaged for Debian by Nicolas HOUDELOT
<nicolas@demosdebs.org>.
