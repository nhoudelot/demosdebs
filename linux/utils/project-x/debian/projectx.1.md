% PROJECTX(1) Project X 0.91.10 | User Commands
% Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% June 2026

# NAME

projectx - DVB demultiplexing and stream repair utility

# SYNOPSIS

**projectx** [*OPTIONS*] [*FILE*...]

# DESCRIPTION

**Project X** is a free, Java-based utility designed to demultiplex, clean
up, and repair DVB (Digital Video Broadcasting) transport streams. European
digital radio and television use the DVB standard to broadcast data; Project X
lets you inspect those transmissions, handle a wide variety of stream types,
and correct errors introduced during reception or recording.

It can operate both with a graphical user interface (GUI) and in headless
command-line mode, making it suitable for use in automated workflows and
on servers without a display.

Supported input formats include MPEG-1/2 Transport Streams (TS), Program
Streams (PS/VOB), PVA streams (AVerMedia, Technisat), and recordings from
various set-top boxes (Dreambox, Topfield). Output can be demultiplexed
elementary streams (video, audio, subtitles) or re-muxed container files.

# OPTIONS

**-gui**
:   Start with the graphical user interface, even when input files are
    provided on the command line.

**-?**
:   Print a brief usage summary and exit.

**-ini** *FILE*
:   Use *FILE* as the configuration file instead of the default
    `~/.projectx/projectx.conf`.

**-out** *DIRECTORY*
:   Write output files to *DIRECTORY* (must already exist).

**-name** *BASENAME*
:   Use *BASENAME* as the base name for output files.

**-demux**
:   Demultiplex the input stream into separate elementary streams (default
    action).

**-tovdr**
:   Convert the input stream to VDR-compatible format.

**-tom2p**
:   Convert the input stream to MPEG-2 Program Stream (M2P) format.

**-topva**
:   Convert the input stream to PVA format.

**-tots**
:   Convert the input stream to MPEG-2 Transport Stream (TS) format.

**-filter**
:   Apply PID filtering only, without full demultiplexing.

**-id** *PIDLIST*
:   Restrict processing to the PIDs listed in *PIDLIST* (comma-separated
    decimal or hexadecimal values prefixed with `0x`).

**-cut** *FILE*
:   Load cut/trim points from *FILE*.

**-chp** *FILE*
:   Load chapter markers from *FILE*.

**-split** *SIZE*
:   Split output files at *SIZE* megabytes.

**-log**
:   Write a processing log alongside the output files.

**-saveini**
:   Save the current settings back to the configuration file on exit.

**-webif**
:   Start the built-in HTTP interface for remote control.

**-set** *KEY=VALUE*
:   Override a single configuration key at runtime. This option may be
    repeated to set multiple keys.

**-dvx1**
:   Enable DVX mode 1: split project file output.

**-dvx2**
:   Enable DVX mode 2: split output with RIFF header for AC-3 audio.

**-dvx3**
:   Enable DVX mode 3: split output with RIFF header for MPEG audio.

**-dvx4**
:   Enable DVX mode 4: split output with RIFF headers for both AC-3 and
    MPEG audio.

# FILES

`~/.projectx/projectx.conf`
:   Default user configuration file. Created automatically on first run.
    If an `~/X.ini` file is found, it is migrated to this location.

# ENVIRONMENT

`JAVA_HOME`
:   Path to the Java Runtime Environment used to launch Project X.

# SEE ALSO

**java**(1)

# BUGS

Bug reports should be submitted to the upstream tracker at
<https://sourceforge.net/p/project-x/bugs/>.

# AUTHOR

Project X was written by dvb.matt, with contributions from TheHorse,
R-One, roehrist, pstorch, chrisg, jazzydane, Kano, RoEn, catapult, Bonni,
MartinR, and others.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
