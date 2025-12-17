% enamelpin-by-suricrasiaonline(6) Enamel Pin User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Suricrasia Online
% 2025-05-08

# NAME
**Enamel Pin** - a 4k procedural graphics executable for 64-bit Linux

# SYNOPSIS
[**SAMPLES=**_number_] **enamelpin-by-suricrasiaonline** 


# DESCRIPTION
**Enamel Pin** is a 4-kilobyte executable graphics production (exegfx) that renders a high-resolution image procedurally.  
It was developed by Suricrasia Online and won first place in the 4k procedural graphics competition at Solskogen 2020.  

The demo generates a 1920x1080 image. On smaller displays, the image will be clipped. On larger displays, it will render in the corner.  

Exit at any time using the **Esc** key or your window manager’s close window shortcut.  

# OPTIONS
While `enamel_pin` itself does not accept command-line options, you can control the rendering quality through the **SAMPLES** environment variable:

- `SAMPLES=100` (default)  
  Controls the number of samples used during rendering.

Example:

```sh
env SAMPLES=200 ./enamel_pin
```

# SEE ALSO
For more information, visit the following links:  
- GitHub repository: [Enamel-Pin](https://github.com/Suricrasia-Online/Enamel-Pin)  
- Pouët entry: [Enamel Pin on Pouët](https://www.pouet.net/prod.php?which=86206)  
- Demozoo entry: [Enamel Pin on Demozoo](http://demozoo.org/productions/280518/)  
- Suricrasia Online: [Enamel Pin](https://suricrasia.online/demoscene/enamel_pin.html)

# BUGS
No known bugs.
