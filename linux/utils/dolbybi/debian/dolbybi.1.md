% dolbybi(1) Dolby Bi User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Richard Evans
% 2017-08-17

# NAME
dolbybi - the command to run Dolby Bi.

# SYNOPSIS
dolbybi <Infile.wav> <outfile.wav> [*options*]

# DESCRIPTION
Dolby Bi is a program released by Richard Evans in 2016.

# OPTIONS

Options currently are
/IG:n or /IG:n.n = Gain applied to  input file in Db (Default is 0.0)
/OG:n or /OG:n.n = Gain applied to output file in Db (Default is 0.0)
/TG:n or /TG:n.n = Gain applied internally to change threshold
                   voltage for noise reduction, in Db (Default is 0.0)
/OB:n            = Override output bit depth to 8, 16 or 24 bit
/ST:n            = Start of decode section in seconds.
/LN:n            = Length of decode section in seconds.
/DA:n or /DA:n.n = Accuracy of decode, in Db. 0.0 is one sample value.
/US:n            = Upsample rate ( default is 0 which means set automatically )
/IB:N            = Input buffer size, in MB.
/FM:n            = Filtering mode.
/S:n             = Silent modes.
/NO64            = Nerver use RIFF 64
/USE64           = Always Use RIFF 64
/ENC             = Run a Dolby encode (Default is a decode).
/ALL-HIGH        = Up Sample for the whole program, not just when needed.
/RETRY           = If the input file can not be opened,
                   then wait a while and try again.
/NOWARN          = Norally if the program issues warnings, it will pause
                   at the end, to give the user time to read the warnings.
                   /NOWARN will stop the program does not pause at the end.
/NR-Off          = Turn off all noise reduction.
                   This is mostly useful for calibration.

/CAL             = Run a calibration process.
/CF:n            = Sample rate for calibration process.
/PF:<file name>  = Name of file used to change program parameters.
/PE:<file name>  = Create example parameter file, based upon current settings.


More details on the options
---------------------------
/IG apply gain, +ve or -ve to the input audio. This could be used to adjust the
    level for decoding, but I would normally recommend using /TG instead.

/OG apply gain, +ve or -ve to the output audio. This will not change the 
	decoding, however if, for whatever reason, the output audio is not at the
	correct level then this option can be used to adjust it.

/TG This actually adjusts the gain when the audio is fed to the Dolby gain
	control circuits. So increasing /TG would have the same effect as making the
	input louder ( or increasing /IG ) except that is would have no significant
	affect to the level of the output.

/OB If (for whatever reason) you want the output audio to have a different bit
	depth then it can be set by this option.
    8 bit would probably be of little use, but it was easy to implement so I
    thaught I might as well include it.
    16 bit would probably be best for most uses.
    24 bit is possibly overkill, but it may be of some use.
    I didn't try to implement anything greater than 24, as I'm not certain how
    those standards work, and I think 16 bit is probably ample anyway.
    If output bit depth is not specified, then it is kept the same as the input
    file.

/ST and
/LN To allow the program to run faster, and to avoid the need to use RIFF 64, a
    partial section of the file can be selected. This is not meant to be an
    accurate editing tool, so it can only be selected to the nearest second. 
    /ST will select the start of the section to be decoded (in seconds), and /LN
    will select the length (also in seconds).
    Note. The 1st few moments of the audio section will probably not be decoded
    correctly, as it takes a moment for the Dolby gain control circuits to
    adjust to the audio.

/DA In decode mode the program has to use trial and error to get to the right
	output sample values. This parameter sets how accurate it needs to be before
	it is considered OK. Setting a higher value would be less accurate, but it
	may make the decode faster. Setting a lower value would be more accurate,
	but it may make the program slower. A figue of 0.0 Db would mean an accuracy
	of about 1 sample value.
    The default is -5.0 Db, so that is accurate to less than one sample value.

/US I discovered that digital filtering only works well, if the sample rate is
	well above the fc of the filter. For the DolbyB sliding filter fc can be as
	high as about 34k, and this does not work well if the sample rate is only
	44.1 Khz. To get around this I up sample the audio to a higher rate just
	when I passes through this filter. A low pass filter should normally be used
	when changing sampling rate but this would make the program much slower, and
	I think the way I have done things, a filter is probably not necessary. If
	however there are problems then up sampling could be switch off by using 
	/US:1. Using 44.1Khz without up sampling may be OK, but if not, then the
	best
    option would be to up sample the audio before using this program. This would
    require some other program.

    A value of 0, or less, will select the default, which will mean that the
    upsample rate is set so that the upper sample rate will be at least 200Khz.
    Eg. For an input sample rate of 44.1 Khz, /US will default to 5, so that the
    upper sample rate would be 5 * 44.1 = 220.5 Khz.

/IB By default, the program now reads the entire wave file into memory, before
	trying any processing. The idea of this is to free up the input file as
	quickly as possible for other threads. This might just cause a problem with
	the computer running out of memory, for example if the input file is very 
	large, and the computer doesn't have much memory.
	So /IB can be used if necessary to limit the size of the input buffer to the
	nearest MB.
    If used then the program will simply process what it has so far, before
    readin in more.
    The default is /IB:0, which means the buffer is unlimited.

/FM The program originally followed an analog circuit for a Dolby B noise
	reducer. However I found that doing this caused possible problems, due to 
	too much filtering in the side path, which was altering the phase of the
	side path audio. This cased problems when ths side path was recombined with
	the main path. Basically signals don't add together very well, if there is
	too much difference in the phase.
	
    To fix this I experimented with outher ways of performing the filtering in 
    the side path with hopefully less of a phase change. To cut a long story
    short there are now 4 filter modes.
    /FM:1 is the original method.
    /FM:2 is a newer method that seems to work better than 1.
    /FM:3 is another rearangement, which in practice doesn't seem to be any
    better than 1.
    /FM;4 seems to work best, hence I have made this the default mode.

/S  To write a bit less information to se screes use /S:1
    To write a lot less information to se screes use /S:2


/NO64 Instead of using RIFF 64 format, as described by the note above, the
	output is shortened by missing off some of the end.

/USE64 RIFF 64 format, as described by the note above, is always used
	regardless of the size of the output.

/ENC It may be necessary to try encoding a file, and this is actually easier to
	do in software than decoding. So I have added this option.

/ALL-HIGH By default the program only upsamples the audio when it needs to, (to
	run it through  a filter with a high fc). If /All-High is selected then this
	behaviour is changed so that up sampled audio is used throughout the
	program. However this does seem to make the program a lot slower, and I have
	so far not found any difference in the results.

/RETRY If the program is not able to open the input file, instead of just
	exiting with an error, the program will wait about a second, and then try
	again.
    I did intend this to get around a problem with multiple threads no being
    able to open the same input file at the same time. However I've now found
    out how to open the input file as a read only file. So different threads
    should no longer have any trouble opening the same input file, at the same
    time.

/CAL  and
/CF:n The original analog circuit required some calibration, basically setting
	the gain in the side path, and the voltage on the Source Pin of the FET.
	This program therefore also needs to be calibrated, however most users will
	not need to do this, as I have already done it and put the calibration
	setting into the program code.

    If however different setting are used, via a parameter file, or even
    changing the program code, then a recalibration might be needed. Also the
    sample frequency of the input might make a slight difference to the
    calibration ( I Calibrated for 44.1 Khz ).
	A recalibration can be done manually, by feeding in a test tone, trying
	different settings in a parameter file, and measuring the amplitude of the
	output. Doing it this way however is rather laborious and tedious.

/CAL makes the process more automatic, and a lot easier. However it still takes
	a significant time. The results of a calibration can be written
	automatically into a parameter file by using /PE:<file name>.
	( They are also displayed on the screen ).

	The exact action of the recalibration depends partly upon whether a valid
	input wave file is selected as input.

	If there is no valid input wave, then the program first gives an error
	message as usual, but in this case the error can be ignored, as the
	calibration will still work. The default sample rate for the calibration is
	44100, but this can be changed using /CF:n.	( n is the sample rate to be
	used, eg. /CF:96000 ). The program then works out calibration values using
	both the filtering methods ( /FM:1 and /FM:2 ).

	If there is a valid input wave, then the calibration uses whatever sample
	rate is used in the wave file. Only one filter mode is used, depending upon
	which has been selected.
	At the end of the calibration, the program processed the wave file as usual,
	but using the new calibration values it just worked out.

/PF: Since this is an experimental program, advanced users might like to
	experiment with	changing some of the program parameters. This can be done by
	 writing new values to a parameter file, and reading it in using this
	 option.

/PE: This makes an example of a parameter file, that could be edited and then
	read in again using the /PF option. Note that options left to default are
	included in the example	file but are commented out, by enclosig them in
	curley brackets.

\--help
:   Display help for the command

# level Adjustment

DolbyB is normally built into a tape deck, so the audio level fed into the
decode circuits would be approximately correct. However, if using this program,
then the audio must have already beed extracted and digitised, so this program
has no way to determine the correct level for the decoding. So some trial and
error will be needed to find the correct level. I suggest using a section of
audio as a trial, and using a batch file to try decoding the trial at several
different levels, (with different output files), and then see which version
sounds best.

For example a batch file might look something like this:

DolbyBi64.exe Test.wav Out00.wav /tg:0.0
DolbyBi64.exe Test.wav Out05.wav /tg:5.0
DolbyBi64.exe Test.wav Out10.wav /tg:10.0
DolbyBi64.exe Test.wav Out15.wav /tg:15.0
DolbyBi64.exe Test.wav Out20.wav /tg:20.0
Pause

For Debian Linux this the script would be very similar, although I haven't
yet found the equivilent of a Pause command:
./DolbyBi64 Test.wav Out00.wav /tg:0.0
./DolbyBi64 Test.wav Out05.wav /tg:5.0
./DolbyBi64 Test.wav Out10.wav /tg:10.0
./DolbyBi64 Test.wav Out15.wav /tg:15.0
./DolbyBi64 Test.wav Out20.wav /tg:20.0


This is assuming you have put the executible file and the Wave files in the
current directory. If not, you will need to add the paths to the file names.
The Pause at the end is just to keep the command window open, so you can see
what happened.

Once you know roughly what threshold you need, you can try again with less
difference in the values. I've found that in practice I can just about hear the
differece when changing the threshold by about 1dB.

Negative threshold and gain adjustments are allowed, but I found that in
practice I don't seem to need negative values. This may however depend upon how
your audio was digitised.

Adjustment could be done either by changing the input gain, or changing the
threshold gain. I think is is probably better to use the threshold gain, as
changing the input gain would also change the level of the output, which would
make it harder to compare different outputs.

Judging the correct threshold adjustment can be tricky.

If the output sounds muffled, especially on quiet parts and transients, then
this could be because the threshold is set too low. However audio recovered from
cassette tapes can also be muffled for many other reasons. If it is muffled for
other reasons then this program does not enhance it. There may be other programs
 that may help, but this program is not designed to do this. If audio sounds
 muffled, the you can try increasing the gain, to see if it helps, but you
 should also listen to the input audio, to judge whether that is already
 muffled.

If the sound is scratchey, or has too much treble, especially on quiet parts and
 transients, then this could mean that threshold is set too high.

# BUGS
No known bugs.
