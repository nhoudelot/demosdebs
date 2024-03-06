% shader-minifier(1) Shader Minifier User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Laurent Le Brun
% 2024-03-06

# NAME
shader_minifier.exe - the command to run Shader Minifier.

# SYNOPSIS
shader_minifier.exe [--help] [-o <string>] [-v] [--hlsl] [--format <text|indented|c-variables|c-array|js|nasm|rust>] [--field-names <rgba|xyzw|stpq>]
                       [--preserve-externals] [--preserve-all-globals] [--no-inlining] [--aggressive-inlining] [--no-renaming]
                       [--no-renaming-list <string>] [--no-sequence] [--smoothstep] [--no-remove-unused] [--move-declarations] [--preprocess]
                       [<filename>...]

# DESCRIPTION
Shader Minifier is a program released by Laurent Le Brun in 2013.

# OPTIONS

\-o <string>
:   Set the output filename (default is shader_code.h)

\-v
:   Verbose, display additional information

\--hlsl
:   Use HLSL (default is GLSL)

\--format <text|indented|c-variables|c-array|js|nasm|rust>
:   Choose to format the output (use 'text' if you want just the shader)

\--field-names <rgba|xyzw|stpq>
:   Choose the field names for vectors: 'rgba', 'xyzw', or 'stpq'

\--preserve-externals
:   Do not rename external values (e.g. uniform)

\--preserve-all-globals
:   Do not rename functions and global variables

\--no-inlining
:   Do not automatically inline variables and functions

\--aggressive-inlining 
:   Aggressively inline constants. This can reduce output size due to better constant folding. It can also increase output size
    due to repeated inlined constants, but this increased redundancy can be beneficial to compression, leading to a smaller final
    compressed size anyway. Does nothing if inlining is disabled.
    
\--no-renaming
:   Do not rename anything

\--no-renaming-list <string>
:   Comma-separated list of functions to preserve

\--no-sequence
:   Do not use the comma operator trick

\--smoothstep
:   Use IQ's smoothstep trick

\--no-remove-unused
:   Do not remove unused code

\--move-declarations
:   Move declarations to group them

\--preprocess
:   Evaluate some of the file preprocessor directives

\--help
:   display this list of options.


# BUGS
No known bugs.
