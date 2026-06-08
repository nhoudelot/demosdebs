% HERMES(1) hermes Manuels Utilisateur | Version 0.7.1
% Nicolas HOUDELOT <nicolas@demosdebs.org> ; Deuchnord
% Juin 2026

# NOM

hermes - gestionnaire graphique de garanties produits

# SYNOPSIS

**hermes**

# DESCRIPTION

**hermes** est une application graphique libre et open-source basée sur Qt5
permettant de gérer les garanties de vos produits. Elle vous permet de :

- ajouter des produits avec leur date d'achat et leur date de fin de garantie,
- joindre des factures et des certificats de garantie à chaque produit,
- marquer les produits actuellement en service après-vente (SAV),
- rechercher dans votre liste de produits,
- configurer l'emplacement de sauvegarde des données.

Les données sont stockées localement dans **~/deuchnord-hermes/**, à la fois
dans un format binaire historique (*.hrms*) et en fichiers JSON individuels
pour la compatibilité avec les versions futures.

Au démarrage, hermes vérifie si une nouvelle version amont est disponible et
en informe l'utilisateur dans la barre d'état.

# FICHIERS

*~/deuchnord-hermes/products.hrms*
:   Base de données principale des produits (format binaire historique, Qt5 QDataStream).

*~/deuchnord-hermes/json/\*.json*
:   Fichiers JSON par produit (format utilisé par les versions futures).

# BOGUES

Signalez les bogues sur <https://tickets.deuchnord.fr/index.php?project=2&do=index&switch=1>.

# VOIR AUSSI

Documentation en ligne : <https://doc.deuchnord.fr/hermes/start>

# AUTEURS

Écrit par Deuchnord. Empaqueté pour Debian/Ubuntu par Nicolas HOUDELOT
\<nicolas@demosdebs.org\>.
