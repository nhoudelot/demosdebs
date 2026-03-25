# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Présentation

Schtroumpf 2.0 est une intro/démo graphique en C (2004, groupe KNIGHTS), portée sous Linux avec SDL2 et OpenGL. Elle affiche une succession de scènes visuelles synchronisées sur un module musical XM.

## Compilation

```bash
bash autogen.sh && ./configure --prefix=/usr && make
```

`autogen.sh` appelle `autoreconf -fiv`.

Dépendances requises (Debian) : `libsdl2-dev`, `libopenmpt-dev`, `libgl-dev` ou `libopengl-dev`, `libglu1-mesa-dev`, `libx11-dev`.

### Paquet Debian

```bash
dpkg-buildpackage -us -uc -b
```

`debian/rules` utilise `dh $@ --with autoreconf` : `dh_autoreconf` régénère `configure` depuis `configure.ac` (patché), puis `dh_auto_configure` lance `./configure`. Ne pas appeler `autogen.sh` manuellement depuis `debian/rules` — le script est personnel et échoue hors de l'environnement du développeur.

## Architecture

### Boucle principale (`src/sc2.c`)

`main()` initialise SDL2 + OpenGL, charge la police bitmap et les parties de la démo, lance la musique, puis tourne en boucle jusqu'à ce que l'utilisateur appuie sur Échap ou que le module atteigne `SONG_END` (position `0x2000`). À chaque frame, `DrawParts()` parcourt `parts[]` et appelle `Draw()` sur la partie dont la fenêtre (`start`/`end` en positions de pattern XM) correspond à la position courante retournée par `GetMusicPosition()`.

### Système d'intro (`src/introsystem.{c,h}`)

Abstraction de rendu SDL2 + OpenGL. Fournit :
- gestion de la fenêtre (`OpenVideo`/`CloseVideo`/`Flip`)
- surfaces logicielles en mémoire (`Surface`, bpp = 1 ou 4)
- textures OpenGL (`CreateTexture`/`UploadTexture*`)
- utilitaires : bruit de Perlin (`FillNoise`), `Scale2x/4x/8x`, `Threshold`, `AddShadow`, `Blur`
- affichage de texte bitmap (`DrawString`)
- lecture XM via libopenmpt + SDL2 audio (`OpenMusic`/`GetMusicPosition`/`SetMusicPosition`/`CloseMusic`)

Le système de coordonnées logique est fixé à **1024×768** (ratio 4:3). `Mode2D()` et `RestoreViewport()` appliquent un viewport letterbox/pillarbox calculé par `UpdateViewport()` selon la taille réelle de la fenêtre. `Flip()` efface la fenêtre entière en noir après le swap pour maintenir les bandes propres. Touche **F** : plein écran `SDL_WINDOW_FULLSCREEN_DESKTOP` (sans changement de résolution). Tout code ajoutant un `glViewport` manuel doit utiliser `RestoreViewport()` plutôt que `glViewport(0, 0, ScreenWidth, ScreenHeight)`.

### Audio (libopenmpt)

`OpenMusic` charge le module XM depuis `data_module[]` avec `openmpt_module_create_from_memory2`, ouvre un périphérique audio SDL2 (`SDL_OpenAudioDevice`) en `AUDIO_F32SYS` 48 kHz stéréo, et démarre la lecture via un callback `fill_audio`. `GetMusicPosition` retourne `256 * order + row` sous verrou `SDL_LockAudioDevice`.

### Parties visuelles

Chaque fichier implémente un `DemoPart` avec callbacks `Open`/`Close`/`Draw` :

| Fichier | Effet |
|---|---|
| `logo.c` | Écran titre avec bitmaps personnages |
| `noise.c` | Bruit de Perlin animé |
| `ifs.c` + `ifstext.c` | Systèmes de fonctions itérées |
| `dejong.c` | Attracteur de De Jong |
| `harmonics.c` | Harmoniques visuelles |
| `interference.c` | Patterns d'interférence |

### Données embarquées (`src/data/`)

Bitmaps (8 bpp, 127 couleurs max) et module musical compilés dans le binaire sous forme de tableaux C générés par `src/data/src/convert.c`. Format interne : `RLEBitmap` + palette `SCPalette[]` + pixels `SCPixel[]` (`src/bitmap.h`).

## Patches Debian (quilt)

Toujours créer/modifier les patches via quilt (`quilt new`, `quilt add`, `quilt refresh -p ab --no-timestamps`, `quilt header -a --dep3`). Ne jamais éditer les fichiers `.patch` directement ni avec l'outil Edit (problèmes de fins de ligne CRLF).

Les sources `.c`/`.h` upstream ont des fins de ligne Windows (CRLF). Pour modifier un fichier suivi par quilt, utiliser Python en mode binaire : `open(f,'rb').read()` / `open(f,'wb').write(...)`.

1. `01_remove_fullscreen.patch` — démarrage en mode fenêtré
2. `02_fix_warnings.patch` — corrections d'includes et avertissements
3. `03_fix_64bit_portability.patch` — portabilité 64 bits : `size_t` pour les tailles de buffers, `long` dans `convert.c`, correction des boucles `FillNoise` dans `perlin.c`
4. `04_migrate_to_SDL2.patch` — migration SDL 1.2 → SDL2 (`SDL_CreateWindow`, `SDL_GL_SwapWindow`, includes `SDL2/`, `acinclude.m4`)
5. `05_sound_openmpt.patch` — remplacement de libmikmod embarqué par libopenmpt ; `configure.ac` : `AC_CHECK_LIB([openmpt], ...)` + `LIBS="-lm $LIBS"` ; `introsystem.c` : implémentation openmpt + correction `SDL_CreateRGBSurface` 8 bpp (masques à 0 pour surface palette SDL2)
6. `06_fix_palette_braces.patch` — correction des initialiseurs de `SCPalette[]` dans les 8 fichiers `src/data/bmp_*.c` (accolades manquantes → `-Wmissing-braces`) ; `introsystem.h` : macro `MIN` sans parenthèses externes ; `introsystem.c` : comportement indéfini sur point de séquence dans `Threshold` (`*dst = table[*dst]; dst++`) ; `dejong.c` : variable `a` non initialisée (`a=1.0f`) ; `logo.c` : résultat de `CLAMP` non affecté + parenthèses manquantes autour de `&&` dans une expression `||` ; `ifs.c` + `dejong.c` : `texBuffer`, `bmpBuffer`, `bmpBuffer8`, `randtable`, `vertexarray`, `table_addpixel_clamp`, `table_palette` déclarés `static` pour éliminer les définitions multiples et les avertissements LTO `-Wlto-type-mismatch` (ITERATIONS=30000 dans ifs.c vs 15000 dans dejong.c, vertexarray GLshort vs int)
7. `07_fullscreen.patch` — touche F pour basculer en plein écran (`SDL_WINDOW_FULLSCREEN_DESKTOP`) ; ajout de `SDL_WINDOW_RESIZABLE` ; déclaration forward `extern SDL_Window *sdlWindow` nécessaire car `CheckUserBreak` précède la définition dans le fichier
8. `08_aspect_ratio.patch` — viewport letterbox/pillarbox préservant le ratio 4:3 : `UpdateViewport(w,h)` calcule `ViewportX/Y/W/H`, `RestoreViewport()` l'applique, `Mode2D()` l'utilise ; `Flip()` efface la fenêtre entière après le swap ; `SDL_WINDOWEVENT_SIZE_CHANGED` déclenche `UpdateViewport` ; `harmonics.c` : `glViewport(0,0,ScreenWidth,ScreenHeight)` remplacé par `RestoreViewport()`
