## Objectifs

* améliorer les sources pour la mise à niveau vers Ubuntu 26.04
** vérifier la portabilité 64 bits dans un patch séparé
** préparer a GCC 15 par default dans un patch séparé
** s'assurer d'une compilation vers les architectures amd64, i386, armhf, arm64 et riscv64
** si CMakeLists.txt, une version inférieure à 3.5 n'est plus accepté

* toujours changer les sources via un patch quilt

## Patches Debian (quilt)

- Toujours créer/modifier les patches via quilt (`quilt new`, `quilt add`, `quilt refresh -p ab --no-timestamps`, `quilt header -a --dep3`). 
- Ne jamais éditer les fichiers `.patch` directement ni avec l'outil Edit
- a la fin, toujours revenir au source non patché via quilt pop -a.
- les descriptifs des patches doivent être en anglais

## Compilation

- elle se fait via `debuild -sa`

