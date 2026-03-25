# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Présentation

VIP2 est une démo de la demoscene par **PoPsY TeAm** (u2/madman/rez/tuo/chandra), classée 1ère à la TakeOver 2000. Ce dépôt contient le portage Linux (v1.2) réalisé par **Sesse/Excess**, maintenu depuis sous forme de paquet Debian par Nicolas HOUDELOT.

## Compilation

```bash
# Compiler la démo
make

# Lancer la démo
./vip2

# Options de lancement
./vip2 -help
./vip2 -fullscreen -1920x1080
./vip2 -windowed -800x600 -z24

# Nettoyer
make clean
```

## Construction du paquet Debian

```bash
dpkg-buildpackage -b -us -uc
# ou
debuild -b -us -uc
```

Dépendances de build : `libglu-dev`, `libopengl-dev`, `libgl-dev`, `libjpeg-dev`, `libsdl2-dev`, `pkgconf`.

## Architecture

Le projet compile en liant trois bibliothèques statiques :

- **`libu3d.a`** (`LIBS/u3dLib/`) — moteur 3D maison (rendu OpenGL, caméra, splines, textures, BSP, squelettes/bones, gestion de scènes `.u3d`)
- **`libmpg.a`** (`LIBS/mpglib/`) — décodeur MP3 (mpglib, sous GPL)
- **Sources principales** (`Sources/`) — code de la démo, lié au dessus des deux bibliothèques

La démo tourne sous **SDL2 + OpenGL** (via `glwindow.cpp`) avec l'audio via **SDL2 push-mode** (`linux_sdl2.cpp`, `SDL_QueueAudio`). Le timer de la démo est synchronisé sur l'horloge audio (`ClockU3D::mp3_timer`), avec interpolation horloge-mur entre les quanta audio (~23 ms sur PipeWire) pour éviter les à-coups visuels.

### Séquençage de la démo

La progression temporelle est définie dans `Include/Vip2Headers.h` via des macros `*_TIME_BEGIN` / `*_TIME_END` (en secondes) :

| Scène | Début | Fin |
|---|---|---|
| Neuro | 30.79 s | 53.59 s |
| Plans | 52.66 s | 72.76 s |
| Oeil | 67.95 s | 86.85 s |
| Cils | 85.34 s | 96.16 s |
| Ghost | 93.31 s | 111.54 s |
| Couple | 111.74 s | 138.98 s |
| Multi | 138.98 s | 164.84 s |
| Smile/Final | 164.84 s | 197.84 s |

### Système de synchronisation (`Synchronisater`)

`USynchronisater` orchestre les callbacks temporels. Il est composé de `SynchroPhase` (plages horaires nommées) contenant des `SynchroTick` (instants précis), auxquels sont attachés des `SynchroCallback` (type `onecall` ou `multicall`). La variable globale `AllSynchro` est le point d'entrée ; `LaunchTime` enregistre l'heure de démarrage.

### Scheduler de tâches (`Scheduler`)

`UScheduler` gère une liste chaînée de `UTask` (nom + callback `PROCUTASK`). Les tâches peuvent être suspendues, reprises ou tuées dynamiquement pendant la démo.

### Compatibilité Linux (`linuxcompat.h`)

Remplace les classes MFC Windows (`CString`, `CArchive`) par des équivalents minimaux. `LPCSTR` est redéfini comme `const char *`.

### Données de la démo

Le répertoire `Datas/` contient les ressources (textures JPEG `.jpg`, meshes 3D, fichiers `.zic`). Ces ressources ne font **pas** partie du binaire compilé — elles sont chargées au runtime.

## Contrôles

| Touche | Action |
|---|---|
| Échap | Quitter |
| F | Basculer plein écran / fenêtré |
| Clic souris | Quitter |

Le plein écran utilise `SDL_WINDOW_FULLSCREEN_DESKTOP` (résolution native du bureau, sans changement de mode vidéo).

## Notes importantes

- Le code source original est en français (commentaires, noms de variables). Le portage Linux conserve cet usage.
- Des avertissements de liaison peuvent apparaître à la compilation (conflits entre anciennes libs) — c'est attendu.
- Les ports vers des architectures non-x86 nécessitent des corrections endian supplémentaires.
- `FRAMEPERSECOND` est fixé à 30 fps pour la lecture des scènes U3D.
- Bug original corrigé dans `LIBS/u3dLib/sources/light.cpp` : `LightU3D::Serialize` passait `npkeys` (clés de position) au lieu de `ntkeys` (clés de cible) lors de la construction de `SplineU3D`, causant un dépassement de tableau en lecture.

## Patches Debian (quilt)

Toujours créer/modifier les patches via quilt (`quilt new`, `quilt add`, `quilt refresh -p ab --no-timestamps`, `quilt header -a --dep3`). Ne jamais éditer les fichiers `.patch` directement ni avec l'outil Edit (problèmes de fins de ligne CRLF).
