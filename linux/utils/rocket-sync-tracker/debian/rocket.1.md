% rocket-sync-tracker(1) Rocket Sync-Tracker User Manual
% Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2024-03-13

# NAME

rocket-sync-tracker - sync-tracker editor for demoscene productions

# SYNOPSIS

**rocket-sync-tracker** [*FILE*]

# DESCRIPTION

**Rocket** is a sync-tracker, a tool for synchronizing music and visuals in
demoscene productions. It provides a Qt5-based GUI editor and an ANSI C client
library (**librocket**) that can either communicate with the editor over a
network socket during development, or play back an exported data-set in the
final release.

The editor is laid out like a music-tracker: tracks (columns) hold named
variables; rows represent discrete points in time. Key-frames can be set at
any row; Rocket interpolates between adjacent key-frames according to a
per-key-frame interpolation mode.

If *FILE* is provided, the specified **.rocket** project file is opened on
startup.

# INTERPOLATION MODES

**Step**
:   Always returns the exact value of the key-frame (no interpolation).

**Linear**
:   Linearly interpolates between the current and the next key-frame value.

**Smooth**
:   Applies a smooth-step (S-curve) interpolation between two values.

**Ramp**
:   Like Linear, with an additional exponentiation applied to the
    interpolation factor.

# KEYBOARD SHORTCUTS

**Up**/**Down**/**Left**/**Right**
:   Move the cursor.

**PgUp**/**PgDn**
:   Move the cursor 16 rows up or down.

**Home**/**End**
:   Move the cursor to the beginning or end of the track.

**Ctrl+Left**/**Ctrl+Right**
:   Move the current track left or right.

**Enter**
:   Enter a key-frame value at the cursor position.

**Del**
:   Delete the key-frame at the cursor position.

**i**
:   Cycle through interpolation modes.

**k**
:   Toggle a bookmark on the current row.

**Alt+PgUp**/**Alt+PgDn**
:   Jump to the previous or next bookmarked row.

**Space**
:   Pause or resume demo playback.

**Shift+Up**/**Down**/**Left**/**Right**
:   Extend the selection.

**Ctrl+C**
:   Copy the selection.

**Ctrl+V**
:   Paste.

**Ctrl+Z**
:   Undo.

**Shift+Ctrl+Z**
:   Redo.

**Ctrl+B**
:   Bias (offset) the selected key-frames.

**Shift+Ctrl+Up**/**Shift+Ctrl+Down**
:   Quick-bias the selection by ±0.1.

**Ctrl+Up**/**Ctrl+Down**
:   Quick-bias the selection by ±1.

**Ctrl+PgUp**/**Ctrl+PgDn**
:   Quick-bias the selection by ±10.

**Shift+Ctrl+PgUp**/**Shift+Ctrl+PgDn**
:   Quick-bias the selection by ±100.

# FILES

***.rocket**
:   Project file containing all tracks and key-frames for a production.

**~/.config/rocket/**
:   Per-user Qt application settings.

# NOTES

During development, **rocket-sync-tracker** listens on TCP port **1338**
(default) for incoming connections from a demo client linked against
**librocket**. All edits made in the editor are mirrored to the demo client
in real time. For the final release, the demo is compiled with the
**SYNC_PLAYER** preprocessor symbol defined, and plays back the data-set
previously exported from the editor.

# BUGS

Report bugs at: <https://github.com/rocket/rocket/issues>

Or to the Rocket mailing list: <rocket-dev@googlegroups.com>

# SEE ALSO

The full documentation and examples are available in
**/usr/share/doc/rocket-sync-tracker/**.

# AUTHORS

Developed by the Rocket dev team.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
