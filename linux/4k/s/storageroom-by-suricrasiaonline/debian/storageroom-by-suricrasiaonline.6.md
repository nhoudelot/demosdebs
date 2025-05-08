% storageroom-by-suricrasiaonline(6) Storage Room User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Suricrasia Online
% 2025-05-07

# NAME
**storageroom-by-suricrasiaonline** - the command to run Storage Room.

# SYNOPSIS
**storageroom-by-suricrasiaonline** [*options*]

# DESCRIPTION
**Storage Room** is a 2k executable graphics demo released by Suricrasia Online in june 2020.  
It requires a minimum resolution of **1920x1080**; behavior at lower resolutions is undefined and the demo may fail to render correctly or at all.

The demo can be exited at any time by pressing **Esc**

# OPTIONS
**Storage Room** does not accept command-line options directly.  
However, its rendering quality can be adjusted using an environment variable:

* `SAMPLES=<number>`
    Sets the number of samples used for rendering.  
    A higher number generally results in better image quality but may require more processing power.  
    The default value is 300.

    Example usage:
    `env SAMPLES=500 storageroom-by-suricrasiaonline`

# AUTHOR
**Storage Room** was created by blackle / Suricrasia Online.

# SEE ALSO
* **Official Page:** <https://suricrasia.online/demoscene/storage_room.html>  
* **GitHub Repository:** <https://github.com/Suricrasia-Online/Storage-Room>  
* **Pouët Entry:** <https://www.pouet.net/prod.php?which=8591>  
* **Demozoo Entry:** <http://demozoo.org/productions/279417/>  

# BUGS
- May not run or may render incorrectly on resolutions below 1920x1080
