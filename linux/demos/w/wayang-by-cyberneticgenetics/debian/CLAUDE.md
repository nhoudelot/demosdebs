# wayang-by-cyberneticgenetics — Paquet Debian

## Présentation

Démo Linux de **Cybernetic Genetics** (Travis/code, Grass/visuel, Cardinal/musique), sortie au SceneCon 2009 (4e place). Raconte l'histoire de Jatajus, le vautour qui tente de sauver Sita du roi Ravana — inspirée du théâtre d'ombres indonésien (Wayang) et du Ramayana.

- Source amont : <https://www.pouet.net/prod.php?which=53381>
- Responsable : Nicolas HOUDELOT `<nicolas@demosdebs.org>`
- Licence : GPL-3.0+

## Structure des paquets

| Paquet | Architecture | Contenu |
|---|---|---|
| `wayang-by-cyberneticgenetics` | any | binaire (`/usr/bin/`), icône, fichier `.desktop` |
| `wayang-by-cyberneticgenetics-data` | all (Multi-Arch: foreign) | assets dans `/usr/share/wayang-by-cyberneticgenetics/` |
| `wayang-by-cyberneticgenetics-docs` | — | documentation |

## Construction

```
dpkg-buildpackage -b
```

Dépendances de construction : `debhelper-compat (= 13)`, `pkgconf`, `libpng-dev`, `libsdl2-dev`, `libsdl2-mixer-dev`, `mesa-common-dev`.

Options notables dans `debian/rules` :
- `hardening=+all` activé
- `-flto` ajouté aux `CFLAGS` et `LDFLAGS`
- `PKG_CONFIG_PATH` forcé pour la compilation croisée
- `dh_fixperms` surchargé pour corriger les permissions de `wayang.ogg` (644)

Format source : **3.0 (quilt)**

## Patches (debian/patches/)

| Fichier | Objet |
|---|---|
| `01_adapt_makefile.patch` | Modernise le Makefile (variables standards, `pkgconf`, `gnu90`) |
| `02_remove_fullscreen.patch` | Supprime le mode plein écran forcé au démarrage |
| `03_adapt_path.patch` | Adapte le chemin des données (`/usr/share/wayang-by-cyberneticgenetics/`) |
| `04_set_window_title.patch` | Définit le titre de la fenêtre |
| `05_update_png16.patch` | Migration vers l'API `libpng16` |
| `06_migrate_to_SDL2.patch` | Migration de SDL1 vers SDL2 |
| `07_better_quit.patch` | Quitter avec la touche `q` ou le bouton de fermeture |
| `08_resizable_window.patch` | Fenêtre redimensionnable avec conservation du ratio |
| `09_add_fullscreen_key.patch` | Touche `f` pour basculer en plein écran |
| `10_fix_64bit_portability.patch` | Remplace `unsigned long int` par `uint32_t` dans `movements.h/c` (LP64 : `unsigned long` = 64 bits, SDL `Uint32` = 32 bits) |
| `11_improve_sdl2_port.patch` | Améliorations du portage SDL2 : VSync (`SDL_GL_SetSwapInterval`), viewport initial, `SDL_WINDOWEVENT_SIZE_CHANGED`, `SDL_ENABLE`/`SDL_DISABLE`, `AUDIO_S16SYS`, includes inutiles, doublon dans `wayang.h` |

## Patches Debian (quilt)

Toujours créer/modifier les patches via quilt (`quilt new`, `quilt add`, `quilt refresh -p ab --no-timestamps`, `quilt header -a --dep3`). Ne jamais éditer les fichiers `.patch` directement

## Overrides Lintian

- `unknown-section demos` — la section `demos` n'est pas dans l'archive Debian officielle.
- `desktop-entry-lacks-keywords-entry` — le fichier `.desktop` ne comporte pas de champ `Keywords`.

## Notes de packaging

- Les fichiers PNG sources ont été optimisés avec `optipng`.
- Le binaire source `wayang.ogg` est déclaré dans `debian/source/include-binaries`.
- La page de manuel est maintenue manuellement (`debian/wayang-by-cyberneticgenetics.6`) ; la source Markdown (`.6.md`) sert de référence mais **pandoc n'est pas** une dépendance de construction (supprimé en ddebs3 pour compatibilité 32 bits).
