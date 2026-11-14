% enamelpin-by-suricrasiaonline(6) Enamel Pin User Manuals
% Nicolas HOUDELOT <nicolas@demosdebs.org>,Claude Opus 5.5,Suricrasia Online
% 2026-11-14

# NAME
enamelpin-by-suricrasiaonline - Enamel Pin, a 4k procedural graphics executable

# SYNOPSIS
[**SAMPLES=**_number_] **enamelpin-by-suricrasiaonline**


# DESCRIPTION
**Enamel Pin** is a 4-kilobyte executable graphics production (exegfx) that renders a high-resolution image procedurally.  
It was developed by Suricrasia Online and won first place in the 4k procedural graphics competition at Solskogen 2020.  

The picture is path traced on the GPU and drawn ten scanlines at a time, so it appears progressively; the render time is printed on the standard output when it is complete. An OpenGL 4.2 capable driver is needed.

The demo generates a 1920x1080 image. On smaller displays, the image will be clipped. On larger displays, it will render in the corner.  

Exit at any time using the **Esc** key or your window manager’s close window shortcut.  

# OPTIONS
While **enamelpin-by-suricrasiaonline** itself does not accept command-line options, you can control the rendering quality through the **SAMPLES** environment variable:

- `SAMPLES=100` (default)  
  Controls the number of samples per pixel used during rendering. Higher values give a less noisy image but take longer to render.

Example:

```sh
SAMPLES=200 enamelpin-by-suricrasiaonline
```

# SEE ALSO
For more information, visit the following links:  
- GitHub repository: [Enamel-Pin](https://github.com/Suricrasia-Online/Enamel-Pin)  
- Pouët entry: [Enamel Pin on Pouët](https://www.pouet.net/prod.php?which=86206)  
- Demozoo entry: [Enamel Pin on Demozoo](http://demozoo.org/productions/280518/)  
- Suricrasia Online: [Enamel Pin](https://suricrasia.online/demoscene/enamel_pin.html)

# BUGS
No known bugs.
