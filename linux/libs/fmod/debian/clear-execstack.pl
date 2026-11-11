#!/usr/bin/perl
# Clear the PF_X flag of the PT_GNU_STACK program header of a 32-bit
# little-endian ELF file (same effect as "patchelf --clear-execstack",
# which is not available in patchelf < 0.18, e.g. on Debian bookworm).
# Written by Claude Opus 5.5 <noreply@anthropic.com>, reviewed by Nicolas HOUDELOT.
use strict;
use warnings;

my $file = shift or die "usage: $0 <elf32-file>\n";
open(my $fh, '+<:raw', $file) or die "$file: $!\n";
read($fh, my $ehdr, 52) == 52 or die "$file: short read\n";
die "$file: not a 32-bit little-endian ELF\n"
    unless substr($ehdr, 0, 6) eq "\x7fELF\x01\x01";
my $phoff     = unpack('V', substr($ehdr, 28, 4));
my $phentsize = unpack('v', substr($ehdr, 42, 2));
my $phnum     = unpack('v', substr($ehdr, 44, 2));
for my $i (0 .. $phnum - 1) {
    my $off = $phoff + $i * $phentsize;
    seek($fh, $off, 0) or die;
    read($fh, my $phdr, 32) == 32 or die "$file: short read\n";
    next unless unpack('V', substr($phdr, 0, 4)) == 0x6474e551;  # PT_GNU_STACK
    my $flags = unpack('V', substr($phdr, 24, 4));
    seek($fh, $off + 24, 0) or die;
    print $fh pack('V', $flags & ~1);                            # drop PF_X
    close($fh) or die;
    exit 0;
}
die "$file: no PT_GNU_STACK header\n";
