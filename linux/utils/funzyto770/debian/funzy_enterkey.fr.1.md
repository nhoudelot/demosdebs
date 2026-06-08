% funzy_enterkey(1) | Manuels utilisateur funzyto770
% Nicolas HOUDELOT <nicolas@demosdebs.org> ; Sylvain Huet
% 2026-06-09

# NOM

funzy_enterkey - définir interactivement la configuration clavier de funzyto770

# SYNOPSIS

**funzy_enterkey**

# DESCRIPTION

**funzy_enterkey** est un utilitaire X11 interactif qui crée le fichier de
configuration clavier **keyto7** requis par **funzyto770**(1). Il invite
l'utilisateur à appuyer sur chacune des 68 touches une par une : 58 touches
du clavier TO7 et 10 directions et boutons de manettes de jeu (5 par
manette).

Le programme ouvre une fenêtre X11 vide. L'utilisateur doit maintenir le
pointeur de la souris à l'intérieur de cette fenêtre pendant toute la
procédure. Les instructions pour chaque touche sont affichées dans le
terminal.

Le fichier **keyto7** résultant est écrit dans le répertoire de travail
courant et doit être présent dans ce répertoire au lancement de
**funzyto770**(1) (sauf si un autre fichier est spécifié avec l'option
**-k**).

Ce programme ne doit être exécuté qu'une seule fois, ou à nouveau si la
correspondance des touches doit être redéfinie.

# OPTIONS

Ce programme n'accepte aucune option.

# FICHIERS

*keyto7*
:   Fichier de configuration clavier produit, écrit dans le répertoire
    courant. Contient 68 codes de touches X11, un par ligne.

# EXEMPLES

Définir la configuration clavier avant de lancer l'émulateur pour la
première fois :

    funzy_enterkey

Suivre les instructions dans le terminal en appuyant sur la touche physique
correspondant à chaque nom de touche TO7 affiché. Une fois les 68 touches
saisies, le fichier **keyto7** est créé automatiquement.

Puis lancer l'émulateur :

    funzyto770

# VOIR AUSSI

**funzyto770**(1)

# BOGUES

Aucun bogue connu.

# AUTEURS

Écrit par Sylvain Huet en 1994. Empaquetage Debian par Nicolas HOUDELOT
<nicolas@demosdebs.org>.
