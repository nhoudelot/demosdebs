% UNLZX(1) unlzx 2.0 | Manuel des commandes générales
% Nicolas HOUDELOT
% 2026

# NOM

unlzx - extraire ou lister les fichiers des archives Amiga LZX

# SYNOPSIS

**unlzx** [**-v**|**-x**] [**-c**] [*archive* ...]

# DESCRIPTION

**unlzx** extrait ou liste le contenu des archives LZX.

LZX est un format de compression sans perte basé sur l'algorithme LZ77,
développé à l'origine pour la plateforme Amiga. Il utilise le codage de
Huffman avec deux modes de compression : stocké (non compressé) et compressé
(packed). Les blocs fusionnés couvrant plusieurs fichiers au sein d'un même
flux compressé sont également pris en charge.

Chaque fichier extrait est vérifié par rapport à une somme de contrôle CRC-32
stockée dans l'en-tête de l'archive. Une divergence est signalée mais
n'interrompt pas le traitement des fichiers suivants.

Sans option, **unlzx** fonctionne en mode extraction (**-x**) par défaut.

# OPTIONS

**-c**
:   Lire l'archive depuis l'entrée standard plutôt que depuis un fichier.

**-v**
:   Lister le contenu de l'archive : tailles, horodatages, attributs de
    protection et noms de fichiers. N'extrait aucun fichier.

**-x**
:   Extraire les fichiers de l'archive dans le répertoire courant, en
    recréant l'arborescence des sous-répertoires. Il s'agit du mode par
    défaut.

# ÉTAT DE SORTIE

**0**
:   Tous les archives ont été traités avec succès.

**1**
:   Une erreur s'est produite lors de l'extraction ou de la liste (données
    corrompues, erreur d'E/S, archive invalide).

**2**
:   Utilisation incorrecte (option inconnue ou arguments de fichier
    manquants).

# EXEMPLES

Lister le contenu d'une archive :

    unlzx -v jeu.lzx

Extraire tous les fichiers d'une archive :

    unlzx jeu.lzx

Extraire depuis l'entrée standard :

    cat jeu.lzx | unlzx -c

# VOIR AUSSI

**lha**(1), **unar**(1)

# BOGUES

Aucun bogue connu.
Signalez les problèmes au responsable du paquet Debian.

# AUTEURS

Écrit à l'origine par Jonathan Forbes et Tomi Poutanen (1995).
Support de l'entrée standard ajouté par Erik Meusel (2001).

Empaqueté pour Debian/Ubuntu par Nicolas HOUDELOT <nicolas@demosdebs.org>
