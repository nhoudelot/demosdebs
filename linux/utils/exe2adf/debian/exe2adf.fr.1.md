% exe2adf(1) exe2adf "Manuel utilisateur"
% Nicolas HOUDELOT (nicolas@demosdebs.org); Bonefish/Reality
% 2019-12-21

# NOM
exe2adf - convertir des exécutables Amiga en images disque ADF

# SYNOPSIS
**exe2adf** **-i** *fichier.exe* [*options*]

# DESCRIPTION
**exe2adf** convertit des exécutables Amiga (**.exe**) en images disque
ADF (Amiga Disk File) amorçables, utilisables avec des émulateurs Amiga
ou du matériel réel.

Créé par Bonefish du groupe de démo Reality et publié en 2015, l'outil
place l'exécutable sur une image de disquette amorçable, avec prise en
charge optionnelle de l'affichage d'un texte au démarrage, d'étiquettes
de disque personnalisées, de l'inclusion de répertoires, de bootblocks
personnalisés et de la configuration de la palette.

# OPTIONS

## Obligatoires

**-i** *fichier*, **--input** *fichier*
:   Exécutable Amiga à convertir en ADF.

## Optionnelles

**-a** *fichier*, **--adf** *fichier*
:   Nom du fichier ADF de sortie.

**-t** *fichier*, **--txt** *fichier*
:   Fichier texte à afficher au démarrage.

**-l** *étiquette*, **--label** *étiquette*
:   Étiquette du disque ADF.

**-k**, **--add21k**
:   Libérer 21 Ko avant de charger le reste de la disquette.

**-c**, **--cls**
:   Effacer l'écran avant d'afficher le fichier texte.
    Utilisable uniquement avec **--txt**.

**-w**, **--wide**
:   Régler AmigaDOS/CLI à 80 colonnes au lieu des 60 colonnes par défaut.

**-p** *couleurs*, **--palette** *couleurs*
:   Définir la palette AmigaDOS/CLI. Accepte 3 ou 7 triplets hexadécimaux
    RVB séparés par des virgules :

    - couleur 1 : arrière-plan (obligatoire)
    - couleur 2 : premier plan (obligatoire)
    - couleur 3 : icône de réduction
    - couleur 4 : curseur
    - couleur 5 : couleur principale du pointeur
    - couleur 6 : ombre du pointeur
    - couleur 7 : reflet du pointeur

**-d** *répertoire*, **--directory** *répertoire*
:   Répertoire à inclure sur la disquette.

**-b** *fichier*, **--bootblock** *fichier*
:   Installer un bootblock personnalisé.

**-0**
:   Afficher la carte d'allocation des secteurs.

# EXEMPLES

Utilisation rapide :

    exe2adf -i intro.exe

Utilisation simple :

    exe2adf -i intro.exe -l madisquette -a disquette.adf
    exe2adf --input intro.exe --label madisquette --adf disquette.adf

Utilisation avancée :

    exe2adf -i intro.exe -l madisquette -t lisez-moi.txt -a disquette.adf -k -c

Utilisation avec palette (couleurs CLI uniquement) :

    exe2adf -i intro.exe -t lisez-moi.txt -a disquette.adf -p 000,fff,00f,f0f

Utilisation avec palette (couleurs CLI et pointeur) :

    exe2adf -i intro.exe -t lisez-moi.txt -a disquette.adf \
            -p 000,fff,00f,f0f,888,444,fff

# BOGUES
Aucun bogue connu.

# AUTEURS
Bonefish/Reality (auteur amont).
Paquet Debian par Nicolas HOUDELOT <nicolas@demosdebs.org>.
