% funzy_wav2k7(1) | Manuels utilisateur funzyto770
% Nicolas HOUDELOT <nicolas@demosdebs.org> ; Sylvain Huet
% 2026-06-09

# NOM

funzy_wav2k7 - convertir un enregistrement WAV de cassette en format TO7 .k7

# SYNOPSIS

**funzy_wav2k7** *fichier.wav*

# DESCRIPTION

**funzy_wav2k7** convertit un fichier audio WAV enregistré depuis une cassette
Thomson TO7 ou TO7-70 en format binaire .k7, utilisable par l'émulateur
**funzyto770** et les utilitaires **funzy_getrom**(1) et
**funzy_getmemo7**(1).

Le fichier WAV doit être enregistré en mono 8 bits à 44100 Hz. Le fichier de
sortie prend le nom du fichier d'entrée avec l'extension **.wav** remplacée
par **.k7**.

Si la conversion ne produit pas un fichier .k7 exploitable, vérifiez que le
niveau d'enregistrement était suffisant. Si nécessaire, appliquez une
égalisation en renforçant la bande de fréquences 4,5 kHz–6,3 kHz.

# OPTIONS

Ce programme n'accepte aucune option.

# FICHIERS

*fichier.wav*
:   Fichier audio d'entrée (8 bits mono, 44100 Hz).

*fichier.k7*
:   Image cassette de sortie au format TO7.

# EXEMPLES

Convertir un enregistrement WAV en format .k7 :

    funzy_wav2k7 monprog.wav

Le fichier **monprog.k7** est créé et peut être chargé par l'émulateur
**funzyto770**.

Convertir un enregistrement de ROM pour l'extraction avec **funzy_getrom**(1) :

    funzy_wav2k7 romto770.wav
    funzy_getrom romto770.k7

# VOIR AUSSI

**funzy_getrom**(1), **funzy_getmemo7**(1)

# BOGUES

Aucun bogue connu. Veuillez signaler les bogues sur <https://bugs.debian.org/>.

# AUTEURS

Écrit par Sylvain Huet en 1996 (version 2.1). Empaquetage Debian par Nicolas HOUDELOT
<nicolas@demosdebs.org>.
