% aacgain(1) Version 2.0.0 | User Commands
% Christian Marillat <marillat@deb-multimedia.org>
% 2026-06-07

## NAME

**aacgain** - normalizes the volume of digital music files

## SYNOPSIS

**aacgain** [*options*] *\<infile\>* [*\<infile 2\>* ...]

## DESCRIPTION

**aacgain** version 2.0.0, derived from **mp3gain** version 1.5.2,
copyright (c) 2001-2009 by Glen Sawyer.
AAC support copyright (c) 2004-2009 David Lasker, Altos Design, Inc.

Uses **mpglib**, available at <http://www.mpg123.de>.
AAC support uses **faad2** (<http://www.audiocoding.com>) and
mpeg4ip's **mp4v2** (<http://www.mpeg4ip.net>).

## OPTIONS

**-v**
:   Show version number.

**-g** *i*
:   Apply gain *i* without doing any analysis.

**-l 0** *i*
:   Apply gain *i* to channel 0 (left channel) without doing any analysis.
    **ONLY** works for STEREO files, not Joint Stereo.

**-l 1** *i*
:   Apply gain *i* to channel 1 (right channel).

**-e**
:   Skip Album analysis, even if multiple files are listed.

**-r**
:   Apply Track gain automatically (all files set to equal loudness).

**-k**
:   Automatically lower Track/Album gain to avoid clipping audio.

**-a**
:   Apply Album gain automatically. Files are all from the same album: a
    single gain change is applied to all files, so their loudness relative
    to each other remains unchanged, but the average album loudness is
    normalized.

**-m** *i*
:   Modify suggested MP3 gain by integer *i*.

**-d** *n*
:   Modify suggested dB gain by floating-point *n*.

**-c**
:   Ignore clipping warning when applying gain.

**-o**
:   Output is a database-friendly tab-delimited list.

**-t**
:   Write modified MP3 to a temp file, then delete the original (default).
    A temp file is always used for AAC files regardless of this option.

**-T**
:   Directly modify the MP3 file in place (opposite of **-t**).
    Ignored for AAC files.

**-q**
:   Quiet mode: no status messages.

**-p**
:   Preserve original file timestamp.

**-x**
:   Only find maximum amplitude of file.

**-f**
:   Assume input file is an MPEG 2 Layer III file (i.e. do not check for
    mis-named Layer I or Layer II files). This option is ignored for AAC
    files.

**-?** or **-h**
:   Show this help message.

**-i** *n*
:   Select audio track index *n* when the AAC file contains multiple audio
    tracks (0-based index, default: 0). Has no effect on MP3 files.

**-s c**
:   Only check stored tag info (no other processing).

**-s d**
:   Delete stored tag info (no other processing).

**-s s**
:   Skip (ignore) stored tag info (do not read or write tags).

**-s r**
:   Force re-calculation (do not read tag info).

**-s i**
:   Use ID3v2 tag for MP3 gain info.

**-s a**
:   Use APE tag for MP3 gain info (default).

**-u**
:   Undo changes made (based on stored tag info).

**-w**
:   "Wrap" gain change if gain+change > 255 or gain+change < 0.
    MP3 only. See the **WRAP EXPLANATION** section below for details.

## NOTES

- If you specify **-r** and **-a**, only the second one will take effect.

- If you do not specify **-c**, the program will stop and ask for
  confirmation before applying a gain change to a file that might clip.

- Unlike MP3 files, AAC normalization is **not** completely reversible.
  The **-u** option restores the file to a functionally equivalent state,
  but the result will not be bit-for-bit identical to the original.

## WRAP EXPLANATION

The "global gain" field that **aacgain** adjusts is an 8-bit unsigned
integer, so possible values range from 0 to 255.

Most MP3 files do not exceed a global gain of 230, leaving ample headroom
to increase gain by up to 37 dB without issue.

The problem arises at the bottom of the range. Some encoders create frames
with a global gain of 0 for silent frames. Historically, mp3gain wrapped
the result up to 255 when lowering gain below 0, ensuring that a file
lowered and then raised by the same amount remained bit-for-bit identical.

However, some encoders produce 0-gain frames that contain actual audio
data. While the global gain is 0, this data is inaudible; but if gain is
lowered, the global gain wraps to a very large value, potentially causing a
brief, very loud blip on playback.

The current default behavior is therefore **not** to wrap gain changes:

1. If a gain change would lower a frame's global gain below 0, it is
   clamped to 0.
2. If a gain change would raise a frame's global gain above 255, it is
   clamped to 255.
3. If a frame's global gain is already 0, it is not changed, even for a
   positive gain change.

Use **-w** to restore the original wrapping behavior. The **-w** option is
not supported for AAC files; applying it to an AAC file is treated as an
error and the file will not be modified.

## SEE ALSO

**mp3gain**(1)

## AUTHORS

**aacgain** was written by David Lasker, Altos Design, Inc., based on
**mp3gain** by Glen Sawyer.

This manual page is maintained by Christian Marillat
\<marillat@deb-multimedia.org\>.

## COPYRIGHT

Copyright (C) 2004-2009 David Lasker, Altos Design, Inc.
Copyright (C) 2001-2009 Glen Sawyer (mp3gain).

This program is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the Free
Software Foundation; either version 2 of the License, or (at your option)
any later version.
