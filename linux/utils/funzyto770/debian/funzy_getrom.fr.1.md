% funzy_getrom(1) | Manuels utilisateur funzyto770
% Nicolas HOUDELOT <nicolas@demosdebs.org> ; Sylvain Huet
% 2026-06-09

# NOM

funzy_getrom - extraire la ROM haute du Thomson TO7 depuis un fichier cassette

# SYNOPSIS

**funzy_getrom** *fichier.k7*

# DESCRIPTION

**funzy_getrom** lit un fichier cassette Thomson TO7 ou TO7-70 (format .k7)
et en extrait l'image de la ROM haute, en écrivant un fichier .rom de 6144
octets.

La ROM doit avoir été au préalable sauvegardée sur le TO7 ou le TO7-70 à
l'aide de la commande BASIC suivante :

    SAVEM"ROM",&HE800,&HFFFF,0

Le fichier de sortie prend le nom du fichier d'entrée avec l'extension **.k7**
remplacée par **.rom**.

La ROM haute du TO7 couvre 6144 octets (plage d'adresses 0xE800–0xFFFF) et
est nécessaire au fonctionnement de l'émulateur **funzyto770**. Le fichier
.rom résultant doit être renommé **romto770** et placé dans le répertoire de
travail de l'émulateur.

# OPTIONS

Ce programme n'accepte aucune option.

# FICHIERS

*fichier.k7*
:   Fichier cassette d'entrée.

*fichier.rom*
:   Image ROM produite (6144 octets), nommée d'après le fichier d'entrée.

# EXEMPLES

Extraire la ROM TO7 depuis un enregistrement cassette :

    funzy_getrom romto770.k7

Puis renommer le fichier obtenu pour l'utiliser avec l'émulateur :

    mv romto770.rom romto770

# VOIR AUSSI

**funzy_getmemo7**(1), **funzy_wav2k7**(1)

# BOGUES

Aucun bogue connu.

# AUTEURS

Écrit par Sylvain Huet en 1996. Empaquetage Debian par Nicolas HOUDELOT
<nicolas@demosdebs.org>.
