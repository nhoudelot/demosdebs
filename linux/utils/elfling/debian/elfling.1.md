% elfling(1) elfling User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org), Minas and Calodox
% 2026-06-09

# NAME

elfling - a linking compressor for ELF files

# SYNOPSIS

**elfling** [**-o***output*] [**-c***params*] [**-l***library*]... [**-f***flag*]... *file.o*

# DESCRIPTION

**elfling** is a context-modeling compressing linker that transforms an ELF
relocatable object file (*.o*) into a minimal self-decompressing ELF executable.
It is inspired by **Crinkler**, a compressing linker for the Windows demoscene,
and targets the Linux demoscene where executable size is critical.

**elfling** reads a single ELF object file (i386 or x86\_64), resolves symbol
relocations, builds an import jump table using a hash-based dynamic linker stub,
compresses the resulting code and data with an adaptive arithmetic context model,
and writes a self-decompressing ELF binary embedding the decompression stub.

The following limitations apply in the current version:

- Only a single input object file is supported.
- Only SDL 1.2 and OpenGL library imports are resolved at run time; the **-l**
  option is parsed but ignored for library resolution.
- Some ELF section types and relocation types may not be handled and may cause
  a crash.
- Running i386 output on a 64-bit system requires the matching 32-bit runtime
  libraries.

# OPTIONS

**-o***output*
:   Write the compressed executable to *output*. Default: **c.out**.

**-c***params*
:   Set the compression context configuration. *params* is a hexadecimal string
    encoding the weight and size of each arithmetic context (up to 16 contexts).
    When omitted, default parameters are used automatically.
    Example: **-c0801010205070b0b0734273ac30403158d**

**-l***library*
:   Declare a shared library dependency (e.g., **-llibc.so.6**,
    **-llibSDL-1.2.so.0**, **-llibGL.so.1**). This option is parsed but currently
    ignored; SDL 1.2 and OpenGL are the only libraries resolved at run time.

**-f***flag*
:   Enable a boolean flag. *flag* is appended directly to **-f** with no
    separator. Recognized flags:

    **verbose**
    :   Print detailed information about sections, imports, and relocations
        during linking. Enabled with **-fverbose**.

# OUTPUT

**elfling** prints progress to standard output during linking:

**Arch: i386** or **Arch: x86\_64**
:   Detected architecture of the input object file.

**Section** *name* **@** *address*
:   Virtual address assigned to each section in the output image.

**Wrote** *N* **bytes**
:   Size of the final compressed executable in bytes.

# EXAMPLES

Compress a 32-bit C program:

    gcc -Os -c prog.c -fomit-frame-pointer -fno-exceptions -o prog.o -m32
    elfling prog.o -oprog.out -llibc.so.6
    chmod 755 prog.out

Compress a 64-bit program with explicit compression parameters:

    gcc -Os -c prog.c -fomit-frame-pointer -fno-exceptions -o prog.o
    elfling prog.o -oprog.out -c0801010205070b0b0734273ac30403158d -llibc.so.6
    chmod 755 prog.out

Compress an SDL/OpenGL demo with verbose output:

    gcc -Os -c demo.c -fomit-frame-pointer -fno-exceptions -ffast-math \
        -fsingle-precision-constant -o demo.o -m32
    elfling demo.o -odemo.out -llibSDL-1.2.so.0 -llibGL.so.1 -fverbose

# FILES

**test/tmp**
:   Temporary file created during linking. Contains the uncompressed linked
    binary before compression. Overwritten on each run.

# BUGS

- Only one input object file can be linked at a time.
- Library flags (**-l**) are ignored; SDL 1.2 and OpenGL are always assumed.
- Some ELF relocation types or unusual section layouts may cause a crash.
- 32-bit output on a 64-bit system requires 32-bit compatibility libraries.

Report bugs at **https://github.com/google/elfling**.

# AUTHORS

Written by Minas and Calodox. Packaged for Debian by Nicolas HOUDELOT
<nicolas@demosdebs.org>.

# SEE ALSO

**ld**(1), **gcc**(1), **nasm**(1), **objdump**(1), **readelf**(1)
