# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Projet

`amigadepacker` est un outil C en ligne de commande qui décompresse des formats compressés Amiga : PowerPacker (PP20/PX20), XPK SQSH, MMCMP et StoneCracker 4.04 (S404). Il est packagé pour Debian/Ubuntu par Nicolas HOUDELOT (demosdebs).

## Architecture du code source

`main.c` gère le CLI (options `-c`, `-o`, `-p`, `-v`) et appelle `decrunch()` pour chaque fichier. `decrunch.c` est le dispatcher central : il lit les 16 premiers octets du fichier, identifie le format via `check_header()`, charge le fichier entier en mémoire, puis délègue à l'un des quatre décompresseurs :

- `ppdepack.c` — PowerPacker PP20/PX20
- `unsqsh.c` — XPK SQSH
- `mmcmp.c` — MMCMP (`ziRCONia`)
- `s404_dec.c` — StoneCracker 4.04

Chaque décompresseur expose un `struct decruncher` avec un pointeur de fonction `.decrunch(buf, nbytes, out)`. La décompression en place passe par un fichier temporaire `mkstemp` puis `rename`.

`compat.c` isole les workarounds portabilité (MinGW `RENAME_WORKAROUND`, absence de `mkstemp`). `config.h` est généré par `configure`.

## Objectifs

* améliorer les sources pour la mise à niveau vers Ubuntu 26.04.
** vérifier la portabilité 64 bits dans un patch séparé.
** préparer a GCC 15 par default dans un patch séparé.
** s'assurer d'une compilation vers les architectures amd64, i386, armhf, arm64 et riscv64.
** si CMakeLists.txt, une version inférieure à 3.5 n'est plus accepté.
* applique les spécifications XDG Base Directory si nécessaire.

* toujours changer les sources via un patch quilt

# Manuels

- mettre a jour le manuel markdown du repertoire debian/ au standard Debian, et verifier qu'il est complété
- faire également une version française du manuel en markdown uniquement.
- ne pas convertir le manuel, cela est fait par mon script

## Patches Debian (quilt)

- Toujours créer/modifier les patches via quilt (`quilt new`, `quilt add`, `quilt refresh -p ab --no-timestamps`, `quilt header -a --dep3`). 
- Ne jamais éditer les fichiers `.patch` directement ni avec l'outil Edit.
- a la fin, toujours revenir au source non patché via quilt pop -a.
- les descriptifs des patches doivent être en anglais.

## Compilation

- elle se fait via `debuild -sa`
