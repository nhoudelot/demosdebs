% hxcfe(1) Manuel utilisateur HxC Floppy Emulator
% Jean-François DEL NERO; Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-06-09

# NOM

hxcfe - convertisseur en ligne de commande d'images de disquettes et serveur USB HxC Floppy Emulator

# SYNOPSIS

**hxcfe** [*OPTIONS*]

# DESCRIPTION

**hxcfe** est l'outil en ligne de commande compagnon des matériels HxC Floppy Emulator.
Il expose toutes les fonctionnalités de la bibliothèque **libhxcfe** via une interface
en ligne de commande simple, et permet de convertir des images de disquettes entre de
nombreux formats, d'appliquer des mises en page de disque brutes, de lister ou
d'extraire des fichiers depuis des images de disquettes, et de piloter un périphérique
USB HxC Floppy Emulator comme serveur d'images.

Plusieurs paires **-conv** / **-foutput** peuvent être fournies en une seule invocation
afin de produire simultanément plusieurs formats de sortie.

# OPTIONS

**-help**
:   Afficher un résumé des options disponibles et des exemples d'utilisation.

**-license**
:   Afficher le texte complet de la licence.

**-verbose**
:   Activer la sortie verbeuse.

**-script**:*fichier*
:   Exécuter le fichier script *fichier*.

**-modulelist**
:   Lister tous les formats d'images de disquettes pris en charge (identifiants FORMAT),
    leur mode d'accès (R = lecture, W = écriture) et leurs extensions de fichier.

**-rawlist**
:   Lister toutes les mises en page de disque brutes disponibles (identifiants DISKLAYOUT).

**-interfacelist**
:   Lister tous les modes d'interface disquette disponibles (identifiants INTERFACE_MODE).

**-finput**:*fichier*
:   Spécifier le fichier image d'entrée.

**-foutput**:*fichier*
:   Spécifier le fichier image de sortie.

**-conv**:*FORMAT*
:   Convertir l'image d'entrée dans le format indiqué. Utiliser **-modulelist** pour
    obtenir la liste des valeurs FORMAT valides.

**-reffile**:*fichier*
:   Mode de copie secteur par secteur. Utiliser *fichier* comme image de référence
    fournissant la mise en page du disque ; chaque secteur est ensuite mis à jour
    depuis l'image d'entrée. Doit être combiné avec **-conv**.

**-uselayout**:*DISKLAYOUT*
:   Appliquer la mise en page de disque brute *DISKLAYOUT* à l'image. Utiliser
    **-rawlist** pour obtenir la liste des valeurs DISKLAYOUT valides.

**-usb**:*LECTEUR*
:   Démarrer le serveur USB HxC Floppy Emulator en utilisant *LECTEUR* comme image
    de disquette.

**-infos**
:   Afficher des informations détaillées sur l'image d'entrée.

**-ifmode**:*INTERFACE_MODE*
:   Sélectionner le mode d'interface disquette. Utiliser **-interfacelist** pour les
    valeurs valides.

**-singlestep**
:   Forcer le mode pas simple lors de l'écriture de l'image de sortie.

**-doublestep**
:   Forcer le mode double pas lors de l'écriture de l'image de sortie.

**-list**
:   Lister les fichiers contenus dans l'image de disquette.

**-getfile**:*FICHIER*
:   Extraire *FICHIER* de l'image de disquette dans le répertoire courant.

**-putfile**:*FICHIER*
:   Injecter *FICHIER* dans l'image de disquette.

# EXEMPLES

Convertir une image de disquette au format HFE :

    hxcfe -finput:"entree.img" -conv:HXC_HFE -foutput:"sortie.hfe"

Convertir une image de disquette en HFE et en BMP en une seule passe :

    hxcfe -finput:"entree.img" -conv:HXC_HFE -foutput:"sortie.hfe" \
          -conv:BMP_DISK_IMAGE -foutput:"sortie.bmp"

Convertir une image brute en HFE en appliquant une mise en page spécifique :

    hxcfe -finput:"entree.img" -uselayout:PUMA_ROBOT_DD_640KB \
          -conv:HXC_HFE -foutput:"sortie.hfe"

Générer une image HFE vide à partir d'une mise en page (sans image d'entrée) :

    hxcfe -uselayout:PUMA_ROBOT_DD_640KB -conv:HXC_HFE -foutput:"sortie.hfe"

Copie secteur par secteur en utilisant une image de référence pour la mise en page :

    hxcfe -finput:"entree.hfe" -conv:HXC_HFE -foutput:"sortie.hfe" \
          -reffile:"reference.hfe"

# VOIR AUSSI

**hxcfloppyemulator**(1)

Site du projet : <https://hxc2001.com>

# BOGUES

Signaler les bogues sur <https://github.com/jfdelnero/HxCFloppyEmulator/issues>.

# AUTEURS

Jean-François DEL NERO <hxc2001@hxc2001.com>

Empaqueté pour Debian/Ubuntu par Nicolas HOUDELOT <nicolas@demosdebs.org>

# COPYRIGHT

Copyright (C) 2006-2026 Jean-François DEL NERO / HxC2001.
Licence GPLv2+ : GNU GPL version 2 ou ultérieure <https://www.gnu.org/licenses/gpl-2.0.html>.
