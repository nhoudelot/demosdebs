# ixalance — Notes de packaging (Claude)

## Présentation du projet

**ixalance** est un chargeur de démos DOS32 pour Linux/SDL, originellement développé par
Jurjen Katsman (The Black Lotus) et porté sous Linux par Jarno Paananen vers l'an 2000.
Il permet d'exécuter les démos TBL (fichiers `.ixa`) sous Linux en émulant l'environnement
32-bit protégé qu'elles attendent.

Le code source contient :
- du C++ (`main.cpp`) pour le pilote SDL/GGI/PTC
- du C (`d32load.c`, `lzss.c`, `unrle.c`) pour le chargeur d'exécutables DOS32
- de l'assembleur NASM 32-bit (`code.asm`) pour les trampolines far-call et la relocation

## Problèmes identifiés dans le Makefile d'origine

### 1. Symboles NASM incorrects (`M_TARGET_ELF` absent)

`code.asm` contient une macro conditionnelle :
- si `M_TARGET_ELF` est défini → symboles sans préfixe (`temp1`, `saveFS`…) ← Linux ELF
- sinon → symboles avec préfixe `_` (`_temp1`, `_saveFS`…) ← convention DOS/Windows

Le Makefile n'invoquait pas NASM avec `-D M_TARGET_ELF`, ce qui générait des dizaines de
références indéfinies à l'édition de liens (`_temp1`, `_saveFS`, `_jumptramp`, etc.).

**Correction :**
```makefile
$(NASM) -f elf32 -D M_TARGET_ELF $< -o $@
```

### 2. Incompatibilité d'architecture 32/64-bit

`code.asm` est du code x86 32-bit (`BITS 32`) avec des instructions spécifiques au mode
protégé 32-bit (`retf`, `call far`, `push fs/gs`, manipulation de sélecteurs de segments).
Il ne peut pas être mélangé avec des objets ELF 64-bit.

Le Makefile d'origine compilait les fichiers C/C++ en 64-bit (comportement par défaut),
produisant une erreur « architecture i386 incompatible avec la sortie » à l'édition de liens.

**Correction :**
```makefile
CFLAGS  += -m32
LDFLAGS += -m32
```

### 3. Liaison C++ avec `gcc` au lieu de `g++`

`main.cpp` est du C++. La règle de liaison utilisait `$(CC)` (`gcc`), ce qui omet
l'édition de liens avec la bibliothèque d'exécution C++ (`libstdc++`).

**Correction :**
```makefile
CXX ?= g++
# règle de liaison et compilation .cpp → $(CXX)
```

## Dépendances de compilation supplémentaires requises

Le fichier `debian/control` doit être complété avec les dépendances 32-bit :

```
Build-Depends:
 gcc-multilib,
 g++-multilib,
 libsdl1.2-dev:i386 | libsdl1.2-compat-dev:i386,
 libmidas-dev,          ← actuellement seulement en amd64
 nasm,
 debhelper-compat (= 13)
```

## Patch existant

`debian/patches/01_fix-cpp.patch` : corrige une déclaration `char *` → `const char *`
dans `main.cpp` pour la conformité C++ stricte.

## Objectifs

- améliorer les sources pour la mise à niveau vers Ubuntu 26.04.
- vérifier la portabilité 64 bits dans un patch séparé.
- préparer a GCC 15 par default dans un patch séparé.
- s'assurer d'une compilation vers l'architecture i386 uniquement
- si CMakeLists.txt, une version inférieure à 3.5 n'est plus accepté.
- porter vers SDL2.
   - ajouter le plein écran avec la touche F et ratio respecté.
   - utilser SDL_WINDOW_FULLSCREEN_DESKTOP via la fonction ToggleFullscreen() 
   - tenter le plein écran sans FBO, mais sinon avec un FBO fixe, en passant par glBlitFramebuffer()
   - rendre la fenêtre redimensionnable.
   - arbitrer entre openmpt et SDL_Mixer.
   - séparer la migration vidéo et audio SDL2 dans 2 patch distincts.
- applique les spécifications XDG Base Directory si nécessaire.
- toujours changer les sources via un patch quilt

# Dossier debian/

- Manuels
   - mettre à jour les manuels markdown du repertoire debian/ au standard Debian, et verifier qu'il est complété
   - faire une version française de ces manuel en markdown uniquement, extension .fr.1 ou .fr.6, 
   - ne pas faire de version en GROFF des manuels, ne pas rajouter de dépendance a pandoc
   - me mettre en temps qu'auteur sous la forme : Packaged for Debian/Ubuntu by Nicolas HOUDELOT <nicolas@demosdebs.org>
- debian/control : Style conforme au Guide des développeurs Debian (synopsis court + corps développé)
- debian/upstream/metadata : créer fichier au format DEP-12

## Patches Debian (quilt)

- Toujours créer/modifier les patches via quilt (`quilt new`, `quilt add`, `quilt refresh -p ab --no-timestamps`, `quilt header -a --dep3`). 
- Ne jamais éditer les fichiers `.patch` directement ni avec l'outil Edit.
- a la fin, toujours revenir au source non patché via  `quilt pop -a`.
- les descriptifs des patches doivent être en anglais.

## État actuel

| Élément | État |
|---|---|
| Makefile — symboles NASM | Corrigé (dans le Makefile, hors patches) |
| Makefile — compilation 32-bit (-m32) | Corrigé (dans le Makefile, hors patches) |
| Makefile — liaison C++ (CXX) | Corrigé (dans le Makefile, hors patches) |
| `02_gcc15-compat` — constantes multi-char, tempnam→mkstemp, casts | Appliqué |
| `03_sdl2-video` — port SDL2 vidéo, ToggleFullscreen, fenêtre redim. | Appliqué |
| `04_sdl2-audio` — remplacement MIDAS → libopenmpt + SDL2 audio | Appliqué |
| `05_fix-nopie` — désactivation PIE pour corriger le segfault dans `code.asm` | Appliqué |
| `06_fix-exec-memory` — `mprotect(PROT_EXEC)` sur le buffer démo pour NX Linux | Appliqué |
| `07_fix-stack-align` — `and esp, -16` dans tous les trampolines pour alignement SSE | Appliqué |
| `08_fix-herzcount-timer` — herzcount avancé de façon idempotente dans audio_callback ET UpdateMusic (même lasttime) | Appliqué |
| `09_fix-vsync-block` — suppression SDL_RENDERER_PRESENTVSYNC, cause du freeze par poll_schedule_timeout à la transition d'effet | Appliqué |
| libmidas i386 | Supprimé — remplacé par libopenmpt |
| Build-Depends | Mis à jour : libsdl2-dev + libopenmpt-dev |
| gcc-multilib / g++-multilib | À ajouter dans Build-Depends |
| libsdl1.2-dev:i386 | À ajouter dans Build-Depends |
