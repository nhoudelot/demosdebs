---
title: RRIP_GUI
section: 1
header: Commandes utilisateur
date: 2026-06-10
lang: fr
author: "Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>"
---

# NOM

rrip_gui - extracteur audio CD sécurisé, interface graphique GTK3

# SYNOPSIS

**rrip_gui**

# DESCRIPTION

**rrip_gui** est l'interface graphique GTK3 de Rubyripper, un extracteur
audio CD sécurisé inspiré d'Exact Audio Copy (EAC). Il utilise
**cdparanoia**(1) de manière sophistiquée afin de garantir des extractions
précises : chaque piste est extraite plusieurs fois et les résultats sont
comparés bloc par bloc pour détecter et corriger les erreurs de lecture.

Au démarrage, **rrip_gui** analyse automatiquement le lecteur de CD et
récupère les métadonnées depuis GnuDB ou MusicBrainz (selon les préférences
configurées). La fenêtre principale présente cinq boutons dans un panneau de
gauche :

**Préférences**
: Ouvre la boîte de dialogue de préférences comportant des sections pour
l'Extraction sécurisée, l'Analyse TOC, les Codecs, les Métadonnées et les
Autres paramètres. Ces options correspondent à celles disponibles dans
l'interface en ligne de commande **rrip_cli**(1).

**Analyser le lecteur**
: Relit le disque présent dans le lecteur et actualise la liste des pistes
ainsi que les métadonnées.

**Ouvrir le tiroir / Fermer le tiroir**
: Éjecte ou charge le tiroir du lecteur optique.

**Extraire le CD !**
: Lance le processus d'extraction et d'encodage selon les préférences et
la sélection de pistes actuelles. Une vue de progression affiche l'avancement
de l'extraction et de l'encodage ainsi que la sortie du journal en temps réel.

**Quitter / Annuler**
: Quitte l'application, ou interrompt une extraction en cours le cas échéant.

## Boîte de dialogue des préférences

La boîte de dialogue des préférences propose les mêmes options de
configuration que les menus interactifs de **rrip_cli**(1) :

- **Extraction sécurisée** : périphérique de lecture, décalage (offset),
  rembourrage des échantillons, paramètres cdparanoia, compteurs de
  correspondances, nombre maximal de tentatives, éjection, politique du
  journal.
- **Analyse TOC** : cuesheet, mode image fichier unique, pistes cachées,
  gestion des pre-gaps, pre-emphasis.
- **Codecs** : FLAC, Ogg Vorbis, MP3 (LAME), AAC (Nero ou Fraunhofer),
  WavPack, Opus, WAV, encodeur externe, génération de listes de lecture,
  fils d'encodage, normalisation audio.
- **Métadonnées** : choix du fournisseur (GnuDB ou MusicBrainz), paramètres
  du serveur, préférences de pays et de date.
- **Autres** : répertoire de sortie, schémas de nommage des fichiers,
  visualiseur de journaux, gestionnaire de fichiers.

# FICHIERS

**$XDG_CONFIG_HOME/rubyripper/settings**
: Fichier de configuration utilisateur (par défaut **~/.config/rubyripper/settings**
  lorsque **XDG_CONFIG_HOME** n'est pas défini). Créé lors du premier lancement
  et partagé avec **rrip_cli**(1).

**~/.local/share/rubyripper/**
: Cache local pour les entrées de métadonnées GnuDB.

# VOIR AUSSI

**rrip_cli**(1), **cdparanoia**(1), **flac**(1), **oggenc**(1), **lame**(1)

# AUTEUR

Rubyripper a été écrit par Bouke Woudstra et est maintenu à
<https://github.com/bleskodev/rubyripper>.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
