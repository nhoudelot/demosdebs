% KRYOFLUXUI(1) KryoFlux 3.50 | Commandes utilisateur

# NOM

kryofluxui - Interface graphique KryoFlux

# SYNOPSIS

**kryofluxui** [*OPTIONS*]

# DESCRIPTION

**kryofluxui** lance l'interface graphique de KryoFlux, une application Java
multiplateforme constituant la face visuelle de **dtc**(1), la console
d'outils disque KryoFlux.

L'interface graphique couvre les opérations KryoFlux les plus courantes et
est recommandée pour les utilisateurs qui ne sont pas à l'aise avec la ligne
de commande. Toute action effectuée via l'interface est traduite en appels
**dtc** ; chaque fonctionnalité disponible dans l'interface est donc aussi
accessible directement via **dtc**.

La fenêtre principale est organisée en trois zones :

- **Grille de pistes** (en haut à gauche) : 84 blocs représentant les
  positions de piste sur la surface du disque. Le code couleur indique le
  résultat de chaque piste copiée : vert = décodée sans erreur, gris = bruit
  ou encodage inconnu, rouge = erreurs détectées (nouvelle tentative),
  jaune = avertissements ou données d'en-tête supplémentaires, lumineux =
  piste en cours de traitement.

- **Informations de piste** (en haut à droite) : détails de la piste
  sélectionnée, avec les onglets **Histogramme** et **Dispersion**
  (disponibles uniquement pour le format STREAM). Dans la vue de dispersion,
  les touches **F1**–**F5** sélectionnent une révolution, **a** anime les
  révolutions, **r**/**Maj-r** ajuste le RPM d'affichage de ±5, et **i**
  bascule l'affichage des informations superposées.

- **Section de contrôle** (en bas) : affiche la piste courante, les
  commandes du lecteur, le nom de fichier de sortie, le sélecteur de format
  et la ligne d'état.

## Profils

Le sélecteur de format s'appuie sur des *profils*. Un profil est un ensemble
nommé de paramètres **dtc** décrivant la façon dont un disque doit être
copié. Les profils peuvent être clonés et personnalisés. Plusieurs profils
peuvent être actifs simultanément en choisissant **\<multiple\>** dans le
sélecteur de format, permettant par exemple de combiner des fichiers STREAM
avec une image ADF AmigaDOS décodée en un seul passage.

## Prérequis

**kryofluxui** nécessite Java 8 (OpenJDK 8 ou version ultérieure, ou Eclipse
Temurin). Le paquet **dtc** doit également être installé et le matériel
KryoFlux configuré au préalable (voir **dtc**(1) et le manuel complet dans
`/usr/share/doc/dtc-doc/`).

# OPTIONS

Toutes les options sont transmises directement à la machine virtuelle Java
ou à **dtc**. Consultez le manuel KryoFlux pour la configuration des profils
de l'interface graphique.

# FICHIERS

`/usr/share/kryoflux/kryoflux-ui.jar`
:   Archive Java de l'interface graphique KryoFlux.

`/usr/share/applications/kryofluxui.desktop`
:   Entrée bureau pour l'intégration dans le menu des applications.

`/usr/share/icons/hicolor/128x128/apps/kryofluxui.png`
:   Icône de l'application.

# VOIR AUSSI

**dtc**(1)

Documentation complète : `/usr/share/doc/dtc-doc/`

# AUTEURS

Interface graphique KryoFlux par Kieron Wilkinson.
Logiciel et micrologiciel KryoFlux par István Fábián.
Portage Linux par Adam Nielsen.

Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
