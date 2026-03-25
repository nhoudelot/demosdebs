# xa003midssumer-by-xangle — Packaging Debian

## Vue d'ensemble

Paquet Debian pour la démo **xa003midssumer** de **xAngle** (2004, Linux), publiée sur pouet.net.
Source upstream : https://www.pouet.net/prod.php?which=17115

## Structure des paquets

| Paquet | Architecture | Rôle |
|---|---|---|
| `xa003midssumer-by-xangle` | any | Binaire compilé |
| `xa003midssumer-by-xangle-data` | all | Fichiers de données (textures, musique) |

## Dépendances de build

- `debhelper-compat (= 13)`
- `libgtk2.0-dev` — interface graphique (boîte de dialogue de lancement)
- `libsdl2-dev`, `libsdl2-mixer-dev`, `libsdl2-image-dev` — rendu et audio
- `pkgconf`

## Arborescence des sources

```
base/       — moteur principal (main, xdl/GUI GTK2, xdm, xio, xs)
scene/      — scènes de la démo (intro, rollingcube, greets, end, dance)
gfx/        — effets graphiques (cube, plasma, font, anim, noice, sort)
data/       — ressources runtime (textures/, xa-003.xm)
debian/     — packaging
```

## Patches (appliqués via quilt)

| Fichier | Objet |
|---|---|
| `01_adapt_makefile.patch` | Adaptation du Makefile au build Debian |
| `02_fix_warnings.patch` | Correction des avertissements de compilation |
| `03_change_data_path.diff` | Chemin des données vers `/usr/share/xa003midssumer-by-xangle/` |
| `04_fix_png16.diff` | Compatibilité libpng16 |
| `05_migrate_to_SDL2.patch` | Migration SDL1 → SDL2 |
| `06_better_quit.patch` | Gestion propre de la fermeture |
| `07_make_window_resizable.patch` | Fenêtre redimensionnable |
| `08_add_fullscreen_key.patch` | Raccourci clavier plein écran + résolution native au démarrage |

## Options de build (debian/rules)

- `hardening=+all` — toutes les protections de durcissement activées
- `-flto` (CXXFLAGS + LDFLAGS) — optimisation link-time
- Pas de compression xz du paquet (supprimée depuis ddebs10)
- Standard C++ : `gnu++98`, ABI version 2

## Installation

```
/usr/bin/xa003midssumer-by-xangle          # binaire (paquet binary)
/usr/share/xa003midssumer-by-xangle/data/  # données runtime (paquet data)
/usr/share/applications/xa003midssumer-by-xangle.desktop
/usr/share/icons/hicolor/256x256/apps/xa003midssumer-by-xangle.png
/usr/share/man/man6/xa003midssumer-by-xangle.6
```

## Versionnage

Format : `<upstream>-0ddebs<n>`
- Upstream figé à `1.0+1` (source originale non maintenue)
- Incréments `ddebs<n>` pour les changements de packaging uniquement

## Workflow habituel

```bash
# Appliquer les patches et builder
dpkg-buildpackage -us -uc -b

# Vérifier le résultat
lintian ../xa003midssumer-by-xangle_*.deb
lintian ../xa003midssumer-by-xangle-data_*.deb
```

## Notes

- `Rules-Requires-Root: no` — le build ne nécessite pas les droits root
- GTK2 est utilisé uniquement pour la boîte de dialogue de lancement (pas de GTK3)
- Le fichier de musique `xa-003.xm` (module tracker) est chargé via SDL2_mixer

## Patches Debian (quilt)

Toujours créer/modifier les patches via quilt (`quilt new`, `quilt add`, `quilt refresh -p ab --no-timestamps`, `quilt header -a --dep3`). Ne jamais éditer les fichiers `.patch` directement ni avec l'outil Edit
