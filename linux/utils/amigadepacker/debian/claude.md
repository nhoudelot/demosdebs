# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Projet

`amigadepacker` est un outil C en ligne de commande qui décompresse des formats compressés Amiga : PowerPacker (PP20/PX20), XPK SQSH, MMCMP et StoneCracker 4.04 (S404). Il est packagé pour Debian/Ubuntu par Nicolas HOUDELOT (demosdebs).

## Commandes de build et test

```sh
# Configurer (génère Makefile et version.h depuis Makefile.in)
./configure [--prefix=/usr]

# Compiler
make

# Lancer les tests (depuis la racine)
make check
# ou directement :
cd tests && ./check.sh

# Installer (avec DESTDIR pour le packaging)
make install DESTDIR=/tmp/staging
```

## Build Debian

```sh
# Build du paquet complet
dpkg-buildpackage -us -uc

# Build propre avec sbuild ou pbuilder
debuild -us -uc

# Appliquer/retirer les patches quilt
quilt push -a
quilt pop -a
```

## Architecture du code source

`main.c` gère le CLI (options `-c`, `-o`, `-p`, `-v`) et appelle `decrunch()` pour chaque fichier. `decrunch.c` est le dispatcher central : il lit les 16 premiers octets du fichier, identifie le format via `check_header()`, charge le fichier entier en mémoire, puis délègue à l'un des quatre décompresseurs :

- `ppdepack.c` — PowerPacker PP20/PX20
- `unsqsh.c` — XPK SQSH
- `mmcmp.c` — MMCMP (`ziRCONia`)
- `s404_dec.c` — StoneCracker 4.04

Chaque décompresseur expose un `struct decruncher` avec un pointeur de fonction `.decrunch(buf, nbytes, out)`. La décompression en place passe par un fichier temporaire `mkstemp` puis `rename`.

`compat.c` isole les workarounds portabilité (MinGW `RENAME_WORKAROUND`, absence de `mkstemp`). `config.h` est généré par `configure`.

## Packaging Debian (debian/)

- **Format** : `3.0 (quilt)` — les patches sont dans `debian/patches/`
- **Compat** : debhelper 13
- **Patch unique** : `01_adapt_makefile.patch` — réécrit `Makefile.in` pour supporter `DESTDIR`, les variables d'installation standard et `CFLAGS`/`LDFLAGS` additifs ; ajoute aussi le shebang et le `rm depack.tmp` dans `tests/check.sh`
- **`debian/rules`** : active `hardening=+all` ; active LTO (`-flto`) sur toutes les architectures sauf `m68k-linux-gnu` ; force `CC=$(DEB_HOST_GNU_TYPE)-gcc` pour la cross-compilation
- Le `configure` du projet ne suit pas GNU Autoconf standard — `dh` l'appelle via `dh_auto_configure` mais le script est custom (pas de `config.sub`/`config.guess`)

## Points d'attention

- `Makefile.in` est la source ; `Makefile` est généré par `configure` et ne doit pas être commité.
- `version.h` et `config.h` sont également générés — ne pas les commiter.
- Les tests vérifient les md5sum de fichiers dépaquetés : tout changement dans les décompresseurs doit être validé par `make check`.
- La branche git courante est `demosdebs` ; `master` est la branche principale pour les PRs.

## Objectifs

* améliorer les sources pour la mise à niveau vers Ubuntu 26.04
** vérifier la portabilité 64 bits dans un patch séparé
** préparer a GCC 15 par default dans un patch séparé
** s'assurer d'une compilation vers les architectures amd64, i386, armhf, arm64 et riscv64

## Patches Debian (quilt)

Toujours créer/modifier les patches via quilt (`quilt new`, `quilt add`, `quilt refresh -p ab --no-timestamps`, `quilt header -a --dep3`). Ne jamais éditer les fichiers `.patch` directement ni avec l'outil Edit
a la fin, toujours revenir au source non patché via quilt pop -a
