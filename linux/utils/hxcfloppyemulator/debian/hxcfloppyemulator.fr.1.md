% hxcfloppyemulator(1) Manuel utilisateur HxC Floppy Emulator
% Jean-François DEL NERO; Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-06-09

# NOM

hxcfloppyemulator - convertisseur graphique d'images de disquettes et serveur USB HxC Floppy Emulator

# SYNOPSIS

**hxcfloppyemulator**

# DESCRIPTION

**HxCFloppyEmulator** est une application graphique (construite avec FLTK) publiée
par Jean-François DEL NERO en 2006. Il s'agit du logiciel compagnon des matériels
HxC Floppy Emulator (versions USB et SDCard).

Le logiciel permet d'importer, d'analyser et de convertir des images de disquettes
dans de nombreux formats, de parcourir des images de disquettes DOS/FAT et AmigaDOS,
d'inspecter les pistes au niveau bas, de lire des disquettes physiques, et de piloter
un périphérique USB HxC Floppy Emulator directement comme serveur d'images de
disquettes.

Les formats d'images pris en charge comprennent (sans exhaustivité) : HFE, ADF, IMG,
DSK, MFM, fichiers de flux Kryoflux, SCP, IPF, et bien d'autres. Utilisez l'outil
en ligne de commande **hxcfe**(1) pour obtenir la liste complète des formats supportés.

# OPTIONS

**hxcfloppyemulator** n'accepte aucune option en ligne de commande. Toutes les
opérations s'effectuent via son interface graphique.

# FICHIERS

*$HOME/.hxcfe/*
:   Répertoire de configuration et de paramètres de l'utilisateur.

# VOIR AUSSI

**hxcfe**(1)

Site du projet : <https://hxc2001.com>

# BOGUES

Signaler les bogues sur <https://github.com/jfdelnero/HxCFloppyEmulator/issues>.

# AUTEURS

Jean-François DEL NERO <hxc2001@hxc2001.com>

Empaqueté pour Debian/Ubuntu par Nicolas HOUDELOT <nicolas@demosdebs.org>

# COPYRIGHT

Copyright (C) 2006-2026 Jean-François DEL NERO / HxC2001.
Licence GPLv2+ : GNU GPL version 2 ou ultérieure <https://www.gnu.org/licenses/gpl-2.0.html>.
