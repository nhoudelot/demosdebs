% fit039boy-by-fit(6) fit-039: Boy User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Fit
% 2024-04-18

# NAME
fit039boy-by-fit - is the command to run fit-039: Boy 

# SYNOPSIS
fit039boy-by-fit [*options*]

# DESCRIPTION
fit-039: Boy is a demonstration released by Fit in june 2008
Ended 1st at Icons 2008

Marq [Code, Graphics]
roz [Music]

# OPTIONS
-nofsaa		No FSAA (ugly but fast)
-nosound	Silent mode
-w		Windowed mode
-text		Convert framebuffer to ASCII and print it realtime,
		xterm recommended for proper speed
-res X Y	Set screen resolution. Only 4:3 modes run correctly.

Well, that textmode thingy is a bit messy at first. Just do this:
./boy -w -text -res $COLUMNS $LINES

# INFOS
https://www.pouet.net/prod.php?which=50696

# BUGS
No known bugs.
