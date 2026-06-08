% HERMES(1) hermes User Manuals | Version 0.7.1
% Nicolas HOUDELOT <nicolas@demosdebs.org>; Deuchnord
% June 2026

# NAME

hermes - graphical manager for product warranties

# SYNOPSIS

**hermes**

# DESCRIPTION

**hermes** is a free and open-source Qt5 graphical application to manage
your products' warranties. It allows you to:

- add products with their purchase date and warranty end date,
- attach invoice and warranty certificate documents to each product,
- mark products currently in after-sales service (SAV),
- search through your product list,
- configure the data storage location.

Product data is stored locally in **~/deuchnord-hermes/** in both a legacy
binary format (*.hrms*) and individual JSON files for future compatibility.

Hermes checks for new upstream versions at startup and notifies the user
in the status bar when one is available.

# FILES

*~/deuchnord-hermes/products.hrms*
:   Main product database (legacy binary format, Qt5 QDataStream).

*~/deuchnord-hermes/json/\*.json*
:   Per-product JSON files (format used by future versions).

# BUGS

Report bugs at <https://tickets.deuchnord.fr/index.php?project=2&do=index&switch=1>.

# SEE ALSO

Online documentation: <https://doc.deuchnord.fr/hermes/start>

# AUTHORS

Written by Deuchnord. Packaged for Debian/Ubuntu by Nicolas HOUDELOT
\<nicolas@demosdebs.org\>.
