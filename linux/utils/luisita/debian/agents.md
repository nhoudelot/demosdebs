## Objectifs

- améliorer les sources pour la mise à niveau vers Ubuntu 26.04.
- vérifier la portabilité 64 bits dans un patch séparé.
- préparer a GCC 15 par default dans un patch séparé.
- s'assurer d'une compilation vers les architectures amd64, i386, armhf, arm64 et riscv64.
- si CMakeLists.txt, une version inférieure à 3.5 n'est plus accepté.
- applique les spécifications XDG Base Directory si nécessaire.
- toujours changer les sources via un patch quilt

# Dossier debian/

- Manuels
   - mettre à jour les manuels markdown du repertoire debian/ au standard Debian, et verifier qu'il est complété
   - faire une version française de ces manuel en markdown uniquement, extension .fr.1 ou .fr.6
   - ne pas les convertir
   - me mettre en temps qu'auteur sous la forme : Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
- debian/control : Style conforme au Guide des développeurs Debian (synopsis court + corps développé)
- debian/upstream/metadata : créer fichier au format DEP-12

## Patches Debian (quilt)

- Toujours créer/modifier les patches via quilt (`quilt new`, `quilt add`, `quilt refresh -p ab --no-timestamps`, `quilt header -a --dep3`). 
- Ne jamais éditer les fichiers `.patch` directement ni avec l'outil Edit.
- a la fin, toujours revenir au source non patché via  `quilt pop -a`.
- les descriptifs des patches doivent être en anglais.

## Compilation

- elle se fait via `debuild -sa`

