% IXALANCE(1) ixalance 1.0.6 | Commandes utilisateur
% Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% Juin 2026

# NOM

ixalance — chargeur de démos DOS32 pour Linux (système de démos The Black Lotus)

# SYNOPSIS

**ixalance** [*OPTIONS*] *demo.ixa*

# DESCRIPTION

**ixalance** est un chargeur de démos DOS32 en mode protégé pour Linux.
Il a été conçu à l'origine par Jurjen Katsman (The Black Lotus, TBL) puis
porté sous Linux et SDL par Jarno Paananen.

Il exécute les fichiers de démos TBL (archives **.ixa**) en émulant
l'environnement 32-bit en mode protégé qu'elles requièrent, tout en affichant
la vidéo via SDL2 et en restituant l'audio via libopenmpt et l'audio SDL2.

Le programme ouvre une fenêtre SDL2 redimensionnable à la résolution native
de chaque effet de la démo (généralement 320×200, 640×480 ou 800×600) et la
met à l'échelle pour remplir la fenêtre en conservant le ratio d'image d'origine.

# OPTIONS

**-m***x*
:   Définit la fréquence de mixage audio à *x* Hz (ex. : **-m44100**).

**-o***x*
:   Définit le mode de sortie audio.
    Valeurs valides : **8** (8 bits), **1** (16 bits), **s** (stéréo), **m** (mono).

**-f***x*
:   Définit le filtre d'interpolation.
    Valeurs valides : **0** (aucun), **1** (léger), **2** (fort).

**-i**
:   Active le suréchantillonnage (interpolation).

**-s***L***x***H*
:   Force la taille initiale de la fenêtre à *L*×*H* pixels (ex. : **-s800x600**).

**-d**
:   Écrit un journal de débogage dans **debug.txt** dans le répertoire courant.

**-t**
:   Affiche le nombre d'images par seconde sur la sortie standard.

**-F**
:   Démarre en mode plein écran.

# RACCOURCIS CLAVIER

**F**
:   Bascule entre le mode plein écran et le mode fenêtré à tout moment pendant
    la lecture. Le plein écran utilise **SDL_WINDOW_FULLSCREEN_DESKTOP** afin
    de conserver la résolution du bureau ; l'image de la démo est centrée et
    encadrée de bandes noires (letterbox) pour maintenir le ratio d'image correct.

**Échap**
:   Quitte le programme proprement.

# FICHIERS

*debug.txt*
:   Journal de débogage écrit dans le répertoire de travail courant lorsque
    l'option **-d** est utilisée.

# CODES DE RETOUR

**0**
:   Fin normale (démo terminée ou appui sur **Échap**).

**1**
:   Erreur (fichier de démo absent ou illisible, échec d'initialisation SDL, etc.).

# BOGUES

Le programme exécute uniquement les archives **.ixa** produites par le système
de démos The Black Lotus ; il ne s'agit pas d'un émulateur DOS généraliste.

Le code compilé depuis **code.asm** est du mode protégé i386 uniquement ; le
binaire doit être compilé en tant qu'exécutable ELF 32-bit (**-m32**).

# VOIR AUSSI

**sdl2-config**(1)

Page d'accueil iXalance/Linux (amont) : <http://www.s2.org/iXalance/>

Archive de démos TBL : <http://www.tbl.org/tbl32.htm>

# AUTEURS

Jurjen Katsman (The Black Lotus) — système de démos DOS32 original.

Jarno Paananen <jpaana@s2.org> — portage Linux/SDL.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>.
