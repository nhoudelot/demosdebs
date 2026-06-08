% funzy_getmemo7(1) | Manuels utilisateur funzyto770
% Nicolas HOUDELOT <nicolas@demosdebs.org> ; Sylvain Huet
% 2026-06-09

# NOM

funzy_getmemo7 - extraire une cartouche ROM memo7 depuis un fichier cassette TO7

# SYNOPSIS

**funzy_getmemo7** *fichier.k7*

# DESCRIPTION

**funzy_getmemo7** lit un fichier cassette Thomson TO7 ou TO7-70 (format .k7)
et en extrait l'image d'une cartouche ROM memo7, en écrivant un fichier .rom
de 16384 octets.

La cartouche doit avoir été au préalable sauvegardée sur le TO7 ou le TO7-70
à l'aide de la commande BASIC suivante :

    SAVEM"MEMO7",0,&H3FFF,0

Le fichier de sortie prend le nom du fichier d'entrée avec l'extension **.k7**
remplacée par **.rom**.

Une cartouche ROM memo7 contient 16384 octets (plage d'adresses 0x0000–0x3FFF).
Plusieurs cartouches peuvent être utilisées avec l'émulateur **funzyto770** en
les plaçant dans son répertoire **memo7/**.

# OPTIONS

Ce programme n'accepte aucune option.

# FICHIERS

*fichier.k7*
:   Fichier cassette d'entrée.

*fichier.rom*
:   Image de cartouche ROM produite (16384 octets), nommée d'après le fichier d'entrée.

# EXEMPLES

Extraire une cartouche memo7 depuis un enregistrement cassette :

    funzy_getmemo7 memo7.k7

Le fichier **memo7.rom** est créé dans le répertoire courant.

# VOIR AUSSI

**funzy_getrom**(1), **funzy_wav2k7**(1)

# BOGUES

Aucun bogue connu.

# AUTEURS

Écrit par Sylvain Huet en 1996. Empaquetage Debian par Nicolas HOUDELOT
<nicolas@demosdebs.org>.
