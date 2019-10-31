% lunareactivation-by-vovoid(6) Luna : Reactivation User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),vovoid
% 2018-01-21

# NAME
lunareactivation-by-vovoid - the command to run Luna : Reactivation.

# SYNOPSIS
lunareactivation-by-vovoid [*options*]

# DESCRIPTION
Luna : Reactivation is a demonstration released by vovoid in 2011.

                     L U N A  :  R E A C T I V A T I O N

                       a   G N U / L i n u x    d e m o

                            r e l e a s e d   a t
                          a s s e m b l y    2 0 1 1



__how to run on windows________________________________________________________

  *** You meet the hardware requirements below
  *** but have only Windows installed?
        Piece of cake! Install "Wubi"
          http://www.ubuntu.com/download/ubuntu/windows-installer
        Installs Ubuntu in a disk image file, 
          - won't mess up your partitions 
          - you can easily remove it whenever you like. 
          - you get a boot entry in the windows boot loader

__hardware/software requirements_______________________________________________

  + GNU/Linux (developed and tested on Ubuntu 10.04)
  + An nvidia card; 9800 GTX or better, GTX 480 or GTX 580 preferred.
    Do not expect a laptop GPU to run this demo, sorry...
  + Quad-core CPU, developed on a core 2 quad with 800Mhz memory.
  + intended for 1080p @ 60Hz but try it in 720p if you have a fast CPU, 
    your GPU might have issues with fillrate
  + 4GB of RAM for 1080p (depending on screen res)

__credits______________________________________________________________________

  + code                    jaw, cor
  + direction, design       jaw, warpfuz
  + modelling               jaw, asterix
  + rigging / animation     jaw
  + music                   warpfuz, jaw
  + backgrounds             nameless designer, jaw, warpfuz*
  + luna 2d bonus           lokmanlam
  + textures, normalmaps    jaw
  + special thanks          nightbeat / outbreak    (early stages discussions)
                            febe / vovoid           (direction ideas)
                            elmindreda / hypercube  (glfw support)

  (*) see 3rd party stuff used also.

  Welcome to Vovoid's latest demo - this time about Luna - an android girl
  with a mission gone astray, wrongfully labeled as broken and dumped through a
  burial portal at a cemetery for androids.

  But the workers discover something amazing...

  For screenshots, music download, mid-production documentation head over to
  http://www.vovoid.org/luna-reactivation/

  This demo has taken more than 3 years to make, so we hope you enjoy it!
  A lot happens in threads, so a quad core machine is preferred.
  Also 4GB of RAM is needed.

  And please, please if possible view it in 1080p, it was designed for that.
  720p doesn't do it justice and you miss out on a lot of details. See the
  screenshots if you like.

__creative process_____________________________________________________________

  Describing a mood requires both graphics and music.

  We intended for music and graphics to be closely connected and driving each
  other. We did this during the creative process, going back & forth between
  the two, letting the mood of the demo inspire everything.

  We hope this effort shows in the final product.

__test results_________________________________________________________________

  + demo was developed and tested on ubuntu 10.04 with GTX 480
  + demo was run on ubuntu 10.10 with GTX 580

__fun facts____________________________________________________________________

  + This demo is 32Mb, of that 11Mb is the music
  + we developed new animation tools for the character animation for tighter
    control, supporting the iterative creative process.
  + the "breathing" sky "blob" in the beginning is an inflation simulation. 
    We change gas pressure and stiffness to make it breathe.
  + we wanted to keep size down, so a lot of what you see is procedurally
    generated, a lot of mesh generators, dynamic textures, generated textures
    etc.

__software tools used__________________________________________________________

  kdevelop, cmake, gcc/g++, valgrind (profiling, leak check, memory errors),
  blender (modelling+rigging), photoshop (under wine), gimp,
  renoise (linux), fl studio (win32)

__3rd party stuff used_________________________________________________________

  Audio engine : FMOD Sound System by Firelight Technologies 
  (http://www.fmod.org)

  GLFW (http://www.glfw.org)

  + Large Magellanic Cloud (LMC)
    (c) C. Smith, S. Points, the MCELS Team and 
    National Optical Astronomy Observatory/Association of Universities for
    Research in Astronomy/National Science Foundation
_______________________________________________________________________________

# OPTIONS
there is no options to this program

\--help
:   Display help for the command

# BUGS
No known bugs.
