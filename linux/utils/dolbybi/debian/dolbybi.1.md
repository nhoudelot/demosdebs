% dolbybi(1) dolbybi 0.0+20180403 | Dolby B software decoder
% Richard Evans; Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2018-04-03

# NAME

dolbybi - Dolby B software decoder for digitised cassette tape recordings

# SYNOPSIS

**dolbybi** *\<infile.wav\>* *\<outfile.wav\>* [*options*]

# DESCRIPTION

**dolbybi** is a command-line program that decodes audio files digitised from
cassette tapes recorded in Dolby B. It was written by Richard Evans between
August 2014 and April 2016 as an experimental program.

Dolby B noise reduction is normally built into a tape deck, where the audio
level fed into the decode circuits is approximately correct. When using this
program, the audio must have already been extracted and digitised, so some
trial and error is needed to find the correct level (see **LEVEL ADJUSTMENT**).

Only WAV type 1 files are supported as input and output.

# OPTIONS

## Gain

**\/IG**:*n*
:   Gain applied to the input file in dB (default: 0.0).

**\/OG**:*n*
:   Gain applied to the output file in dB (default: 0.0). Does not affect
    the decoding itself.

**\/TG**:*n*
:   Gain applied internally to change the threshold voltage for noise
    reduction, in dB (default: 0.0). Adjusting this is generally preferable
    to adjusting /IG, as it does not change the output level.

## Output format

**\/OB**:*n*
:   Override output bit depth to 8, 16, or 24 bit. If not specified, the
    output bit depth matches the input file.

## Partial decode

**\/ST**:*n*
:   Start of decode section, in seconds. Allows selecting a subsection of
    the file to decode faster and avoid RIFF 64 format.

**\/LN**:*n*
:   Length of decode section, in seconds. Note: the first few moments of the
    selected section may not be decoded correctly, as it takes time for the
    gain control circuits to stabilise.

## Decode accuracy and performance

**\/DA**:*n*
:   Accuracy of decode, in dB (default: -5.0). A value of 0.0 means about
    1 sample value accuracy. Higher values decode faster but less accurately;
    lower values are more accurate but slower.

**\/US**:*n*
:   Upsample rate (default: 0, meaning automatic). When set to 0, the
    upsample rate is chosen so that the upper sample rate is at least 200 kHz.
    For example, with 44.1 kHz input, /US defaults to 5 (5 × 44.1 = 220.5 kHz).
    Use /US:1 to disable upsampling.

**\/IB**:*n*
:   Input buffer size in MB (default: 0, unlimited). By default, the entire
    wave file is read into memory before processing. Use this option to limit
    the buffer size when memory is insufficient.

**\/FM**:*n*
:   Filtering mode for the side path (default: 4). Four modes are available:
    1 is the original method; 2 is a newer method that generally works better
    than 1; 3 is an alternative rearrangement similar to 1; 4 gives the best
    results in practice.

## Verbosity

**\/S**:*n*
:   Silent mode. Use /S:1 for reduced output, /S:2 for minimal output.

## RIFF 64 format

**\/NO64**
:   Never use RIFF 64 format. If the output would exceed the standard WAV
    size limit, the end of the file is truncated instead.

**\/USE64**
:   Always use RIFF 64 format, regardless of output size.

By default, RIFF 64 is used only when the output file would otherwise exceed
the standard WAV size limit. Not all media players support RIFF 64.

## Encode mode

**\/ENC**
:   Run a Dolby B encode instead of a decode.

## Miscellaneous

**\/ALL-HIGH**
:   Upsample audio throughout the entire program, not only when required.
    This significantly slows processing with no observed improvement in results.

**\/RETRY**
:   If the input file cannot be opened, wait approximately one second and
    try again instead of exiting with an error.

**\/NOWARN**
:   Normally the program pauses at the end if warnings were issued. This
    option disables that pause.

**\/NR-Off**
:   Turn off all noise reduction. Mostly useful for calibration.

\--help
:   Display help for the command.

## Calibration

**\/CAL**
:   Run a calibration process. Most users do not need this, as the default
    calibration values are already built into the program code. If a
    recalibration is needed (e.g. after changing a parameter file), this
    option makes the process more automatic. Results can be saved with
    /PE:\<filename\>. Calibration with a valid input wave file uses the
    file's sample rate; without one, /CF:n sets the rate.

**\/CF**:*n*
:   Sample rate for calibration (default: 44100). Used with /CAL when no
    valid input wave file is provided.

## Parameter files

**\/PF**:*\<filename\>*
:   Read program parameters from the specified file. Intended for advanced
    users who wish to experiment with internal program settings.

**\/PE**:*\<filename\>*
:   Create an example parameter file based on current settings. Options at
    their default values are included but commented out using curly brackets.
    The file can then be edited and read back in with /PF.

# LEVEL ADJUSTMENT

Dolby B noise reduction is normally applied inside a tape deck where the
audio level is approximately correct. When using this program, the audio must
have already been extracted and digitised, and no automatic level detection is
possible.

The recommended approach is to decode the same sample section at several
threshold values, compare the results, and then refine the search:

```
dolbybi Test.wav Out00.wav /tg:0.0
dolbybi Test.wav Out05.wav /tg:5.0
dolbybi Test.wav Out10.wav /tg:10.0
dolbybi Test.wav Out15.wav /tg:15.0
dolbybi Test.wav Out20.wav /tg:20.0
```

Prefer adjusting **\/TG** (threshold gain) over **\/IG** (input gain), because
/TG does not change the output level, making it easier to compare outputs.
In practice, a threshold difference of about 1 dB is audible.

If the output sounds muffled, especially on quiet parts and transients, the
threshold may be set too low. If the sound is scratchy or has excessive
treble on quiet parts and transients, the threshold may be set too high.

Negative threshold and gain values are accepted but are rarely needed.

# MULTITHREADING

The program does not use multithreading internally, but multiple instances can
run in parallel (one per CPU core) to process several threshold values at the
same time. On Linux:

```
dolbybi Test.wav Out00.wav /tg:0.0 &
dolbybi Test.wav Out05.wav /tg:5.0 &
dolbybi Test.wav Out10.wav /tg:10.0 &
wait
```

# SUPPORTED WAVE FORMATS

Only WAV type 1 is supported (multi-channel type 2 is not supported).

- **Channels**: 1 (mono) or 2 (stereo)
- **Bit depth**: 8, 16, or 24 bit (other depths are rounded up to the nearest supported value)
- **Sample rate**: 8000 to 4000000 Hz (all testing was done at 44100 Hz)
- **Sample encoding**: linear PCM only

Floating point and higher bit depth WAV files are not supported.
Output files are in the same format as the input unless modified by
**\/OB**, **\/ST**, or **\/LN**.

# PARAMETER ENTRY

Command-line parameters are case-insensitive: **/IG:1.1** and **/Ig:1.1** are
equivalent. Real values may include a decimal point or be entered as integers.
Negative values are prefixed with a minus sign, e.g. **/OG:-1.1**.

# BUGS

No known bugs.

# SEE ALSO

**sox**(1), **ffmpeg**(1)

# AUTHORS

Richard Evans (original program).

Nicolas HOUDELOT \<nicolas@demosdebs.org\> (Debian packaging).
