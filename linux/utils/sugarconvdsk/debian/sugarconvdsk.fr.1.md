% sugarconvdsk(1) Manuel utilisateur SugarConvDsk 1.0.216
% Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2026-03-28

# NOM

sugarconvdsk - convertisseur de formats d'images disque Amstrad CPC

# SYNOPSIS

**sugarconvdsk** *source* [*destination*] [**-s=**_face_] [**-second=**_chemin_] [**-o=**_formatdesortie_] [**-r**] [**-f=**_filtre_]

**sugarconvdsk** **-cat=**_utilisateur_ [**-sort**] [**-l**] [**-c**] *source*

# DESCRIPTION

**SugarConvDsk** convertit des images de disquettes Amstrad CPC entre différents
formats. Il prend en charge de nombreux formats d'entrée et de sortie : DSK,
EDSK, HFE, IPF, SCP, CT-RAW et Kryoflux.

Lorsque l'option **-cat** n'est pas utilisée, **sugarconvdsk** effectue une
conversion de format. Lorsque **-cat** est utilisé, il affiche le répertoire
de la disquette sans effectuer de conversion ; dans ce cas, *destination* et
tous les paramètres de conversion sont ignorés.

En interne, l'outil convertit tout format supporté en une représentation MFM
qui gère les bits faibles, les bits optionnels et les pistes multi-révolutions,
puis écrit le résultat dans le format de sortie choisi.

# OPTIONS

## Mode conversion

**-s=**_face_
:   Sélectionne la face de la disquette à convertir. *face* doit être **1** ou
    **2**. Si omis, les deux faces sont écrites (selon la pertinence du format
    choisi).

**-second=**_chemin_
:   Remplace la seconde face de la disquette par l'image source spécifiée par
    *chemin*.

**-o=**_formatdesortie_
:   Sélectionne le format de sortie. Valeurs acceptées :

    **EDSK** — Format Extended DSK (par défaut),
    **HFE**  — Format HFE,
    **IPF**  — Format de préservation interchangeable (IPF),
    **SCP**  — Format Supercard Pro.

    Si omis, le format de sortie par défaut est EDSK.

**-r**
:   Si *source* est un répertoire, convertit les fichiers récursivement.

**-f=**_filtre_
:   Si *source* est un répertoire, applique un filtre sur les noms de fichiers
    (par exemple **[CPC]*.dsk**).

## Mode catalogue

**-cat=**_utilisateur_
:   Affiche le répertoire de la disquette pour le numéro d'*utilisateur* CP/M
    donné (0–15). Utilisez **ALLUSERS** pour afficher les entrées de tous les
    utilisateurs. Cette option empêche toute conversion.

**-sort**
:   Trie les fichiers listés par ordre alphabétique.

**-l**
:   Affiche un fichier par ligne. Ajoute l'indicateur **H** pour les fichiers
    cachés et **R** pour les fichiers en lecture seule.

**-c**
:   Affiche les fichiers sur une seule ligne, séparés par des points-virgules.

## Général

**--help**
:   Affiche un résumé d'utilisation et quitte.

# OPÉRANDES

*source*
:   Fichier image disque ou répertoire source. Formats d'entrée supportés :

    **CTRAW**    — Format CT-RAW,
    **DSK**      — Format DSK standard,
    **EDSK**     — Format Extended DSK,
    **HFE**      — Format HFE,
    **IPF**      — Format de préservation interchangeable,
    **SCP**      — Format Supercard Pro,
    **KRYOFLUX** — Ensemble de fichiers RAW Kryoflux.

    Si *source* est un répertoire, chaque fichier de ce répertoire est converti
    et enregistré dans le répertoire *destination*.

*destination*
:   Fichier ou répertoire de sortie. Si *source* est un répertoire,
    *destination* est utilisé comme répertoire de sortie.

# EXEMPLES

Convertir un fichier unique au format IPF :

    sugarconvdsk disk.dsk output.ipf -o=IPF

Convertir récursivement tous les fichiers **[CPC]*.dsk** depuis **/dump** vers
le format IPF, en enregistrant les résultats dans **/result** :

    sugarconvdsk /dump /result -o=IPF -r -f=[CPC]*.dsk

Afficher le répertoire d'une image disque pour l'utilisateur CP/M 0 :

    sugarconvdsk -cat=0 disk.dsk

Afficher les fichiers de tous les utilisateurs, triés alphabétiquement, un par
ligne :

    sugarconvdsk -cat=ALLUSERS -sort -l disk.dsk

# BOGUES

Aucun bogue connu. Veuillez signaler les problèmes à
<https://github.com/Tom1975/SugarConvDsk/issues>.

# AUTEURS

Tom1975.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>.
