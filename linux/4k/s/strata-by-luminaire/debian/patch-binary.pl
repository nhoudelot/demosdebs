#!/usr/bin/perl
# Fix the Strata executable so that it works with current OpenGL drivers.
#
# usage: patch-binary.pl <original exe> <new shader> <patched exe>
#
# 1. The intro reuses stack slots as arguments: glCompileShader() takes the
#    argument left by glShaderSource(), glLinkProgram() and glUseProgram()
#    take the one left by glAttachShader(). A cdecl callee may overwrite its
#    arguments, and current NVIDIA drivers do: glUseProgram() gets a garbage
#    id, no program is active and the window stays white. The 5-byte calls
#    leave no room to push the arguments again, so the sequence jumps to a
#    trampoline written in the zero padding at the end of the code segment
#    (the first PT_LOAD is enlarged to cover it). The program id is kept in
#    esi, which is free until the main loop.
# 2. At the end (after 118 s, or when Escape is pressed) the intro falls
#    through into another function and returns into the data segment, which
#    ends with a segmentation fault. The padding after the main loop now calls
#    exit_group(0).
# 3. The unused program header 1 holds garbage. It becomes PT_GNU_STACK
#    (read/write), so the stack is no longer executable.
# 4. The fragment shader has no #version: Mesa compiles it as GLSL 1.10 and
#    refuses it (bool function returning 0., round(), implicit float to int
#    and int to vec3 conversions). debian/shader.frag has the same length,
#    with "#version 130", explicit conversions, a rounded texture lookup for
#    the bitmap font, pow(x,2) on a negative x replaced by x*x, and the time
#    uniform declared first: the intro sets it with glUniform1f(0, t), and
#    Mesa numbers the uniforms in declaration order.
#
# Written by Claude Opus 5.5 <noreply@anthropic.com>, reviewed by Nicolas HOUDELOT.
use strict;
use warnings;

my ($in, $shader, $out) = @ARGV;
die "usage: $0 <original exe> <new shader> <patched exe>\n" unless defined $out;

sub slurp { my ($f) = @_; open(my $fh, '<:raw', $f) or die "$f: $!\n"; local $/; my $d = <$fh>; close $fh; return $d; }

my $exe = slurp($in);
my $new_shader = slurp($shader);

# The executable is loaded at 0x08048000, file offset 0.
my $base = 0x08048000;

# PLT entries
my %plt = (
    glAttachShader  => 0x080484c0,
    glUseProgram    => 0x080484f0,
    glCreateProgram => 0x08048560,
    glLinkProgram   => 0x08048590,
    glCompileShader => 0x080485c0,
);

my $code_end = 0x0ca6;      # end of the first PT_LOAD
my $cave     = 0x0cb0;      # trampoline, in the zero padding up to 0xf50
my $back     = 0x08048640;  # code after the glUseProgram() call

sub rel { my ($from, $to) = @_; return pack('V', ($to - ($from + 5)) & 0xffffffff); }

# trampoline
my $tramp = '';
my $pc = $base + $cave;
my $emit = sub { my ($bytes) = @_; $tramp .= $bytes; $pc += length($bytes); };
my $call = sub { my ($f) = @_; $emit->("\xe8" . rel($pc, $plt{$f})); };
$emit->("\x53");                 # push ebx (shader)
$call->('glCompileShader');
$call->('glCreateProgram');
$emit->("\x96");                 # xchg eax, esi (program)
$emit->("\x53\x56");             # push ebx; push esi
$call->('glAttachShader');
$emit->("\x56");                 # push esi
$call->('glLinkProgram');
$emit->("\x56");                 # push esi
$call->('glUseProgram');
$emit->("\xe9" . rel($pc, $back));
my $cave_end = $cave + length($tramp);

my @patches = (
    # program header 1: garbage -> PT_GNU_STACK, flags RW
    [ 0x54, '80150465', '51e57464' ],
    [ 0x6c, '00280000', '06000000' ],
    # first PT_LOAD: p_filesz and p_memsz cover the trampoline
    [ 0x84, unpack('H*', pack('VV', $code_end, $code_end)), unpack('H*', pack('VV', $cave_end, $cave_end)) ],
    # glCompileShader ... glUseProgram -> jmp trampoline
    [ 0x625,
      'e896ffffffe831ffffff5350e88afeffffe855ffffffe8b0feffff',
      unpack('H*', "\xe9" . rel($base + 0x625, $base + $cave) . ("\x90" x 22)) ],
    # end of the main loop: exit_group(0) instead of falling through
    [ 0x722,
      '6690669066906690669066906690',
      '31dbb8fc000000cd809090909090' ],
    # trampoline
    [ $cave, unpack('H*', "\0" x length($tramp)), unpack('H*', $tramp) ],
);

my $shader_offset = 0x10e0;
my $shader_length = 2788;
my $old_shader = substr($exe, $shader_offset, $shader_length);
die "unexpected shader in $in\n"
    unless $old_shader =~ /\A#define Y float\n/ && $old_shader =~ /gl_FragColor\.rgb=y\(b\);\}\z/;
die "$shader must be $shader_length bytes long\n" unless length($new_shader) == $shader_length;
die "unexpected byte after the shader in $in\n" unless substr($exe, $shader_offset + $shader_length, 1) eq "\0";
die "the trampoline does not fit in the padding\n" unless $cave_end <= 0x0f50;
substr($exe, $shader_offset, $shader_length) = $new_shader;

for my $p (@patches) {
    my ($offset, $old, $new) = @$p;
    my ($o, $n) = (pack('H*', $old), pack('H*', $new));
    die "old and new code differ in length\n" unless length($o) == length($n);
    die sprintf("unexpected bytes at 0x%x in %s\n", $offset, $in) unless substr($exe, $offset, length($o)) eq $o;
    substr($exe, $offset, length($o)) = $n;
}

open(my $fh, '>:raw', $out) or die "$out: $!\n";
print $fh $exe;
close $fh or die "$out: $!\n";
chmod 0755, $out;
