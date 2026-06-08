% luisita(1) Commandes utilisateur | luisita
% Soledad Penades; Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-06-09

# NOM

luisita - environnement graphique OpenGL scriptable pour la création de démos temps réel

# SYNOPSIS

**luisita** **-s** *script* [*options*]

# DESCRIPTION

**luisita** est un environnement graphique scriptable inspiré de Processing, construit
sur Lua et C++. Il fournit une API simple et minimaliste pour écrire des
applications graphiques temps réel (démos) sans nécessiter une connaissance
approfondie d'OpenGL ni de gestion manuelle de la mémoire C++.

Une démo Luisita consiste en un script Lua qui appelle les fonctions intégrées
pour le rendu graphique, le chargement d'images, le contrôle de la caméra,
l'éclairage, le brouillard et la lecture audio.
Le script doit définir au minimum une fonction **setup()** et une fonction
**draw(ticks)**. **setup()** est appelée une fois au démarrage ; **draw()**
est appelée à chaque image avec le temps écoulé en millisecondes.

Luisita utilise **Lua** pour les scripts, **BASS** pour la lecture audio,
**OpenGL** (via GLEW) pour le rendu, et **SOIL** pour le chargement d'images.

# OPTIONS

**-s** *fichier*, **--script-name** *fichier*
: Nom du script Lua à exécuter. Cette option est obligatoire.

**-w** *pixels*, **--width** *pixels*
: Largeur de la fenêtre en pixels (défaut : 1024).

**-h** *pixels*, **--height** *pixels*
: Hauteur de la fenêtre en pixels (défaut : 768).

**--fullscreen**
: Exécuter en mode plein écran (défaut : fenêtré).

**--antialias**
: Activer l'anticrénelage multiéchantillon (défaut : désactivé).

**--antialias-samples** *N*
: Nombre d'échantillons pour l'anticrénelage multiéchantillon (défaut : 4).
  Sans effet si **--antialias** n'est pas également spécifié.

**-t** *secondes*, **--start-time** *secondes*
: Démarrer la lecture à *secondes* dans la chronologie (défaut : 0).
  Utile pour déboguer un moment précis d'une démo.

**-l**, **--list-modes**
: Lister les résolutions plein écran accélérées disponibles et quitter.

**-?**, **--help**
: Afficher un résumé d'utilisation et quitter.

# API LUA

Les fonctions globales suivantes sont disponibles dans les scripts Lua :

## Initialisation et contrôle

**setupIsDone**()
: Signale que la fonction **setup()** a terminé son initialisation.

**quit**()
: Demande la fermeture de l'application.

**windowTitle**(*titre*)
: Définit le titre de la fenêtre.

**width**(), **height**()
: Retourne la largeur ou la hauteur actuelle de la fenêtre en pixels.

**trace**(*message*)
: Affiche *message* sur la sortie standard (aide au débogage).

## Primitives 2D / 3D

**beginShape**([*type*]), **endShape**()
: Commence et termine une séquence de sommets. *type* peut être SHAPE_POINTS,
  SHAPE_LINES, SHAPE_LINE_STRIP, SHAPE_TRIANGLES, SHAPE_TRIANGLE_STRIP,
  SHAPE_QUADS, SHAPE_QUAD_STRIP ou SHAPE_POLYGON.

**vertex**(*x*, *y*[, *z*]), **normal**(*nx*, *ny*, *nz*)
: Ajoute un sommet ou une normale de surface à la forme courante.

**line**(*x1*, *y1*, *x2*, *y2*), **triangle**(*x1*, *y1*, *x2*, *y2*, *x3*, *y3*)
: Dessine directement une ligne ou un triangle.

**stipple**(), **noStipple**()
: Active ou désactive le pointillé de ligne.

## Couleur

**background**(*r*, *g*, *b*[, *a*])
: Définit la couleur de fond (effacement).

**fill**(*r*, *g*, *b*[, *a*]), **noFill**()
: Définit ou désactive la couleur de remplissage des formes.

**stroke**(*r*, *g*, *b*[, *a*]), **noStroke**()
: Définit ou désactive la couleur de contour des formes.

**color**(*r*, *g*, *b*[, *a*]), **colorMode**(*mode*)
: Définit la couleur de dessin courante ou le mode d'interprétation des couleurs.

**strokeWeight**(*e*), **pointSize**(*t*)
: Définit l'épaisseur du contour ou la taille des points en pixels.

## Images et textures

**loadImage**(*fichier*)
: Charge un fichier image et retourne un identifiant de texture.

**image**(*texId*, *x*, *y*, *l*, *h*)
: Affiche la texture *texId* en (*x*, *y*) avec la taille *l* × *h*.

**useTexture**(*texId*), **noTexture**()
: Active ou désactive une texture pour la géométrie suivante.

## Caméra et projection

**ortho**([*l*, *h*]), **restoreProjection**()
: Passe en projection orthographique (2D) ou restaure la projection précédente.

**camera**(*oeilX*, *oeilY*, *oeilZ*, *centreX*, *centreY*, *centreZ*, *hautX*, *hautY*, *hautZ*)
: Positionne la caméra 3D (équivalent à gluLookAt).

**perspective**(*fov*, *aspect*, *zProche*, *zLoin*)
: Définit une projection en perspective.

**depthTest**(), **noDepthTest**()
: Active ou désactive le test de profondeur OpenGL.

## Fusion (Blending)

**blending**(*mode*), **noBlending**()
: Active un mode de fusion ou désactive la fusion.
  *mode* peut être BLENDING_ALPHABLEND, BLENDING_ADDITIVE,
  BLENDING_SUBSTRACTIVE, BLENDING_MULTIPLY ou BLENDING_COLORMULTIPLY.

## Lumières

**lightEnabled**(*n*), **noLights**()
: Active la lumière OpenGL *n* ou désactive toutes les lumières.

**lightPosition**(*n*, *x*, *y*, *z*), **lightAmbient**(*n*, *r*, *g*, *b*, *a*)
: Définit la position ou la couleur ambiante de la lumière *n*.

**lightDiffuse**(*n*, *r*, *g*, *b*, *a*), **lightSpotDirection**(*n*, *x*, *y*, *z*)
: Définit la couleur diffuse ou la direction du spot de la lumière *n*.

## Brouillard

**fogMode**(*mode*), **fogDensity**(*d*), **fogStartEnd**(*début*, *fin*), **fogColor**(*r*, *g*, *b*, *a*)
: Configure le brouillard OpenGL. *mode* peut être FOG_NONE, FOG_LINEAR,
  FOG_EXP ou FOG_EXP2.

## Audio

**loadMusicStream**(*fichier*)
: Charge un fichier audio et retourne un identifiant de flux.

**playMusicStream**(*flux*)
: Lance la lecture du flux *flux*.

**isMusicStreamFinished**(*flux*)
: Retourne vrai quand la lecture du flux *flux* est terminée.

**getMusicStreamTime**(*flux*), **getMusicStartPosition**()
: Retourne la position de lecture courante en secondes, ou la valeur passée
  via **--start-time**.

# EXEMPLES

Exécuter le script hello-world fourni dans une fenêtre 1280 × 720 :

    luisita -s samples/001-hello.lua -w 1280 -h 720

Lancer une démo en plein écran avec anticrénelage à partir de la 30e seconde :

    luisita -s demo.lua --fullscreen --antialias -t 30

Lister les résolutions plein écran disponibles :

    luisita --list-modes

# BOGUES

Aucun bogue connu. Veuillez signaler les problèmes sur
<https://github.com/sole/luisita/issues>.

# AUTEURS

Luisita a été écrit par Soledad Penades <http://soledadpenades.com>.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>.

# VOIR AUSSI

**lua**(1), **glew**(3)
