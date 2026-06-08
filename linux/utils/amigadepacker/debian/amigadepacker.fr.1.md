---
title: AMIGADEPACKER
section: 1
date: 2026-06-08
header: Commandes utilisateur
footer: amigadepacker 0.04
---

# NOM

amigadepacker - Outil de décompression de formats Amiga compressés

# SYNOPSIS

**amigadepacker** [**-c**] [**-h**] [**-o** *fichier\_sortie*] [**-p**] [**-v**] *FICHIER* ...

# DESCRIPTION

**amigadepacker** décompresse des formats Amiga compressés. Les formats PowerPacker
(PP20/PX20), XPK SQSH, MMCMP et StoneCracker 4.04 (S404) sont pris en charge.
Amigadepacker détermine automatiquement le format compressé par analyse du contenu.
L'outil est notamment utile pour jouer des formats musicaux Amiga compressés avec
**uade**(1).

Si aucun fichier n'est fourni, les données sont lues depuis l'entrée standard et
écrites sur la sortie standard.

Si des fichiers sont fournis, amigadepacker tente de les décompresser sur place,
en écrasant les fichiers avec les données décompressées.

Si un seul fichier et l'option **-c** sont fournis, les données décompressées sont
écrites sur la sortie standard.

Si un seul fichier et l'option **-o** *fichier_sortie* sont fournis, les données
décompressées sont écrites dans *fichier_sortie*.

L'outil peut également être utilisé pour déchiffrer des fichiers chiffrés avec
PowerPacker. Cette opération peut prendre un temps conséquent.

# OPTIONS

**-c**
:   Décompresse vers la sortie standard (lorsque des fichiers réguliers sont
    passés en paramètres).

**-h**, **--help**
:   Affiche l'aide et quitte.

**-o** *fichier_sortie*, **--output-file** *fichier_sortie*
:   Écrit les données décompressées dans *fichier_sortie* au lieu d'écraser le
    fichier source.

**-p**, **--pretend**
:   Simule la décompression sans écrire aucune donnée. Affiche les noms des
    fichiers compressés sur l'erreur standard. Le mode simulation retourne toujours
    succès si les arguments sont valides. Utile pour rechercher des fichiers compressés.

**-v**, **--version**
:   Affiche les informations de version et quitte.

# EXEMPLES

Décompresser un fichier sur place :

    amigadepacker foo

Décompresser un fichier depuis l'entrée standard vers la sortie standard :

    amigadepacker < foo > foo.depacked

Trouver tous les fichiers compressés dans /path sans les décompresser :

    find /path/ -type f -print0 | xargs -0 amigadepacker --pretend --

# FORMATS SUPPORTÉS

**PowerPacker (PP20/PX20)**
:   Format de compression populaire de l'ère Amiga, très utilisé pour les modules musicaux.

**XPK SQSH**
:   Format de compression squash de la bibliothèque XPK (eXternal PacKer).

**MMCMP**
:   Music Module Compression, identifié par la signature « ziRCONia ».

**StoneCracker 4.04 (S404)**
:   Format de compression issu de la scène démo Amiga.

# DÉPÔT GIT

La dernière version d'amigadepacker peut être obtenue avec :

    git clone https://gitlab.com/heikkiorsila/amigadepacker.git 

# AUTEURS

**amigadepacker** a été écrit par Heikki Orsila \<heikki.orsila@iki.fi\>.

- Décompresseur XPK SQSH par Bert Jahn \<jah@fh-zwickau.de\>
- Dépaqueteur et déchiffreur PowerPacker par Stuart Caie \<kyzer@4u.net\>
- Dépaqueteur MMCMP par Olivier Lapicque \<olivierl@jps.net\>
- Dépaqueteur StoneCracker (S404) par Jouni « Spiv » Korhonen

Le site web d'amigadepacker est disponible à : <https://gitlab.com/heikkiorsila/amigadepacker>

# VOIR AUSSI

**lha**(1), **ppcrack**(1), **unadf**(1), **unlzx**(1), **xdms**(1), **xPK**(1)
