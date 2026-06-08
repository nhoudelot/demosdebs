% KRYOFLUXUI(1) KryoFlux 3.50 | User Commands

# NAME

kryofluxui - KryoFlux graphical user interface

# SYNOPSIS

**kryofluxui** [*OPTIONS*]

# DESCRIPTION

**kryofluxui** launches the KryoFlux graphical user interface, a Java-based
multi-platform application that provides a visual front-end to **dtc**(1),
the KryoFlux Disk Tool Console.

The GUI covers the most common KryoFlux operations and is recommended for
users who are not familiar with the command line. Any action performed through
the GUI is ultimately translated into **dtc** command-line calls; every
feature available in the GUI is therefore also accessible programmatically
via **dtc** directly.

The main window is organised into three areas:

- **Track grid** (upper left): 84 blocks representing the track positions on
  the disk surface. Colour coding indicates the result of each dumped track:
  green = decoded without errors, grey = noise or unknown encoding,
  red = errors found (retrying), yellow = warnings or additional header data,
  glowing = track currently being processed.

- **Track info** (upper right): displays detailed information for the selected
  track, with tabs for **Histogram** and **Scatter** views (available for
  STREAM format only). In the scatter view, keys **F1**–**F5** select a
  revolution, **a** animates revolutions, **r**/**Shift-r** adjusts the
  display RPM by ±5, and **i** toggles the info overlay.

- **Control section** (lower area): shows the current track, drive controls,
  output filename, format selector, and status line.

## Profiles

The format selector relies on *profiles*. A profile is a named set of
**dtc** parameters describing how a disk should be dumped. Profiles can be
cloned and customised. Multiple profiles can be active simultaneously by
choosing **\<multiple\>** in the format selector, enabling combined outputs
such as STREAM files alongside a decoded AmigaDOS ADF in a single pass.

## Requirements

**kryofluxui** requires Java 8 (OpenJDK 8 or later, or Eclipse Temurin).
The **dtc** package must also be installed and the KryoFlux hardware must be
set up beforehand (see **dtc**(1) and the full manual in
`/usr/share/doc/dtc-doc/`).

# OPTIONS

All options are passed directly to the underlying Java Virtual Machine or to
**dtc**. Refer to the KryoFlux manual for GUI-specific profile configuration.

# FILES

`/usr/share/kryoflux/kryoflux-ui.jar`
:   KryoFlux GUI Java archive.

`/usr/share/applications/kryofluxui.desktop`
:   Desktop entry for application menu integration.

`/usr/share/icons/hicolor/128x128/apps/kryofluxui.png`
:   Application icon.

# SEE ALSO

**dtc**(1)

Full documentation: `/usr/share/doc/dtc-doc/`

# AUTHORS

KryoFlux GUI by Kieron Wilkinson.
KryoFlux software and firmware by István Fábián.
Linux port by Adam Nielsen.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
