% analyze-x86(1) analyze-x86 1.0+git20181231
% Nicolas HOUDELOT <nicolas@demosdebs.org>; Alexey Shvetsov; Ivan Shapovalov
% 2026-06-08

# NAME

analyze-x86 - analyze an x86 binary for instruction set usage

# SYNOPSIS

**analyze-x86** *binary*

# DESCRIPTION

**analyze-x86** disassembles an x86 ELF binary using **objdump**(1) and counts
how many instructions from each x86 instruction set extension are present.
It reports the detected instruction class counts along with a total instruction
count, making it easy to determine the minimum CPU instruction set required to
execute the binary.

# ARGUMENTS

*binary*
:   Path to the x86 or x86-64 ELF binary to analyze.

# OUTPUT

Each line of output is tab-separated and has the form:

    binary<TAB>class<TAB>count

Where *binary* is the path passed on the command line, *class* is one of the
detected instruction set names listed below, and *count* is the number of
instructions belonging to that class.  A final line with class **total** gives
the total number of instructions disassembled.

Only classes with a non-zero count are printed.

## Detected instruction sets

The following instruction classes are recognized, in detection order:

**cpuid**, **nop**, **call**, **i486**, **i586**, **i686**, **3dnow!**,
**3dnowext**, **mmx**, **sse**, **sse2**, **sse3**, **ssse3**, **sse4.1**,
**sse4.2**, **sse4a**, **aes**, **avx**, **avx2**

# EXIT STATUS

**0**
:   Success, or the binary contains no instructions.

**1**
:   Wrong number of arguments, failure to invoke **objdump**(1), or an I/O
    error while reading its output.

# EXAMPLES

Analyze a system binary:

    analyze-x86 /usr/bin/ls

Analyze all ELF binaries in a directory and sort by SSE4.2 usage:

    for f in /usr/bin/*; do analyze-x86 "$f" 2>/dev/null; done \
        | awk -F'\t' '$2=="sse4.2"{print $3, $1}' | sort -rn | head

# SEE ALSO

**objdump**(1), **readelf**(1), **file**(1)

# BUGS

No known bugs.  Please report bugs at
**https://github.com/alexxy/analyze-x86/issues**.

# AUTHORS

Meya Argenta <fierevere@ya.ru> (original author, 2010)

Alexey Shvetsov <alexxy@gentoo.org> (2012)

Ivan Shapovalov <intelfx@intelfx.name> (2016)

Nicolas HOUDELOT <nicolas@demosdebs.org> (Debian packaging)
