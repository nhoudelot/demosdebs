% propulse(1) "Propulse Tracker 0.9.6.1" "" "2026-06-10" "Manuel des commandes générales"
% Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-06-10

# NOM

**propulse** - tracker multiplateforme compatible avec les modules Amiga ProTracker

# SYNOPSIS

**propulse** [*fichier*]

# DESCRIPTION

**Propulse** est un tracker permettant de créer et de jouer des modules
compatibles Amiga ProTracker (.MOD), avec une interface inspirée d'Impulse
Tracker et de Schism Tracker.

Il dispose d'un moteur de lecture très fidèle basé sur le travail de 8bitbubsy,
lui-même issu d'un désassemblage du firmware original de l'Amiga ProTracker.
Les cas de test tels que *black_queen.mod* et les modules de test MPT sont
reproduits correctement.

Un argument *fichier* optionnel peut être passé pour ouvrir un module
directement au démarrage.

# OPTIONS

**propulse** ne prend actuellement pas en charge d'options en ligne de commande,
si ce n'est l'ouverture d'un fichier au démarrage.

# FONCTIONNALITÉS

- Raccourcis clavier familiers issus d'Impulse Tracker et de Schism Tracker
- Raccourcis clavier, palettes de couleurs, polices bitmap et dispositions
  d'écran entièrement configurables
- Export WAV avec bouclage et fondu de fin optionnels
- Éditeur d'échantillons intégré, piloté à la souris

# FORMATS SUPPORTÉS

**MOD**
:   Charge et sauvegarde les modules Amiga ProTracker, y compris les modules
    Ultimate SoundTracker à 15 samples, NoiseTracker et les fichiers PowerPacked.

**P61A**
:   Importe les modules compressés au format The Player 6.1a.

**IT**, **S3M**
:   Importe les modules Impulse Tracker et Scream Tracker 3.

**Échantillons**
:   raw, IFF 8SVX, WAV, MP3 et Ogg Vorbis (nécessite la bibliothèque BASS).

# FICHIERS

*~/.config/propulse/*
:   Répertoire de configuration par utilisateur (raccourcis, palette de couleurs,
    paramètres).

*/usr/share/propulse/data/*
:   Fichiers de données partagés (polices, palettes, icônes).

# BOGUES

Aucun bogue connu. Merci de signaler tout problème sur
<https://github.com/hukkax/Propulse/issues>.

# VOIR AUSSI

**schismtracker**(1)

# AUTEUR

Propulse a été écrit par hukka <https://github.com/hukkax>.

Empaquetage Debian/Ubuntu par Nicolas HOUDELOT <nicolas@demosdebs.org>.
