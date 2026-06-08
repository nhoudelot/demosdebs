% rocket-sync-tracker(1) Manuel d'utilisation de Rocket Sync-Tracker
% Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2024-03-13

# NOM

rocket-sync-tracker - éditeur de sync-tracker pour les productions demoscène

# SYNOPSIS

**rocket-sync-tracker** [*FICHIER*]

# DESCRIPTION

**Rocket** est un sync-tracker, un outil de synchronisation entre la musique
et les visuels dans les productions demoscène. Il fournit un éditeur graphique
basé sur Qt5 et une bibliothèque cliente en C ANSI (**librocket**) pouvant soit
communiquer avec l'éditeur via une connexion réseau pendant le développement,
soit rejouer un jeu de données exporté dans la version finale.

L'interface de l'éditeur est organisée comme un tracker musical : les pistes
(colonnes) contiennent des variables nommées ; les lignes représentent des
instants discrets dans le temps. Des images-clés peuvent être définies à
n'importe quelle ligne ; Rocket interpole entre les images-clés adjacentes
selon le mode d'interpolation choisi pour chaque image-clé.

Si *FICHIER* est fourni, le fichier de projet **.rocket** spécifié est ouvert
au démarrage.

# MODES D'INTERPOLATION

**Step (Pas)**
:   Renvoie toujours la valeur exacte de l'image-clé (aucune interpolation).

**Linear (Linéaire)**
:   Effectue une interpolation linéaire entre la valeur de l'image-clé
    courante et celle de la suivante.

**Smooth (Lissé)**
:   Applique une interpolation en S (smooth-step) entre deux valeurs.

**Ramp (Rampe)**
:   Similaire à Linear, avec une exponentiation appliquée au facteur
    d'interpolation.

# RACCOURCIS CLAVIER

**Haut**/**Bas**/**Gauche**/**Droite**
:   Déplacer le curseur.

**PgUp**/**PgDn**
:   Déplacer le curseur de 16 lignes vers le haut ou le bas.

**Début**/**Fin**
:   Déplacer le curseur au début ou à la fin de la piste.

**Ctrl+Gauche**/**Ctrl+Droite**
:   Déplacer la piste courante vers la gauche ou la droite.

**Entrée**
:   Saisir une valeur d'image-clé à la position du curseur.

**Suppr**
:   Supprimer l'image-clé à la position du curseur.

**i**
:   Faire défiler les modes d'interpolation.

**k**
:   Activer ou désactiver un signet sur la ligne courante.

**Alt+PgUp**/**Alt+PgDn**
:   Aller au signet précédent ou suivant.

**Espace**
:   Mettre en pause ou reprendre la lecture de la démo.

**Maj+Haut**/**Bas**/**Gauche**/**Droite**
:   Étendre la sélection.

**Ctrl+C**
:   Copier la sélection.

**Ctrl+V**
:   Coller.

**Ctrl+Z**
:   Annuler.

**Maj+Ctrl+Z**
:   Rétablir.

**Ctrl+B**
:   Décaler (biaiser) les images-clés sélectionnées.

**Maj+Ctrl+Haut**/**Maj+Ctrl+Bas**
:   Décalage rapide de ±0,1.

**Ctrl+Haut**/**Ctrl+Bas**
:   Décalage rapide de ±1.

**Ctrl+PgUp**/**Ctrl+PgDn**
:   Décalage rapide de ±10.

**Maj+Ctrl+PgUp**/**Maj+Ctrl+PgDn**
:   Décalage rapide de ±100.

# FICHIERS

***.rocket**
:   Fichier de projet contenant toutes les pistes et images-clés d'une
    production.

**~/.config/rocket/**
:   Paramètres de l'application Qt par utilisateur.

# NOTES

Pendant le développement, **rocket-sync-tracker** écoute sur le port TCP
**1338** (par défaut) les connexions entrantes d'un client de démo lié à
**librocket**. Toutes les modifications apportées dans l'éditeur sont
répercutées en temps réel sur le client. Pour la version finale, la démo est
compilée avec le symbole préprocesseur **SYNC_PLAYER** défini, et rejoue le
jeu de données précédemment exporté depuis l'éditeur, sans aucune connexion
réseau.

# BOGUES

Signaler les bogues sur : <https://github.com/rocket/rocket/issues>

Ou à la liste de diffusion Rocket : <rocket-dev@googlegroups.com>

# VOIR AUSSI

La documentation complète et les exemples sont disponibles dans
**/usr/share/doc/rocket-sync-tracker/**.

# AUTEURS

Développé par l'équipe Rocket dev team.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
