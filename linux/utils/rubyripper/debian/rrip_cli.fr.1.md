---
title: RRIP_CLI
section: 1
header: Commandes utilisateur
date: 2026-06-10
lang: fr
author: "Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>"
---

# NOM

rrip_cli - extracteur audio CD sécurisé, interface en ligne de commande

# SYNOPSIS

**rrip_cli** [**-V**] [**-f** *FICHIER*] [**-v**] [**-c**] [**-d**] [**-B**] [**-h**]

# DESCRIPTION

**rrip_cli** est l'interface en ligne de commande de Rubyripper, un extracteur
audio CD sécurisé inspiré d'Exact Audio Copy (EAC). Il utilise
**cdparanoia**(1) de manière sophistiquée afin de garantir des extractions
précises : chaque piste est extraite plusieurs fois et les résultats sont
comparés bloc par bloc pour détecter et corriger les erreurs de lecture.

Lancé sans l'option **-d**, **rrip_cli** présente un menu textuel interactif
permettant à l'utilisateur de consulter les métadonnées du disque, sélectionner
les pistes et configurer tous les paramètres d'extraction avant de démarrer.

## Menus interactifs

Le menu principal donne accès à cinq catégories de préférences :

**Extraction sécurisée**
: Périphérique de lecture, décalage (offset) du lecteur, rembourrage des
échantillons manquants, paramètres supplémentaires pour cdparanoia, nombre de
correspondances requises (normales et erronées), nombre maximal de tentatives,
éjection automatique après extraction, et politique du fichier journal.

**Analyse de la table des matières (TOC)**
: Génération d'une cuesheet, mode extraction fichier unique (image),
extraction des secteurs audio cachés, gestion des pre-gaps (préfixe ou
suffixe), et correction du pre-emphasis (tag cuesheet ou traitement sox).

**Codecs**
: Activation et configuration de FLAC, Ogg Vorbis (oggenc), MP3 (LAME),
AAC (Nero), AAC (Fraunhofer), WavPack, Opus, WAV, et tout encodeur externe.
Contrôle également la génération de listes de lecture, le nombre maximal de
fils d'encodage simultanés, et la normalisation audio (replaygain ou
normalize).

**Métadonnées**
: Choix du fournisseur de métadonnées (aucun, GnuDB ou MusicBrainz),
serveur et identifiants GnuDB, et préférences de pays/date pour MusicBrainz.

**Autres**
: Répertoire de sortie de base, schémas de nommage des fichiers pour les
albums normaux, les compilations et les extractions en fichier unique (à l'aide
des variables **%a** artiste, **%b** album, **%g** genre, **%y** année,
**%f** codec, **%n** numéro de piste, **%t** titre, **%va** artiste
compilation). Configure également le visualiseur de journaux, le gestionnaire
de fichiers et les modes verbeux/débogage.

# OPTIONS

**-V**, **\-\-version**
: Affiche la version actuelle de Rubyripper et quitte.

**-f** *FICHIER*, **\-\-file** *FICHIER*
: Charge les préférences depuis *FICHIER* au lieu du fichier de configuration
  par défaut. Si le fichier n'existe pas, les préférences par défaut sont
  utilisées et un avertissement est affiché.

**-v**, **\-\-verbose**
: Active la sortie détaillée pendant l'extraction et l'encodage.

**-c**, **\-\-configure**
: Ouvre le menu des préférences interactif au démarrage, avant de lire le
  disque.

**-d**, **\-\-defaults**
: Ignore tous les menus interactifs et démarre l'extraction immédiatement en
  utilisant les préférences actuelles.

**-B**, **\-\-batch**
: Quitte automatiquement une fois l'extraction terminée. Utile en combinaison
  avec **-d** pour une utilisation sans surveillance.

**-h**, **\-\-help**
: Affiche un résumé d'utilisation et quitte.

# FICHIERS

**$XDG_CONFIG_HOME/rubyripper/settings**
: Fichier de configuration utilisateur (par défaut **~/.config/rubyripper/settings**
  lorsque **XDG_CONFIG_HOME** n'est pas défini). Créé lors du premier lancement.

# VOIR AUSSI

**rrip_gui**(1), **cdparanoia**(1), **flac**(1), **oggenc**(1), **lame**(1)

# AUTEUR

Rubyripper a été écrit par Bouke Woudstra et est maintenu à
<https://github.com/bleskodev/rubyripper>.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
