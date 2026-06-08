% elfling(1) Manuel de l'utilisateur elfling
% Nicolas HOUDELOT (nicolas@demosdebs.org), Minas et Calodox
% 2026-06-09

# NOM

elfling - éditeur de liens compresseur pour fichiers ELF

# SYNOPSIS

**elfling** [**-o***sortie*] [**-c***paramètres*] [**-l***bibliothèque*]... [**-f***option*]... *fichier.o*

# DESCRIPTION

**elfling** est un éditeur de liens compresseur à modélisation de contexte qui
transforme un fichier objet ELF relocalisable (*.o*) en un exécutable ELF minimal
auto-décompresseur. Il s'inspire de **Crinkler**, un éditeur de liens compresseur
pour la scène demo Windows, et cible la scène demo Linux où la taille des
exécutables est critique.

**elfling** lit un unique fichier objet ELF (i386 ou x86\_64), résout les
relocalisations de symboles, construit une table de sauts pour les importations
via un stub de liaison dynamique par hachage, compresse le code et les données
résultants à l'aide d'un modèle de contexte arithmétique adaptatif, et produit
un binaire ELF auto-décompresseur intégrant le stub de décompression.

Les limitations suivantes s'appliquent dans la version actuelle :

- Un seul fichier objet d'entrée est supporté.
- Seules les importations des bibliothèques SDL 1.2 et OpenGL sont résolues à
  l'exécution ; l'option **-l** est analysée mais ignorée pour la résolution des
  bibliothèques.
- Certains types de sections ou de relocalisations ELF peuvent ne pas être gérés
  et provoquer un plantage.
- L'exécution d'une sortie i386 sur un système 64 bits nécessite les
  bibliothèques d'exécution 32 bits correspondantes.

# OPTIONS

**-o***sortie*
:   Écrit l'exécutable compressé dans *sortie*. Par défaut : **c.out**.

**-c***paramètres*
:   Définit la configuration des contextes de compression. *paramètres* est une
    chaîne hexadécimale encodant le poids et la taille de chaque contexte
    arithmétique (jusqu'à 16 contextes). Lorsqu'elle est omise, des paramètres
    par défaut sont déterminés automatiquement.
    Exemple : **-c0801010205070b0b0734273ac30403158d**

**-l***bibliothèque*
:   Déclare une dépendance vers une bibliothèque partagée (ex. :
    **-llibc.so.6**, **-llibSDL-1.2.so.0**, **-llibGL.so.1**). Cette option est
    analysée mais actuellement ignorée ; seules SDL 1.2 et OpenGL sont résolues
    à l'exécution.

**-f***option*
:   Active une option booléenne. *option* est accolée directement à **-f** sans
    séparateur. Options reconnues :

    **verbose**
    :   Affiche des informations détaillées sur les sections, les importations
        et les relocalisations durant l'édition de liens. S'active avec
        **-fverbose**.

# SORTIE

**elfling** affiche sur la sortie standard les informations de progression
suivantes :

**Arch: i386** ou **Arch: x86\_64**
:   Architecture détectée dans le fichier objet d'entrée.

**Section** *nom* **@** *adresse*
:   Adresse virtuelle assignée à chaque section dans l'image de sortie.

**Wrote** *N* **bytes**
:   Taille finale de l'exécutable compressé en octets.

# EXEMPLES

Compresser un programme C 32 bits :

    gcc -Os -c prog.c -fomit-frame-pointer -fno-exceptions -o prog.o -m32
    elfling prog.o -oprog.out -llibc.so.6
    chmod 755 prog.out

Compresser un programme 64 bits avec des paramètres de compression explicites :

    gcc -Os -c prog.c -fomit-frame-pointer -fno-exceptions -o prog.o
    elfling prog.o -oprog.out -c0801010205070b0b0734273ac30403158d -llibc.so.6
    chmod 755 prog.out

Compresser une demo SDL/OpenGL avec sortie verbeuse :

    gcc -Os -c demo.c -fomit-frame-pointer -fno-exceptions -ffast-math \
        -fsingle-precision-constant -o demo.o -m32
    elfling demo.o -odemo.out -llibSDL-1.2.so.0 -llibGL.so.1 -fverbose

# FICHIERS

**test/tmp**
:   Fichier temporaire créé durant l'édition de liens. Contient le binaire
    lié non compressé avant compression. Écrasé à chaque exécution.

# BOGUES

- Un seul fichier objet d'entrée peut être lié à la fois.
- Les options de bibliothèques (**-l**) sont ignorées ; SDL 1.2 et OpenGL sont
  toujours supposées disponibles.
- Certains types de relocalisations ELF ou agencements de sections inhabituels
  peuvent provoquer un plantage.
- La sortie 32 bits sur un système 64 bits nécessite les bibliothèques de
  compatibilité 32 bits.

Signalez les bogues sur **https://github.com/google/elfling**.

# AUTEURS

Écrit par Minas et Calodox. Paqueté pour Debian par Nicolas HOUDELOT
<nicolas@demosdebs.org>.

# VOIR AUSSI

**ld**(1), **gcc**(1), **nasm**(1), **objdump**(1), **readelf**(1)
