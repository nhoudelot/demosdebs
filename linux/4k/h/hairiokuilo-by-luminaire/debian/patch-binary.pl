#!/usr/bin/perl
# Fix the Häiriökuilo executable so that it works with current OpenGL drivers.
#
# usage: patch-binary.pl <original exe> <new shader> <patched exe>
#
# 1. The intro reuses stack slots as arguments: glCompileShader() takes the
#    argument left by glShaderSource(), glLinkProgram() and glUseProgram()
#    take the one left by glAttachShader(). A cdecl callee may overwrite its
#    arguments, and current NVIDIA drivers do: glUseProgram() gets a garbage
#    id, no program is active and the screen stays white. The calls are
#    rewritten with "call [addr]" (6 bytes instead of 7), and the saved bytes
#    push the arguments again. The program id is kept in esi, which is free
#    until cairo_create().
# 2. The fragment shader has no #version: Mesa compiles it as GLSL 1.10 and
#    refuses it (implicit int to float conversions, inverse()). It also calls
#    smoothstep() with reversed or equal edges, which is undefined and renders
#    another picture with Mesa. debian/shader.frag has the same length, with
#    "#version 150 compatibility", an explicit smoothstep, step(45,j) for
#    the equal edges, and without unused code.
#
# Written by Claude Opus 5.5 <noreply@anthropic.com>, reviewed by Nicolas HOUDELOT.
use strict;
use warnings;

my ($in, $shader, $out) = @ARGV;
die "usage: $0 <original exe> <new shader> <patched exe>\n" unless defined $out;

sub slurp { my ($f) = @_; open(my $fh, '<:raw', $f) or die "$f: $!\n"; local $/; my $d = <$fh>; close $fh; return $d; }

my $exe = slurp($in);
my $new_shader = slurp($shader);

my @patches = (
    # glShaderSource / glCompileShader
    [ 0x29f8,
      '68a29f04086a00a1469f0408ffd08d442404506a0153a14a9f0408ffd0a14e9f0408ffd0',
      '68a29f04086a00ff15469f04086a008d442408506a0153ff154a9f040853ff154e9f0408' ],
    # glCreateProgram / glAttachShader / glLinkProgram / glUseProgram
    [ 0x2a1c,
      'a1529f0408ffd05350a1569f0408ffd0a15a9f0408ffd0a15e9f0408ffd0',
      'ff15529f040889c65356ff15569f040856ff155a9f040856ff155e9f0408' ],
);

my $shader_offset = 8098;
my $shader_length = 2254;
my $old_shader = substr($exe, $shader_offset, $shader_length);
die "unexpected shader in $in\n"
    unless $old_shader =~ /\A#define V return\n/ && $old_shader =~ /gl_FragColor=vec4\(J\(h\*2\.\),1\);\}\z/;
die "$shader must be $shader_length bytes long\n" unless length($new_shader) == $shader_length;
die "unexpected byte after the shader in $in\n" unless substr($exe, $shader_offset + $shader_length, 1) eq "\0";
substr($exe, $shader_offset, $shader_length) = $new_shader;

for my $p (@patches) {
    my ($offset, $old, $new) = @$p;
    my ($o, $n) = (pack('H*', $old), pack('H*', $new));
    die "old and new code differ in length\n" unless length($o) == length($n);
    die sprintf("unexpected code at 0x%x in %s\n", $offset, $in) unless substr($exe, $offset, length($o)) eq $o;
    substr($exe, $offset, length($o)) = $n;
}

open(my $fh, '>:raw', $out) or die "$out: $!\n";
print $fh $exe;
close $fh or die "$out: $!\n";
chmod 0755, $out;
