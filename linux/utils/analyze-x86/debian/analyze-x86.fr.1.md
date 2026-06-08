% analyze-x86(1) analyze-x86 1.0+git20181231
% Nicolas HOUDELOT <nicolas@demosdebs.org>; Alexey Shvetsov; Ivan Shapovalov
% 2026-06-08

# NOM

analyze-x86 - analyser un binaire x86 pour l'utilisation des jeux d'instructions

# SYNOPSIS

**analyze-x86** *binaire*

# DESCRIPTION

**analyze-x86** désassemble un binaire ELF x86 à l'aide de **objdump**(1) et
compte le nombre d'instructions appartenant à chaque extension du jeu
d'instructions x86.  Il affiche le nombre d'instructions détectées par classe
ainsi qu'un total général, permettant de déterminer aisément le jeu
d'instructions minimal requis pour exécuter le binaire.

# ARGUMENTS

*binaire*
:   Chemin vers le binaire ELF x86 ou x86-64 à analyser.

# SORTIE

Chaque ligne de la sortie est séparée par des tabulations et a la forme :

    binaire<TAB>classe<TAB>compteur

Où *binaire* est le chemin passé en argument, *classe* est l'un des noms de
jeux d'instructions listés ci-dessous, et *compteur* est le nombre
d'instructions appartenant à cette classe.  Une dernière ligne avec la classe
**total** donne le nombre total d'instructions désassemblées.

Seules les classes ayant un compteur non nul sont affichées.

## Jeux d'instructions détectés

Les classes d'instructions suivantes sont reconnues, dans l'ordre de détection :

**cpuid**, **nop**, **call**, **i486**, **i586**, **i686**, **3dnow!**,
**3dnowext**, **mmx**, **sse**, **sse2**, **sse3**, **ssse3**, **sse4.1**,
**sse4.2**, **sse4a**, **aes**, **avx**, **avx2**

# CODES DE RETOUR

**0**
:   Succès, ou le binaire ne contient aucune instruction.

**1**
:   Nombre d'arguments incorrect, échec de l'invocation de **objdump**(1), ou
    erreur d'entrée/sortie lors de la lecture de sa sortie.

# EXEMPLES

Analyser un binaire système :

    analyze-x86 /usr/bin/ls

Analyser tous les binaires ELF d'un répertoire et trier par utilisation de SSE4.2 :

    for f in /usr/bin/*; do analyze-x86 "$f" 2>/dev/null; done \
        | awk -F'\t' '$2=="sse4.2"{print $3, $1}' | sort -rn | head

# VOIR AUSSI

**objdump**(1), **readelf**(1), **file**(1)

# BOGUES

Aucun bogue connu.  Veuillez signaler les bogues à
**https://github.com/alexxy/analyze-x86/issues**.

# AUTEURS

Meya Argenta <fierevere@ya.ru> (auteur original, 2010)

Alexey Shvetsov <alexxy@gentoo.org> (2012)

Ivan Shapovalov <intelfx@intelfx.name> (2016)

Nicolas HOUDELOT <nicolas@demosdebs.org> (empaquetage Debian)
