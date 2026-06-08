% funzyto770(1) | Manuels utilisateur funzyto770
% Nicolas HOUDELOT <nicolas@demosdebs.org> ; Sylvain Huet
% 2026-06-09

# NOM

funzyto770 - émulateur de micro-ordinateurs Thomson TO7 et TO7-70

# SYNOPSIS

**funzyto770** [**-k** *fichier_clavier*] [**-gray**] [**-mono**]

# DESCRIPTION

**funzyto770** émule les Thomson TO7 et TO7-70, micro-ordinateurs français
8 bits fondés sur le processeur Motorola 6809E. L'émulateur nécessite un
affichage X11 et émule le matériel suivant :

- processeur Motorola 6809E
- stylo optique (light pen)
- manettes de jeu (2)
- lecteur de cassette (.k7)
- cartouches ROM memo7 amovibles (16 ko chacune)

Au démarrage, l'émulateur charge la ROM haute du TO7 depuis le fichier
**romto770** et la cartouche BASIC depuis **memo7/basic**, tous deux attendus
dans le répertoire de travail courant. Il entre ensuite dans le moniteur
interactif.

## Moniteur

Le moniteur est une interface texte permettant de contrôler l'émulateur.
Les commandes disponibles sont les suivantes :

**go**
:   Démarrer ou reprendre l'émulation.

**reset**
:   Simuler l'appui sur le bouton reset du TO7.

**k7** *fichier*
:   Charger un nouveau fichier cassette (format .k7).

**seek** *hex*
:   Positionner la bande cassette (valeur hexadécimale).

**load** *fichier*
:   Charger une image de cartouche memo7.

**speed** *hex*
:   Régler le compteur de ralentissement de l'émulation. Utilisez 0 pour
    la vitesse maximale.

**dir**
:   Lister les fichiers du répertoire courant.

**cd** *répertoire*
:   Changer le répertoire courant.

**pwd**
:   Afficher le répertoire courant.

**q**
:   Quitter l'émulateur.

## Commandes souris pendant l'émulation

**Bouton droit**
:   Suspendre l'émulation et revenir au moniteur.

**Bouton du milieu**
:   Déplacer le stylo optique sur l'écran (maintenu enfoncé lors du
    déplacement).

**Bouton gauche**
:   Appuyer sur la pointe du stylo optique (déclencheur).

# OPTIONS

**-k** *fichier_clavier*
:   Fichier de configuration du clavier. Par défaut **keyto7** dans le
    répertoire courant. Ce fichier est généré par **funzy_enterkey**(1).

**-gray**
:   Utiliser une palette de niveaux de gris (pour les écrans en niveaux
    de gris).

**-mono**
:   Utiliser un rendu strictement monochrome (pour les écrans monochromes).

# FICHIERS

*keyto7*
:   Fichier de configuration du clavier par défaut, généré par
    **funzy_enterkey**(1).

*romto770*
:   Image de la ROM haute du TO7 (6144 octets). Obligatoire. À placer dans
    le répertoire de travail. À obtenir avec **funzy_getrom**(1).

*memo7/basic*
:   Image de la cartouche BASIC (16384 octets). Chargée automatiquement au
    démarrage. À obtenir avec **funzy_getmemo7**(1).

*memo7/*
:   Répertoire contenant les images de cartouches memo7 supplémentaires.

# EXEMPLES

Lancer l'émulateur avec la configuration clavier par défaut :

    funzyto770

Lancer l'émulateur avec une configuration clavier personnalisée :

    funzyto770 -k monclavier

Une fois dans le moniteur, démarrer l'émulation :

    ok
    0000 > go

Charger un programme depuis une cassette et le lancer :

    ok
    0000 > k7 monprog.k7
    ok
    0000 > go

# VOIR AUSSI

**funzy_enterkey**(1), **funzy_getrom**(1), **funzy_getmemo7**(1),
**funzy_wav2k7**(1)

# BOGUES

Aucun bogue connu.

# AUTEURS

Écrit par Sylvain Huet en 1996. Empaquetage Debian par Nicolas HOUDELOT
<nicolas@demosdebs.org>.
