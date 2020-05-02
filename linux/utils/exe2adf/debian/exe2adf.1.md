% exe2adf-by-reality(1) exe2adf User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Bonefish/Reality
% 2019-12-21

# NAME
exe2adf - the command to run exe2adf.

# SYNOPSIS
exe2adf -i filename.exe [*options*]

# DESCRIPTION
exe2adf is a tool released by Reality in 2015.

# MANDATORY OPTIONS
\-i [--input]
:   exe to convert to ADF

# OPTIONAL OPTIONS
\-a [--adf]
:   ADF filename

\-t [--txt]
:   text file to display at boot time

\-l [--label]
:   label of the ADF disk

\-k [--add21k]
:   free 21kb before loading rest of the floppyF

\-c [--cls]
:   clear screen before typing readme.txt, only usable if --txt is used

\-w [--wide]
:   set AmigaDOS/Cli to 80cols instead of default 60cols

\-p [--palette]
:   set AmigaDOS/Cli palette
color 1 and 2 - back/foreground (Mandatory!), color 3 - minimize icon, color 4 - cursor
color 5 - pointer main, color 6 - pointer shadow, color 7 - pointer. See example below

\-d [--directory]
:   directory to include onfloppy

\-b [--bootblock]
:   install custom bootblock

\-0
:   show sector allocation map

# USAGE

Fast usage:
exe2adf -i intro.exe

Simple usage:
: exe2adf -i intro.exe -l myfloppy -a floppy.adf
exe2adf --input intro.exe --label myfloppy  --adf floppy.adf

Advanced usage:
: exe2adf -i intro.exe -l myfloppy -t readme.txt -a floppy.adf -k -c

Palette usage:
: exe2adf -i intro.exe -t readme.txt -a floppy.adf -p 000,fff,00f,f0f              ;cli colors only
exe2adf -i intro.exe -t readme.txt -a floppy.adf -p 000,fff,00f,f0f,888,444,fff  ;cli and pointer colors


# BUGS
No known bugs.
