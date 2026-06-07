% aacgain(1) Version 2.0.0 | Commandes utilisateur
% Christian Marillat <marillat@deb-multimedia.org>, Nicolas Houdelot <nicolas@demosdebs.org>
% 2026-06-07

## NOM

**aacgain** - normalise le volume de fichiers de musique numérique

## SYNOPSIS

**aacgain** [*options*] *\<fichier\>* [*\<fichier 2\>* ...]

## DESCRIPTION

**aacgain** version 2.0.0, dérivé de **mp3gain** version 1.5.2,
copyright (c) 2001-2009 par Glen Sawyer.
Support AAC copyright (c) 2004-2009 David Lasker, Altos Design, Inc.

Utilise **mpglib**, disponible sur <http://www.mpg123.de>.
Le support AAC utilise **faad2** (<http://www.audiocoding.com>) et
**mp4v2** de mpeg4ip (<http://www.mpeg4ip.net>).

## OPTIONS

**-v**
:   Affiche le numéro de version.

**-g** *i*
:   Applique le gain *i* sans effectuer d'analyse.

**-l 0** *i*
:   Applique le gain *i* au canal 0 (canal gauche) sans analyse.
    Fonctionne **UNIQUEMENT** pour les fichiers STÉRÉO, pas Joint Stereo.

**-l 1** *i*
:   Applique le gain *i* au canal 1 (canal droit).

**-e**
:   Ignore l'analyse d'album, même si plusieurs fichiers sont spécifiés.

**-r**
:   Applique automatiquement le gain par piste (*Track gain*) — tous les
    fichiers sont normalisés au même volume.

**-k**
:   Abaisse automatiquement le gain piste/album pour éviter l'écrêtage.

**-a**
:   Applique automatiquement le gain d'album (*Album gain*). Les fichiers
    proviennent tous du même album : un seul ajustement de gain est appliqué
    à tous les fichiers, de sorte que leurs volumes relatifs restent
    inchangés, mais le volume moyen de l'album est normalisé.

**-m** *i*
:   Modifie le gain MP3 suggéré par l'entier *i*.

**-d** *n*
:   Modifie le gain en dB suggéré par la valeur flottante *n*.

**-c**
:   Ignore l'avertissement d'écrêtage lors de l'application du gain.

**-o**
:   La sortie est une liste délimitée par tabulations, compatible avec les
    bases de données.

**-t**
:   Écrit le MP3 modifié dans un fichier temporaire puis supprime l'original
    (comportement par défaut). Un fichier temporaire est toujours utilisé
    pour les fichiers AAC, quelle que soit cette option.

**-T**
:   Modifie directement le fichier MP3 en place (opposé de **-t**).
    Ignoré pour les fichiers AAC.

**-q**
:   Mode silencieux : aucun message de statut.

**-p**
:   Préserve l'horodatage du fichier original.

**-x**
:   Recherche uniquement l'amplitude maximale du fichier.

**-f**
:   Suppose que le fichier d'entrée est un fichier MPEG 2 Layer III
    (c'est-à-dire ne vérifie pas les fichiers Layer I ou Layer II mal
    nommés). Cette option est ignorée pour les fichiers AAC.

**-?** ou **-h**
:   Affiche ce message d'aide.

**-i** *n*
:   Sélectionne la piste audio d'index *n* lorsque le fichier AAC contient
    plusieurs pistes audio (index base 0, défaut : 0). Sans effet sur les
    fichiers MP3.

**-s c**
:   Vérifie uniquement les informations de tag stockées (aucun autre
    traitement).

**-s d**
:   Supprime les informations de tag stockées (aucun autre traitement).

**-s s**
:   Ignore les informations de tag stockées (ne lit ni n'écrit les tags).

**-s r**
:   Force le recalcul (ne lit pas les informations de tag).

**-s i**
:   Utilise le tag ID3v2 pour les informations de gain MP3.

**-s a**
:   Utilise le tag APE pour les informations de gain MP3 (défaut).

**-u**
:   Annule les modifications effectuées (d'après les informations de tag
    stockées).

**-w**
:   « Enroule » le changement de gain si gain+changement > 255 ou
    gain+changement < 0. MP3 uniquement. Voir la section
    **EXPLICATION DU MODE WRAP** ci-dessous pour les détails.

## NOTES

- Si vous spécifiez **-r** et **-a**, seule la seconde option sera
  appliquée.

- Si vous ne spécifiez pas **-c**, le programme s'arrêtera et demandera
  confirmation avant d'appliquer un changement de gain susceptible
  d'écrêter le fichier.

- Contrairement aux fichiers MP3, la normalisation des fichiers AAC n'est
  **pas** complètement réversible. L'option **-u** restaure le fichier à
  un état fonctionnellement équivalent, mais le résultat ne sera pas
  bit pour bit identique à l'original.

## EXPLICATION DU MODE WRAP

Le champ « global gain » qu'**aacgain** ajuste est un entier non signé sur
8 bits, donc les valeurs possibles vont de 0 à 255.

La plupart des fichiers MP3 ne dépassent pas un global gain de 230, ce qui
laisse une marge suffisante pour augmenter le gain de 37 dB sans problème.

La difficulté apparaît en bas de la plage. Certains encodeurs créent des
trames avec un global gain de 0 pour les trames silencieuses. Historiquement,
mp3gain « enroulait » le résultat à 255 lorsque le gain descendait en dessous
de 0, garantissant qu'un fichier abaissé puis rehaussé du même montant restait
bit pour bit identique.

Cependant, certains encodeurs produisent des trames à gain 0 contenant des
données audio réelles. Tant que le global gain est 0, ces données sont
inaudibles ; mais si le gain est abaissé, le global gain se retrouve à une
valeur très élevée, pouvant provoquer un bref et très fort parasite à la
lecture.

Le comportement par défaut actuel est donc de **ne pas** enrouler les
changements de gain :

1. Si un changement de gain ferait descendre le global gain d'une trame
   en dessous de 0, il est limité à 0.
2. Si un changement de gain ferait monter le global gain d'une trame
   au-dessus de 255, il est limité à 255.
3. Si le global gain d'une trame est déjà 0, il n'est pas modifié, même
   pour un changement de gain positif.

Utilisez **-w** pour retrouver le comportement d'enroulement d'origine.
L'option **-w** n'est pas prise en charge pour les fichiers AAC ; son
application à un fichier AAC est traitée comme une erreur et le fichier ne
sera pas modifié.

## VOIR AUSSI

**mp3gain**(1)

## AUTEURS

**aacgain** a été écrit par David Lasker, Altos Design, Inc., basé sur
**mp3gain** de Glen Sawyer.

Cette page de manuel est maintenue par Christian Marillat
\<marillat@deb-multimedia.org\>.

## COPYRIGHT

Copyright (C) 2004-2009 David Lasker, Altos Design, Inc.
Copyright (C) 2001-2009 Glen Sawyer (mp3gain).

This program is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the Free
Software Foundation; either version 2 of the License, or (at your option)
any later version.
