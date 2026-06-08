% dolbybi(1) dolbybi 0.0+20180403 | Décodeur logiciel Dolby B
% Richard Evans; Nicolas HOUDELOT <nicolas@demosdebs.org>
% 2018-04-03

# NOM

dolbybi - Décodeur logiciel Dolby B pour fichiers audio de cassettes numérisés

# SYNOPSIS

**dolbybi** *\<fichier_entrée.wav\>* *\<fichier_sortie.wav\>* [*options*]

# DESCRIPTION

**dolbybi** est un programme en ligne de commande qui décode des fichiers audio
numérisés à partir de cassettes enregistrées avec la réduction de bruit Dolby B.
Il a été écrit par Richard Evans entre août 2014 et avril 2016 à titre
expérimental.

La réduction de bruit Dolby B est normalement intégrée dans les platines
cassettes, où le niveau audio entrant dans les circuits de décodage est
approximativement correct. Avec ce programme, l'audio doit déjà avoir été
extrait et numérisé, et des essais sont nécessaires pour trouver le bon niveau
(voir **AJUSTEMENT DU NIVEAU**).

Seuls les fichiers WAV de type 1 sont supportés en entrée et en sortie.

# OPTIONS

## Gain

**\/IG**:*n*
:   Gain appliqué au fichier d'entrée en dB (défaut : 0,0).

**\/OG**:*n*
:   Gain appliqué au fichier de sortie en dB (défaut : 0,0). N'affecte pas
    le décodage lui-même.

**\/TG**:*n*
:   Gain appliqué en interne pour modifier la tension de seuil de la réduction
    de bruit, en dB (défaut : 0,0). Il est généralement préférable d'ajuster
    ce paramètre plutôt que /IG, car il ne modifie pas le niveau de sortie.

## Format de sortie

**\/OB**:*n*
:   Forcer la profondeur de bits de sortie à 8, 16 ou 24 bits. Si non
    spécifié, la profondeur de bits de sortie correspond à celle du fichier
    d'entrée.

## Décodage partiel

**\/ST**:*n*
:   Début de la section à décoder, en secondes. Permet de sélectionner une
    portion du fichier pour accélérer le traitement et éviter le format RIFF 64.

**\/LN**:*n*
:   Longueur de la section à décoder, en secondes. Note : les premiers instants
    de la section sélectionnée peuvent ne pas être correctement décodés, le
    temps que les circuits de contrôle de gain se stabilisent.

## Précision et performance du décodage

**\/DA**:*n*
:   Précision du décodage, en dB (défaut : -5,0). Une valeur de 0,0 correspond
    à une précision d'environ 1 valeur d'échantillon. Des valeurs plus élevées
    décodent plus vite mais avec moins de précision ; des valeurs plus basses
    sont plus précises mais plus lentes.

**\/US**:*n*
:   Taux de suréchantillonnage (défaut : 0, automatique). Avec la valeur 0,
    le taux est choisi de façon que la fréquence d'échantillonnage supérieure
    soit d'au moins 200 kHz. Par exemple, avec une entrée à 44,1 kHz, /US
    prend par défaut la valeur 5 (5 × 44,1 = 220,5 kHz). Utilisez /US:1 pour
    désactiver le suréchantillonnage.

**\/IB**:*n*
:   Taille du tampon d'entrée en Mo (défaut : 0, illimité). Par défaut, le
    programme charge l'intégralité du fichier WAV en mémoire avant le
    traitement. Utilisez cette option pour limiter la taille du tampon si la
    mémoire disponible est insuffisante.

**\/FM**:*n*
:   Mode de filtrage du chemin latéral (défaut : 4). Quatre modes sont
    disponibles : 1 est la méthode originale ; 2 est une méthode plus récente
    qui donne généralement de meilleurs résultats que 1 ; 3 est un autre
    arrangement similaire à 1 ; 4 donne les meilleurs résultats en pratique.

## Verbosité

**\/S**:*n*
:   Mode silencieux. Utilisez /S:1 pour réduire les messages affichés,
    /S:2 pour les minimiser.

## Format RIFF 64

**\/NO64**
:   Ne jamais utiliser le format RIFF 64. Si la sortie dépasse la limite de
    taille WAV standard, la fin du fichier est tronquée.

**\/USE64**
:   Toujours utiliser le format RIFF 64, quelle que soit la taille de la
    sortie.

Par défaut, le format RIFF 64 n'est utilisé que lorsque le fichier de sortie
dépasserait la limite WAV standard (environ 4 Go). Tous les lecteurs
multimédias ne supportent pas le format RIFF 64.

## Mode encodage

**\/ENC**
:   Exécuter un encodage Dolby B au lieu d'un décodage.

## Divers

**\/ALL-HIGH**
:   Suréchantillonner l'audio tout au long du programme, pas seulement lorsque
    nécessaire. Ralentit considérablement le traitement sans amélioration
    observée des résultats.

**\/RETRY**
:   Si le fichier d'entrée ne peut pas être ouvert, attendre environ une seconde
    et réessayer, au lieu de quitter avec une erreur.

**\/NOWARN**
:   Normalement, le programme marque une pause à la fin si des avertissements
    ont été émis. Cette option désactive cette pause.

**\/NR-Off**
:   Désactiver toute réduction de bruit. Principalement utile lors d'une
    calibration.

\--help
:   Afficher l'aide de la commande.

## Calibration

**\/CAL**
:   Exécuter un processus de calibration. La plupart des utilisateurs n'en
    ont pas besoin, car les valeurs de calibration par défaut sont déjà
    intégrées dans le programme. Si une recalibration est nécessaire (par
    exemple après la modification d'un fichier de paramètres), cette option
    automatise le processus. Les résultats peuvent être sauvegardés avec
    /PE:\<fichier\>. La calibration avec un fichier WAV d'entrée valide utilise
    la fréquence d'échantillonnage de ce fichier ; sans fichier valide, /CF:n
    définit la fréquence utilisée.

**\/CF**:*n*
:   Fréquence d'échantillonnage pour la calibration (défaut : 44100). Utilisé
    avec /CAL lorsqu'aucun fichier WAV d'entrée valide n'est fourni.

## Fichiers de paramètres

**\/PF**:*\<fichier\>*
:   Lire les paramètres du programme depuis le fichier spécifié. Destiné aux
    utilisateurs avancés souhaitant expérimenter avec les paramètres internes.

**\/PE**:*\<fichier\>*
:   Créer un exemple de fichier de paramètres basé sur les réglages actuels.
    Les options à leur valeur par défaut sont incluses mais commentées entre
    accolades. Le fichier peut ensuite être modifié et relu avec /PF.

# AJUSTEMENT DU NIVEAU

La réduction de bruit Dolby B est normalement appliquée à l'intérieur d'une
platine cassette où le niveau audio est approximativement correct. Avec ce
programme, l'audio doit déjà avoir été extrait et numérisé, et aucune
détection automatique du niveau n'est possible.

L'approche recommandée est de décoder le même extrait à plusieurs valeurs de
seuil, de comparer les résultats, puis d'affiner la recherche :

```
dolbybi Test.wav Out00.wav /tg:0.0
dolbybi Test.wav Out05.wav /tg:5.0
dolbybi Test.wav Out10.wav /tg:10.0
dolbybi Test.wav Out15.wav /tg:15.0
dolbybi Test.wav Out20.wav /tg:20.0
```

Préférez ajuster **\/TG** (gain de seuil) plutôt que **\/IG** (gain d'entrée),
car /TG ne modifie pas le niveau de sortie, ce qui facilite les comparaisons.
En pratique, une différence de seuil d'environ 1 dB est audible.

Si la sortie semble étouffée, surtout sur les parties calmes et les
transitoires, le seuil est peut-être trop bas. Si le son est grésillant ou
présente trop d'aigus sur les parties calmes et les transitoires, le seuil est
peut-être trop élevé.

Les valeurs négatives de gain et de seuil sont acceptées mais rarement
nécessaires.

# MULTITHREADING

Le programme n'utilise pas le multithreading en interne, mais plusieurs
instances peuvent être lancées en parallèle (une par cœur CPU) pour traiter
différentes valeurs de seuil simultanément. Sous Linux :

```
dolbybi Test.wav Out00.wav /tg:0.0 &
dolbybi Test.wav Out05.wav /tg:5.0 &
dolbybi Test.wav Out10.wav /tg:10.0 &
wait
```

# FORMATS WAV SUPPORTÉS

Seul le WAV de type 1 est supporté (le type 2 multi-canaux n'est pas supporté).

- **Canaux** : 1 (mono) ou 2 (stéréo)
- **Profondeur de bits** : 8, 16 ou 24 bits (les autres profondeurs sont arrondies à la valeur supportée supérieure)
- **Fréquence d'échantillonnage** : 8000 à 4 000 000 Hz (tous les tests ont été effectués à 44100 Hz)
- **Encodage des échantillons** : PCM linéaire uniquement

Les fichiers WAV en virgule flottante et à grande profondeur de bits ne sont
pas supportés. Les fichiers de sortie sont au même format que l'entrée, sauf
modification par les options **\/OB**, **\/ST** ou **\/LN**.

# SAISIE DES PARAMÈTRES

Les paramètres de ligne de commande sont insensibles à la casse : **/IG:1.1**
et **/Ig:1.1** sont équivalents. Les valeurs réelles peuvent être saisies avec
un point décimal ou comme entiers. Les valeurs négatives sont préfixées par un
signe moins, par exemple **/OG:-1.1**.

# BOGUES

Aucun bogue connu.

# VOIR AUSSI

**sox**(1), **ffmpeg**(1)

# AUTEURS

Richard Evans (programme original).

Nicolas HOUDELOT \<nicolas@demosdebs.org\> (empaquetage Debian).
