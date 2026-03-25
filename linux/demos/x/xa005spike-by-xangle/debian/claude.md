# xa005spike-by-xangle — Notes Claude

Ce fichier contient les informations contextuelles sur le paquet Debian `xa005spike-by-xangle` pour les sessions de travail avec Claude Code.

## Structure du paquet

- `debian/control` — métadonnées du paquet (dépendances, description)
- `debian/changelog` — historique des versions
- `debian/rules` — règles de construction
- `debian/install` — fichiers à installer
- `debian/scripts/` — scripts de maintenance (postinst, prerm, etc.)
- `debian/resources/` — ressources embarquées
- `debian/patches/` — correctifs appliqués aux sources

## Source

- `main.cpp` — point d'entrée principal
- `Makefile` — système de compilation
- `handlers/` — gestionnaires d'événements
- `ds/` — structures de données
- `demo.xpk` — archive de la démo
- `demosystem.txt` — documentation du système de démo

## Commandes utiles

```bash
# Construire le paquet
dpkg-buildpackage -us -uc

# Vérifier le paquet avec lintian
lintian ../xa005spike-by-xangle_*.deb

# Inspecter le contenu
dpkg -c ../xa005spike-by-xangle_*.deb
```

## Objectifs

* améliorer les sources pour la mise à niveau vers Ubuntu 26.04
** vérifier la portabilité 64 bits
** préparer a GCC 15 par default
** s'assurer d'une compilation vers les architectures amd64, i386, armhf, arm64 et riscv64
** porter vers SDL2
*** ajouter le plein écran avec la touche F et ratio respecté
*** utilser SDL_WINDOW_FULLSCREEN_DESKTOP via la fonction ToggleFullscreen() 
*** tenter le plein écran sans FBO, mais sinon avec un FBO fixe, en passant par glBlitFramebuffer()
*** rendre la fenêtre redimensionnable
** si CMakeLists.txt, une version inférieure à 3.5 plus accepté

* toujours changer les sources via un patch quilt

## Patches Debian (quilt)

Toujours créer/modifier les patches via quilt (`quilt new`, `quilt add`, `quilt refresh -p ab --no-timestamps`, `quilt header -a --dep3`). Ne jamais éditer les fichiers `.patch` directement ni avec l'outil Edit.
À la fin, toujours revenir au source non patché via `quilt pop -a`.

### État actuel des patches (tous appliqués, démo fonctionnelle)

| Patch | Fichiers modifiés | Description |
|-------|-------------------|-------------|
| `01_adapt_makefile.patch` | `Makefile` | Adaptation du Makefile pour Debian (chemins, flags) |
| `02_adapt_path.patch` | `main.cpp` | Chemin des données vers `/usr/share/xa005spike-by-xangle/` |
| `03_link_to_libgl.patch` | `Makefile` | Édition de liens explicite vers libGL/libGLU |
| `04_migrate_to_SDL2.patch` | `ds/io/video.cpp`, `ds/io/video.h`, `ds/launcher.cpp` | Migration SDL1→SDL2 ; plein écran avec `SDL_WINDOW_FULLSCREEN_DESKTOP`, fenêtre redimensionnable, `SDL_GL_CONTEXT_PROFILE_COMPATIBILITY` pour le pipeline OpenGL fixe |
| `05_migrate_to_openmpt.patch` | `ds/io/music.cpp`, `ds/io/music.h`, `ds/demosystem.cpp`, `Makefile` | Remplacement de FMOD par libopenmpt ; rendu float32 stéréo via callback SDL2 à 48000 Hz ; `SDL_OpenAudioDevice` déplacé après l'ouverture de la fenêtre (évite le blocage PipeWire) ; `SDL_INIT_AUDIO` conservé dans `SDL_Init()` |
| `06_fix_xpk_64bit.patch` | `ds/io/loaders/read_xpk.cpp`, `ds/io/loaders/read_xpk.h` | Correction portabilité 64 bits : `uLongf` (8 octets sur x86_64) → `uint32_t` pour toutes les lectures du format XPK (format 2005 = 32 bits) ; correction du bug `uncompress()` qui passait l'adresse de `m_csizes[n]` au lieu de sa valeur |
| `07_fix_xmlparser_64bit.patch` | `ds/utils/xmlparser.cpp`, `ds/scriptparser.cpp` | Correction portabilité 64 bits : `unsigned int` → `size_t` pour les variables recevant `string::find()` (`lbegin`, `lend`, `loc`, `l0`, `l1`) ; sur x86_64 `string::npos = SIZE_MAX ≠ UINT_MAX`, causant des `substr(UINT_MAX)` → `bad_alloc` ou `out_of_range` |

### Bugs 64 bits corrigés (important pour futures portabilités)

- **`uLongf` zlib** : vaut `unsigned long` = 8 octets sur Linux x86_64, mais les formats fichiers historiques (XPK 2005) stockent des entiers sur 4 octets → utiliser `uint32_t` pour toute lecture de format binaire.
- **`string::find()` → `unsigned int`** : `string::npos = SIZE_MAX = 0xFFFFFFFFFFFFFFFF` ; tronqué à `UINT_MAX = 0xFFFFFFFF` → la comparaison `!= string::npos` est toujours vraie → utiliser `size_t` systématiquement.
- **`uncompress()` API** : le 4ème argument est une valeur (`uLong`), pas un pointeur ; passer `m_csizes[n]` et non `&m_csizes[n]`.
