% PROJECTX(1) Project X 0.91.10 | Commandes utilisateur
% Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% Juin 2026

# NOM

projectx - utilitaire de démultiplexage et réparation de flux DVB

# SYNOPSIS

**projectx** [*OPTIONS*] [*FICHIER*...]

# DESCRIPTION

**Project X** est un utilitaire libre écrit en Java, conçu pour
démultiplexer, nettoyer et réparer des flux de transport DVB (Digital Video
Broadcasting). La télévision et la radio numériques européennes utilisent le
standard DVB pour diffuser leurs données ; Project X permet d'inspecter ces
transmissions, de prendre en charge un grand nombre de types de flux et de
corriger les erreurs introduites lors de la réception ou de l'enregistrement.

Le programme fonctionne aussi bien avec une interface graphique (GUI) qu'en
mode ligne de commande sans affichage, ce qui le rend adapté à des flux de
travail automatisés ou à des serveurs sans écran.

Les formats d'entrée supportés comprennent les flux de transport MPEG-1/2
(TS), les flux programme (PS/VOB), les flux PVA (AVerMedia, Technisat), ainsi
que les enregistrements provenant de divers décodeurs (Dreambox, Topfield).
La sortie peut être constituée de flux élémentaires démultiplexés (vidéo,
audio, sous-titres) ou de fichiers re-multiplexés.

# OPTIONS

**-gui**
:   Démarrer avec l'interface graphique, même lorsque des fichiers d'entrée
    sont fournis sur la ligne de commande.

**-?**
:   Afficher un résumé d'utilisation et quitter.

**-ini** *FICHIER*
:   Utiliser *FICHIER* comme fichier de configuration à la place du fichier
    par défaut `~/.projectx/projectx.conf`.

**-out** *RÉPERTOIRE*
:   Écrire les fichiers de sortie dans *RÉPERTOIRE* (qui doit exister).

**-name** *NOM*
:   Utiliser *NOM* comme nom de base pour les fichiers de sortie.

**-demux**
:   Démultiplexer le flux d'entrée en flux élémentaires séparés (action par
    défaut).

**-tovdr**
:   Convertir le flux d'entrée au format VDR.

**-tom2p**
:   Convertir le flux d'entrée au format MPEG-2 Program Stream (M2P).

**-topva**
:   Convertir le flux d'entrée au format PVA.

**-tots**
:   Convertir le flux d'entrée au format MPEG-2 Transport Stream (TS).

**-filter**
:   Appliquer uniquement un filtrage par PID, sans démultiplexage complet.

**-id** *LISTEPID*
:   Restreindre le traitement aux PID listés dans *LISTEPID* (valeurs
    décimales ou hexadécimales préfixées par `0x`, séparées par des virgules).

**-cut** *FICHIER*
:   Charger les points de coupe/découpage depuis *FICHIER*.

**-chp** *FICHIER*
:   Charger les marqueurs de chapitres depuis *FICHIER*.

**-split** *TAILLE*
:   Découper les fichiers de sortie par tranches de *TAILLE* mégaoctets.

**-log**
:   Écrire un journal de traitement à côté des fichiers de sortie.

**-saveini**
:   Sauvegarder les paramètres courants dans le fichier de configuration à
    la sortie du programme.

**-webif**
:   Démarrer l'interface HTTP intégrée pour le contrôle à distance.

**-set** *CLÉ=VALEUR*
:   Substituer une clé de configuration à l'exécution. Cette option peut
    être répétée pour définir plusieurs clés.

**-dvx1**
:   Activer le mode DVX 1 : sortie en fichiers projet découpés.

**-dvx2**
:   Activer le mode DVX 2 : sortie découpée avec en-tête RIFF pour l'audio
    AC-3.

**-dvx3**
:   Activer le mode DVX 3 : sortie découpée avec en-tête RIFF pour l'audio
    MPEG.

**-dvx4**
:   Activer le mode DVX 4 : sortie découpée avec en-têtes RIFF pour l'audio
    AC-3 et MPEG.

# FICHIERS

`~/.projectx/projectx.conf`
:   Fichier de configuration utilisateur par défaut. Créé automatiquement
    au premier lancement. Si un fichier `~/X.ini` est trouvé, il est
    migré vers cet emplacement.

# ENVIRONNEMENT

`JAVA_HOME`
:   Chemin vers l'environnement d'exécution Java utilisé pour lancer
    Project X.

# VOIR AUSSI

**java**(1)

# BOGUES

Les rapports de bogues doivent être soumis au gestionnaire amont à
l'adresse <https://sourceforge.net/p/project-x/bugs/>.

# AUTEUR

Project X a été écrit par dvb.matt, avec des contributions de TheHorse,
R-One, roehrist, pstorch, chrisg, jazzydane, Kano, RoEn, catapult, Bonni,
MartinR et d'autres.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
