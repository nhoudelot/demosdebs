% ephemera-by-approximate(6) ephemera User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Approximate
% 2016-12-20

# NAME
ephemera-by-approximate - is the command to run ephemera 

# SYNOPSIS
ephemera-by-approximate [*options*]

# DESCRIPTION
ephemera  is a demonstration released by Approximate in 2009

32-bit elf using SDL (for audio, keyboard/mouse and window creation) and OpenGL
Since it's not tried and tested much, any feedback is much welcome. 
I really want to get our 64k releases to be on pair with the windows versions
if possible so I welcome any tips, tricks or discussions on the subject. 
Due to not having the wonderful tool called kkrunchy available on the Linux 
platform the executable is packed with upx to about 76.5kb (windows version 
with upx is about 74.4 kb). My hope is that releasing more quality content 
on the Linux platform might spark some progress of Linux packers and 64k 
development. Maybe next time we will try to create a OSX binary as well.

For those interested the following tools where used:
g++
strip
sstrip from ELFkickers
upx

Anyone wanting to chat about 64k intro/packer development/improvement on Linux, 
feel free to contact me at my gmail address:
cryptic.aprx

# OPTIONS
there is no options to this program

\--help
:   Display help for the command

# BUGS
No known bugs.
