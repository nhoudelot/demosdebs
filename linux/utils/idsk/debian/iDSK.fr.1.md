% IDSK(1) Manuel utilisateur iDSK | iDSK 0.20
% Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-06-09

# NOM

idsk - éditeur en ligne de commande pour images de disquettes DSK de l'Amstrad CPC

# SYNOPSIS

**iDSK** *fichierDSK* [*OPTION*]... [*fichier*]...

# DESCRIPTION

**iDSK** est un utilitaire en ligne de commande permettant d'éditer des
fichiers d'images disque DSK utilisés par les ordinateurs Amstrad CPC. Les
fichiers DSK sont des images virtuelles de disquettes contenant des fichiers
au format AMSDOS.

Il permet de lister, importer, exporter et supprimer des fichiers dans une
image disque, ainsi que de créer de nouvelles images vierges. Il peut
également afficher le contenu de fichiers source BASIC et DAMS (stockés dans
un format tokenisé, et non en ASCII pur), et désassembler des fichiers
binaires Z80.

# OPTIONS

## Opérations sur les fichiers

**-l**
:   Afficher le catalogue du disque.

**-g** *fichier*
:   Exporter (extraire) un fichier de l'image.

**-i** *fichier*
:   Importer un fichier dans l'image.

**-r** *fichier*
:   Supprimer un fichier de l'image.

**-n**
:   Créer une nouvelle image DSK vierge.

**-f**
:   Forcer l'écrasement si le fichier de destination existe déjà.

## Attributs de fichier (utilisés avec **-i**)

**-t** *type*
:   Définir le type de fichier : **0** pour ASCII, **1** pour binaire.

**-e** *adresse*
:   Définir l'adresse d'exécution (hexadécimal) pour un fichier binaire.

**-c** *adresse*
:   Définir l'adresse de chargement (hexadécimal) pour un fichier binaire.

**-o**
:   Marquer le fichier importé comme étant en lecture seule.

**-s**
:   Marquer le fichier importé comme fichier système.

**-u** *numéro*
:   Définir le numéro d'utilisateur pour le fichier importé.

## Affichage et analyse

**-b** *fichier*
:   Afficher un fichier source BASIC Amstrad tokenisé.

**-p**
:   Couper les lignes dépassant 80 caractères (utilisé avec **-b**).

**-d** *fichier*
:   Afficher un fichier source DAMS assembleur.

**-h** *fichier*
:   Afficher un fichier binaire en hexadécimal.

**-z** *fichier*
:   Désassembler un fichier binaire Z80.

# EXEMPLES

Lister le contenu d'une image disque :

    iDSK floppy.dsk -l

Exporter un fichier d'une image disque :

    iDSK floppy.dsk -g myprog.bas

Importer un fichier binaire avec des adresses de chargement et d'exécution :

    iDSK floppy.dsk -i myprog.bin -t 1 -c 4000 -e C000

Créer une nouvelle image disque vierge :

    iDSK floppy2.dsk -n

Afficher un fichier BASIC tokenisé en coupant à 80 caractères :

    iDSK floppy.dsk -b myprog.bas -p

# BOGUES

Aucun bogue connu. Veuillez signaler les bogues sur
<https://github.com/cpcsdk/idsk/issues>.

# VOIR AUSSI

**dsktools**(1)

# AUTEURS

**iDSK** a été initialement écrit par Sid (IMPACT) et développé par
PulkoMandy (Shinra Team), Thierry JOUIN (Ramlaid), Demoniak, et d'autres
contributeurs du projet cpcsdk.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>.
