% nedplayer(1) Manuel utilisateur NED Player
% bartoshe; Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-06-09

# NOM

nedplayer - lecteur de productions écrites dans le langage de script NED

# SYNOPSIS

**nedplayer**

# DESCRIPTION

**nedplayer** est un moteur d'exécution pour les productions écrites
dans le langage de script NED, composant du framework Dead Deer
développé par bartoshe. Il est principalement destiné aux contenus
démo­scene, aux présentations interactives et aux jeux simples.

Le lecteur doit être lancé depuis le répertoire qui contient le
sous-répertoire **data/** avec un fichier **player.conf** valide. Au
démarrage, il lit ce fichier de configuration pour déterminer quel
script NED charger et quel mode d'affichage utiliser.

Le moteur supporte :

- le rendu 3-D accéléré par OpenGL
- l'audio positionnel OpenAL
- la lecture de musique au format Vorbis/Ogg
- le décodage d'images JPEG 2000
- le rendu de polices TrueType via FreeType
- une machine virtuelle de script NED intégrée pour les animations,
  les systèmes de particules, la physique et les automates à états finis

# OPTIONS

**nedplayer** n'accepte aucune option en ligne de commande. Toute la
configuration est lue dans le fichier **data/player.conf** situé dans
le répertoire de travail courant.

# FICHIERS

*./data/player.conf*
: Fichier de configuration principal. La première ligne indique le
  chemin vers le script NED à exécuter (relatif au répertoire courant).
  Les lignes suivantes peuvent contenir des indications de mode
  d'affichage : **fullscreen**, **windowed** ou **fullscreenlowres**.

*./data/*
: Répertoire contenant l'ensemble des ressources (scripts, images,
  sons, polices) utilisées par la production.

# CODES DE RETOUR

**0**
: Fin normale.

**valeur non nulle**
: Impossible d'initialiser le lecteur (fichier **data/player.conf**
  introuvable, échec du contexte OpenGL, etc.).

# BOGUES

Aucun bogue connu. Merci de signaler tout problème au responsable du
paquet Debian.

# VOIR AUSSI

Page d'accueil du projet Dead Deer : <https://deaddeer.free.fr/>

# AUTEURS

bartoshe.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>.
