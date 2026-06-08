## Objectifs

- améliorer les sources pour la mise à niveau vers Ubuntu 26.04.
- vérifier la portabilité 64 bits dans un patch séparé.
- préparer a GCC 15 par default dans un patch séparé.
- s'assurer d'une compilation vers les architectures amd64, i386, armhf, arm64 et riscv64.
- applique les spécifications XDG Base Directory si nécessaire.
- toujours changer les sources via un patch quilt

# Dossier debian/

- Manuels
   - mettre à jour le manuel markdown du repertoire debian/ au standard Debian, et verifier qu'il est complété
   - faire également une version française du manuel en markdown uniquement.
   - ne pas convertir le manuel, cela est fait par mon script
- creer le debian/upstream si il n'existe pas et le mettre à jour

## Patches Debian (quilt)

- Toujours créer/modifier les patches via quilt (`quilt new`, `quilt add`, `quilt refresh -p ab --no-timestamps`, `quilt header -a --dep3`). 
- Ne jamais éditer les fichiers `.patch` directement ni avec l'outil Edit.
- a la fin, toujours revenir au source non patché via  `quilt pop -a`.
- les descriptifs des patches doivent être en anglais.

## Compilation

- elle se fait via `debuild -sa`

