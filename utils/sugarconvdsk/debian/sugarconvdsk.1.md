% sugarconvdsk(1) SugarConvDsk User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Tom1975
% 2018-05-13

# NAME
sugarconvdsk - the command to run SugarConvDsk.

# SYNOPSIS
sugarconvdsk *source* [destination] [-s=side] [-o=outputformat] [-r] [-f=filter]

# DESCRIPTION
SugarConvDsk is a program released by Tom1975 in 2018.
It convert any Amstrad CPC dump file format to other format

# OPTIONS

\-s=side : Select side of the disk to convert.
   Side can be 1 or 2
   If omitted, both side are written (if relevant for the format)

\-o=outputformat : Select output format. Can take the following values:
    EDSK : Extended Dsk format
    HFE : HFE format
    IPF : IPF format
    SCP : Supercard Pro format
If this parameter is not used, default output format is EDSK

source : The source file can be in the following format :
    CTRAW : CT-RAW format
    DSK : Dsk format
    EDSK : Extended Dsk format
    HFE : HFE format
    IPF : IPF format
    SCP : Supercard Pro format
    KRYOFLUX : Kryoflux RAW file format
	
If the source file is a directory : In this case, every files in the given directory are converted to the 'output' directory

destination : output file. If source file is a directory, destination is used as an output directory

\-r : If the source file is a directory, convert recursively the given directory.
\-f=filter : If the source file is a directory, set a filter for the files to convert.

Example : 

	SugarConvDsk d:\dump d:\result -o=IPF -r -f=[CPC]*.dsk 
This will convert to IPF every file of the form "[CPC]*.dsk", from directory d:\result, and subdirectories.
Result files will be saved in the d:\result directory.

\--help
:   Display help for the command

# BUGS
No known bugs.
