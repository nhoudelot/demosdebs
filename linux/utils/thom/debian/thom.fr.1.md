% thom(1) | Manuels utilisateur thom
% Nicolas HOUDELOT <nicolas@demosdebs.org> ; Eric Botcazou ; Sylvain Huet
% 2026-06-10

# NOM

thom - émulateur de micro-ordinateur Thomson TO7-70

# SYNOPSIS

**thom** [**-m** *fichier.m7*] [**-nodisk**] [**-fast**] [**-nosound**]
[**-geometry** *lxh+x+y*] [**-noshm**] [**-display** *affichage*]
[**-help**]

# DESCRIPTION

**thom** émule le Thomson TO7-70, un micro-ordinateur français 8 bits fondé
sur le processeur Motorola MC6809E. Il reproduit fidèlement le matériel du
TO7-70 : processeur MC6809E, carte mémoire, carte vidéo et les périphériques
suivants : crayon optique, manettes de jeu, lecteur de cassettes et
contrôleur de disquettes.

L'émulateur nécessite un affichage X11 et GTK+ 1.2. Le son est restitué via
PulseAudio.

La ROM du TO7-70 n'est pas fournie pour des raisons de copyright et doit être
obtenue séparément. Les fichiers ROM doivent être placés dans
**/usr/share/thom/**.

## Panneau de contrôle

L'appui sur **Échap** suspend l'émulation et ouvre le panneau de contrôle.
Ce menu permet :

- Réinitialiser le TO7-70 (équivalent à l'appui sur le bouton Reset)
- Redémarrage à froid (équivalent à éteindre puis rallumer)
- Régler la vitesse d'émulation : exacte (MC6809E à 1 MHz) ou maximale
  (vitesse libre, son désactivé)
- Gérer le lecteur de cartouches (format Mémo7, *.m7*)
- Gérer le lecteur de cassettes (format *.k7*)
- Gérer jusqu'à quatre lecteurs de disquettes (format *.sap*, Thomson 5"25
  360 Ko)

## Clavier

Le clavier du TO7-70 est entièrement émulé sur un clavier AZERTY.
Correspondances des touches :

- **STOP** → Tabulation
- **CNT** → Ctrl gauche
- **RAZ** → Fin
- **ACC** → Alt
- **HOME** → Début
- **INS** → Inser
- **EFF** → Suppr
- Touches fléchées → touches fléchées
- **#** est mappé sur **ù** (Maj+2)

## Manettes

Le pavé numérique émule la manette 0 (8 directions) ; le bouton Fire est
mappé sur Ctrl droit.
Le bloc gauche du clavier (A–E, Q–D, W–C) émule la manette 1 tout en
continuant d'envoyer les lettres correspondantes au TO7-70 ; le bouton Fire
est mappé sur Ctrl gauche.

## Crayon optique

La souris émule le crayon optique du TO7-70. Le bouton gauche représente la
pointe du crayon. Le bouton droit bascule l'affichage du curseur souris.

## Son

Le générateur sonore interne 1 bit et le générateur externe 6 bits
(interface Musique et Jeux) sont tous deux émulés. Le son est restitué via
PulseAudio.

## Modes graphiques

L'émulateur prend en charge les profondeurs de couleur X11 8, 16, 24 et
32 bits. La taille de fenêtre par défaut est 640x400 ; l'option
**-geometry 320x200** sélectionne une fenêtre plus petite au rendu plus
rapide.

# OPTIONS

**-help**
:   Afficher l'aide en ligne.

**-m** *fichier.m7*
:   Charger l'image de cartouche Mémo7 *fichier.m7* au démarrage.

**-nodisk**
:   Désactiver le contrôleur de disquettes.

**-fast**
:   Démarrer l'émulateur à vitesse maximale (le son est désactivé dans ce
    mode).

**-nosound**
:   Désactiver la sortie sonore.

**-geometry** *lxh+x+y*
:   Définir la géométrie de la fenêtre. Deux tailles sont supportées :
    **640x400** (par défaut) et **320x200** (rendu plus rapide).

**-noshm**
:   Désactiver l'extension X11 MIT-SHM (mémoire partagée).

**-display** *affichage*
:   Spécifier le serveur X à utiliser.

# FICHIERS

*/usr/share/thom/*
:   Répertoire où doivent être placés les fichiers ROM du TO7-70.

*memo7/*
:   Répertoire recommandé pour les images de cartouches Mémo7 (*.m7*).

*k7/*
:   Répertoire recommandé pour les images de cassettes (*.k7*).

*disks/*
:   Répertoire recommandé pour les images de disquettes Thomson 5"25
    (*.sap*).

# EXEMPLES

Lancer l'émulateur avec les paramètres par défaut :

    thom

Lancer l'émulateur avec une cartouche Mémo7 préchargée :

    thom -m memo7/basic128.m7

Lancer à vitesse maximale (sans son) :

    thom -fast -nosound

Lancer en fenêtre 320x200 :

    thom -geometry 320x200

Se connecter à un serveur X spécifique :

    thom -display :1

# VOIR AUSSI

**xrandr**(1)

# BOGUES

Aucun bogue connu.

# AUTEURS

Écrit par Sylvain Huet en 1996. Porté sous Linux/Windows par Eric Botcazou
(1999-2003). Mis à jour pour les systèmes Linux modernes en 2016.
Empaquetage Debian par Nicolas HOUDELOT <nicolas@demosdebs.org>.
