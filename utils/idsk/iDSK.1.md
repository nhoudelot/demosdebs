% idsk(1) iDSK User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Sid
% 2018-05-20

# NAME
idsk - the command to run iDSK.

# SYNOPSIS
iDSK <**DSKfile**> [*OPTIONS*] [*files to process*]

# DESCRIPTION
iDSK is a Tool to edit DSK (Amstrad CPC disk images) files from the command  line, released by Sid in 2008.

# OPTIONS
\-l
 : List disk catalog - iDSK floppy.dsk -l

\-g
 : export ('Get') file - iDSK floppy.dsk -g myprog.bas
 
\-r
: Remove file - iDSK floppy.dsk -r myprog.bas

\-n
: create New dsk file - iDSK floppy2.dsk -n

\-z
: disassemble a binary file         iDSK floppy.dsk -z myprog.bin

\-b
: list a Basic file                 iDSK floppy.dsk -b myprog.bas

\-p
: split lines after 80 char             ... -p

\-d
: list a Dams file                  iDSK floppy.dsk -d myprog.dms

\-h
: list a binary file as Hexadecimal iDSK floppy.dsk -h myprog.bin

\-i
: Import file                       iDSK floppy.dsk -i myprog.bas

\-t
: fileType (0=ASCII/1=BINARY)           ... -t 1

\-e
: hex Execute address of file           ... -e C000 -t 1

\-c
 : hex loading address of file           ... -e C000 -c 4000 -t 1
 
\-f
 : Force overwriting if file exists      ... -f
 
\-o
 : insert a read-Only file               ... -o
 
\-s
 : insert a System file                  ... -s
  
\-u
 : insert file with User number          ... -u 3

# BUGS
No known bugs.
