% DTC(1) KryoFlux 3.50 | Commandes utilisateur

# NOM

dtc - Console d'outils disque KryoFlux, outil d'acquisition et de conversion de disquettes

# SYNOPSIS

**dtc** [*OPTIONS*]

# DESCRIPTION

**dtc** (Disk Tool Console) est le composant en ligne de commande de la suite
logicielle KryoFlux. Il contrôle la carte USB KryoFlux et permet de lire,
convertir, stocker et écrire le contenu de formats de disquettes historiques.

KryoFlux remplace un contrôleur de disquettes standard et capture le flux
magnétique brut de la surface du disque, indépendamment du schéma d'encodage
utilisé. Les supports pris en charge incluent les disquettes 3", 3,5", 5,25"
et 8" de nombreuses plateformes : Acorn Electron, Apple, Amstrad CPC,
Archimedes, Atari 8-bit, Atari ST, BBC Micro, Commodore 64, Commodore
Amiga, MSX, IBM PC, PC-8801, Sam Coupé, ZX Spectrum, E-MU Emulator II, et
bien d'autres.

**dtc** peut fonctionner dans deux modes :

- **Mode matériel** (par défaut) : utilise une carte KryoFlux connectée en
  USB pour lire ou écrire sur un lecteur de disquettes physique.
- **Mode fichier image** (**-m1**) : opère sur des fichiers STREAM KryoFlux
  capturés précédemment, sans matériel (mode sans périphérique). Toutes les
  fonctions de conversion et d'analyse restent disponibles.

Une fonctionnalité clé de **dtc** est sa capacité à produire plusieurs formats
de sortie simultanément en un seul passage. Un fichier STREAM brut peut être
capturé en même temps qu'un format guide décodé secteur par secteur (p. ex.
AmigaDOS ADF) : si le format guide signale une erreur de décodage, **dtc**
relance automatiquement la lecture de la piste, garantissant à la fois des
données brutes vérifiées et une image décodée en une seule opération.

# OPTIONS

## Options de nom de fichier et d'image

**-f**_nom_
:   Définir le nom de fichier de sortie (sans extension). Les caractères
    génériques sont acceptés : `##` se substitue au numéro de piste sur deux
    chiffres, `#` sur un seul chiffre.

**-i**_type_
:   Définir le type d'image. Peut être répété pour produire plusieurs formats
    en un seul passage. Voir **TYPES D'IMAGE** ci-dessous. Les options
    locales à l'image doivent apparaître **avant** chaque **-i** concerné.

**-m**_id_
:   Définir le mode de fonctionnement. **1** = fichier image (sans matériel),
    **2** = matériel KryoFlux (défaut).

## Options du lecteur et du matériel

**-d**_id_
:   Sélectionner le lecteur de disquette (défaut : 0).

**-dd**_val_
:   Définir la ligne de densité du lecteur. **0** = basse densité (défaut),
    **1** = haute densité.

**-a**_piste_
:   Définir la position physique de la piste 0 côté 0/A (défaut : 0).

**-b**_piste_
:   Définir la position physique de la piste 0 côté 1/B (défaut : 0).

## Sélection des pistes

**-s**_piste_
:   Définir la piste de début (défaut : 0). Locale à l'image.

**-e**_piste_
:   Définir la piste de fin (défaut : 83). Locale à l'image.

**-g**_côté_
:   Mode simple face. **0** = côté 0, **1** = côté 1, **2** = les deux
    (défaut).

**-k**_pas_
:   Densité de pistes. **1** = 80 pistes / pas 1 (défaut),
    **2** = 40 pistes / pas 2.

**-ks**
:   N'utiliser que les pistes explicitement sélectionnées lors de l'analyse
    (défaut : automatique).

## Options d'échantillonnage

**-r**_rev_
:   Nombre de révolutions à échantillonner par piste (défaut : selon le type
    d'image).

**-t**_essais_
:   Nombre maximal de tentatives par piste, minimum 1 (défaut : 5).

**-tc**_cycles_
:   Nombre de cycles de tentatives par piste, minimum 1 (défaut : 2).

**-tm**_val_
:   Traiter les secteurs manquants comme mauvais. **0** = désactivé,
    **1** = activé (défaut).

**-l**_masque_
:   Masque binaire du niveau de verbosité (défaut : 62). Additionner les
    valeurs : 1 = périphérique, 2 = lecture, 4 = cellule, 8 = format,
    16 = écriture, 32 = vérification, 64 = TI.

**-v**_rpm_
:   Vitesse de rotation du lecteur cible en tours/min (défaut : selon le
    type d'image). Locale à l'image.

**-x**_mode_
:   Recherche étendue de bande de cellule (défaut : selon le type d'image).
    Locale à l'image. **0** = image uniquement, **1** = tout, **2** = référence
    uniquement.

**-y**
:   Mode disquette « flippy » : inverse le flux binaire sur la face
    retournée. Aussi utilisé comme **-wy** lors d'une écriture.

## Options de format de secteur

**-z**_taille_
:   Taille de secteur. **0** = 128 o, **1** = 256 o, **2** = 512 o (défaut),
    **3** = 1024 o. Locale à l'image.

**-n**_nbre_
:   Nombre de secteurs. **0** = quelconque (défaut), **+Z** = exactement Z,
    **-Z** = au plus |Z|. Locale à l'image.

## Options de l'image de sortie

**-oo**_ordre_
:   Masque binaire de l'ordre des pistes dans l'image de sortie (défaut :
    selon le type d'image). Locale à l'image. 1 = côté 0 descendant,
    2 = côté 1 descendant, 4 = côté 1 en premier, 8 = orienté par côté.

**-os**_piste_
:   Piste de début dans l'image de sortie (défaut : selon le type d'image).
    Locale à l'image.

**-oe**_piste_
:   Piste de fin dans l'image de sortie (défaut : selon le type d'image).
    Locale à l'image.

**-ot**_pct_
:   Seuil de bande de données en pourcentage (défaut : 30). Locale à l'image.

**-p**
:   Activer le solveur de chemin (Path Solver) à partir de ce point dans la
    ligne de commande.

## Étalonnage

**-c**_mode_
:   Mode d'étalonnage. **1** = lecture de piste, **2** = piste maximale,
    **3** = étalonnage RPM.

## Options d'écriture

**-w**
:   Écrire les données d'image sur un disque physique.

**-wi**_type_
:   Type de l'image source pour l'écriture (défaut : 0 = détection
    automatique).

**-wp**_par_
:   Paramètre d'écriture spécifique à la plateforme (défaut : 0).

**-wm**_mode_
:   Masque binaire du mode d'écriture (défaut : 0).

**-wv**_mode_
:   Vérification après écriture. **0** = désactivée, **1** = activée (défaut).

**-we**_mode_
:   Mode d'effacement (défaut : selon le biais). **0** = normal,
    **1** = secteurs utilisés uniquement, **2** = effacement complet.

**-wb**_biais_
:   Biais d'écriture (défaut : selon l'image). **0** = neutre,
    **1** = biais vers l'extérieur, **2** = biais vers l'intérieur.

**-wg**_côté_
:   Filtre de face non formatée (défaut : 3 = les deux faces).

**-wk**_côté_
:   Filtre de diaphonie entre pistes (défaut : 3 = les deux faces).

**-ww**_ns_
:   Fenêtre de précompensation d'écriture en nanosecondes, max 10000
    (défaut : automatique).

**-wt**_ns_
:   Temps de précompensation d'écriture en nanosecondes, max 1000
    (défaut : automatique).

**-wo**_mode_
:   Sauvegarder le flux de sortie en fichier lors de l'écriture.
    **0** = désactivé (défaut), **1** = activé.

## Options des graphiques

**-pg**_type_
:   Type de graphique (défaut : 0). **0** = aucun, **1** = échantillon,
    **2** = cohérence, **3** = carte de chemin (path map).

**-pf**_mode_
:   Mode de retournement des graphiques (défaut : 0). **0** = désactivé,
    **1** = côté 1, **2** = les deux faces.

**-pw**_taille_
:   Largeur du graphique en pixels (défaut : 800).

**-ph**_taille_
:   Hauteur du graphique en pixels (défaut : 600).

**-px**_val_
:   Origine X du graphique (défaut : 0.0).

**-py**_val_
:   Origine Y du graphique (défaut : 0.0).

**-pd**_val_
:   Domaine du graphique (défaut : piste entière selon le RPM).

**-pr**_val_
:   Plage du graphique (défaut : 0,000020).

**-pv**_rpm_
:   Vitesse du lecteur cible pour le rendu des graphiques en tr/min
    (défaut : 300).

## Support EDOS

**-ec**
:   Ajouter un nom de fichier catalogue/base de données pour la récupération
    de la clé de chiffrement EDOS.

**-ep**
:   Ajouter un chemin vers un fichier image EDOS.

**-ek**
:   Définir le nom du fichier de sortie pour la clé EDOS
    (défaut : `edos_key.txt`).

**-er**_nbre_
:   Récupérer les clés de chiffrement EDOS (défaut : première clé uniquement ;
    **-1** = toutes).

**-ed**
:   Déchiffrer les en-têtes d'images EDOS vers un fichier TXT.

**-edc**
:   Déchiffrer les en-têtes d'images EDOS vers un fichier CSV.

# TYPES D'IMAGE

## Types pris en charge pour la lecture depuis un disque

| Type | Description |
|------|-------------|
| 0    | Fichiers STREAM KryoFlux, préservation |
| 0a   | Fichiers STREAM KryoFlux, guidé par format |
| 2    | Image CT Raw, 84 pistes, DS, DD, 300 tr/min, MFM |
| 3    | Image secteur FM, 40/80+ pistes, SS/DS, SD/DD, 300 tr/min, FM |
| 3a   | FM XFD (Atari 8-bit) |
| 4    | Image secteur MFM, 40/80+ pistes, SS/DS, DD/HD, 300 tr/min, MFM |
| 4a   | MFM XFD (Atari 8-bit) |
| 5    | Image secteur AmigaDOS, 80+ pistes, DS, DD/HD, 300 tr/min, MFM |
| 6    | Image secteur CBM DOS, 35+ pistes, SS, DD, 300 tr/min, GCR |
| 6a   | Image secteur CBM DOS avec carte d'erreurs |
| 7    | Image secteur Apple DOS 3.2, 35+ pistes, SS, DD, 300 tr/min, GCR |
| 8    | Image secteur Apple DOS 3.3+, 35+ pistes, SS, DD, 300 tr/min, GCR |
| 8a   | DSK, interleave DOS 3.3 |
| 9    | Image secteur Apple DOS 400K/800K, 80+ pistes, SS/DS, DD, CLV, GCR |
| 10   | Image secteur Emu, 35+ pistes, SS, DD, 300 tr/min, FM |
| 11   | Image secteur Emu II, 80+ pistes, DS, DD, 300 tr/min, FM |
| 12   | Image secteur Amiga DiskSpare, 80+ pistes, DS, DD/HD, 300 tr/min, MFM |
| 13   | Image secteur DEC RX01, 77+ pistes, SS, SD, 360 tr/min, FM |
| 14   | Image secteur DEC RX02, 77+ pistes, SS, SD/DD, 360 tr/min, FM/DMMFM |
| 15   | Image secteur CBM MicroProse, 35+ pistes, SS, DD, 300 tr/min, GCR |
| 16   | Image secteur CBM RapidLok, 35+ pistes, SS, DD, 300 tr/min, GCR |
| 17   | Image secteur CBM Datasoft, 35+ pistes, SS, DD, 300 tr/min, GCR |
| 18   | Image secteur CBM Vorpal, 35+ pistes, SS, DD, 300 tr/min, GCR |
| 19   | Image secteur CBM V-MAX!, 35+ pistes, SS, DD, 300 tr/min, GCR |
| 20   | Image secteur CBM Teque, 35+ pistes, SS, DD, 300 tr/min, GCR |
| 21   | Image secteur CBM TDP, 35+ pistes, SS, DD, 300 tr/min, GCR |
| 22   | Image GCR CBM, SS, DD, 300 tr/min, GCR |
| 22a  | Image GCR CBM avec informations de masterisation, SS, DD, 300 tr/min, GCR |
| 23   | Image secteur CBM Big Five, 35+ pistes, SS, DD, 300 tr/min, GCR |
| 24   | Image secteur CBM DOS étendu, 35+ pistes, SS, DD, 300 tr/min, GCR |
| 25   | Image secteur CBM OziSoft, 35+ pistes, SS, DD, 300 tr/min, GCR |

## Types pris en charge pour l'écriture sur un disque

| Type | Description |
|------|-------------|
| 0    | Détection automatique depuis le fichier |
| 1    | Image IPF |
| 2    | Image secteur Amiga ADF |
| 3    | Image CBM G64 |
| 4    | Fichiers STREAM KryoFlux |

# ORDRE DES PARAMÈTRES

Certaines options sont **locales à l'image** et doivent apparaître **avant**
l'option **-i** à laquelle elles s'appliquent ; elles sont réinitialisées
automatiquement après chaque traitement d'un **-i** :

> **-f**, **-y**, **-s**, **-e**, **-os**, **-oe**, **-oo**, **-g**,
> **-z**, **-n**, **-k**, **-v**, **-ot**, **-x**

Les options **globales** s'appliquent à toutes les images, quelle que soit
leur position dans la ligne de commande :

> **-m**, **-l**, **-r**, **-t**, **-a**/**-b**, **-p**, **-c**

**Correct :**

    dtc -fnom_fichier.ext -v360 -z3 -i4

**Incorrect** (les options locales après -i sont ignorées) :

    dtc -fnom_fichier.ext -i4 -v360 -z3

# EXEMPLES

Étalonnage du lecteur (détection de la piste maximale) :

    dtc -c2

Capturer une disquette Amiga en fichiers STREAM avec vérification AmigaDOS :

    dtc -f/tmp/amiga/track -i0 -i5

Capturer une disquette Commodore 64 vers une image G64 avec informations de
masterisation :

    dtc -f/tmp/c64/track -i22a

Capturer une disquette IBM PC 3,5" HD vers une image secteur MFM :

    dtc -f/tmp/pc/disk -i4

Convertir des fichiers STREAM en ADF AmigaDOS sans matériel (mode sans
périphérique) :

    dtc -m1 -f/tmp/amiga/track -famiga.adf -i5

Écrire une image ADF sur une disquette Amiga physique :

    dtc -f/tmp/amiga.adf -wi2 -w

Générer un graphique de cohérence à partir de fichiers STREAM :

    dtc -m1 -f/tmp/amiga/track -pg2 -i0

Capturer une disquette 5,25 pouces 40 pistes DD (360 tr/min) :

    dtc -f/tmp/disk/track -v360 -k2 -i4

# FICHIERS

`/usr/share/dtc/firmware_kf_usb_rosalie.bin`
:   Image du micrologiciel KryoFlux, chargée sur la carte au démarrage de
    chaque session.

`/usr/lib/udev/rules.d/80-kryoflux.rules`
:   Règles udev accordant l'accès non-root au périphérique USB KryoFlux.

# VOIR AUSSI

**kryofluxui**(1)

Documentation complète : `/usr/share/doc/dtc-doc/`

# AUTEURS

Logiciel et micrologiciel KryoFlux par István Fábián.
Portage Linux par Adam Nielsen.
Interface graphique par Kieron Wilkinson.
Documentation additionnelle par Christian Bartsch.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
