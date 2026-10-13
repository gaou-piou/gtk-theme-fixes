# relic-gtk-fixes

Geometry and consistency fixes for GTK 3/4 and GNOME Shell themes, used by the `relic-*-gtk-theme` packages in the
AUR: maintained builds of the Catppuccin, Everforest, Gruvbox, Kanagawa, Material, Nightfox, Osaka,
Rosé Pine, Tokyonight and Vague GTK themes by Fausto-Korpsvart, whose repositories are archived.

The packages compile these files into the upstream SCSS sources; nothing here is a theme on its own.

## Layout

| Path | What it is |
|---|---|
| `generic/fixes-3.0.scss` | Generic GTK 3 fixes (headerbars, window buttons, Electron/Chromium titlebars) |
| `generic/fixes-4.0.scss` | Generic GTK 4 fixes (headerbars, window buttons, X11 frames, column headers, …) |
| `relic/fixes-variables.scss` | The relic themes' values for the generic fixes (measured geometry) |
| `relic/local-fixes-4.0.scss` | Fixes specific to these themes (Nautilus pathbar, linked entries, …) |
| `relic/local-fixes-gnome-shell.scss` | GNOME Shell fixes for these themes (notification banners, …) |

The generic fixes read optional variables; a theme sets them in its variables file to switch a fix
on and give it its measurements. Each variable is documented where `fixes-*.scss` reads it.

## What the fixes do

- Window buttons: the close button 1px closer to the window side than to the top, all buttons
  equally spaced, in GTK 4 and GTK 3 headerbars, libadwaita apps, the X11 titlebars mutter draws
  (`mutter-x11-frames`) and Electron/Chromium titlebars.
- Titlebars without a headerbar (Electron, LXAppearance, X11 frames): 44px.
- Nautilus: pathbar, location entry, list column headers.
- GNOME Shell: notification banners no longer jump down on hover.

## Releases

Tags are dates (`2026.10.12`). The packages pin a tag and its checksum, so a change here reaches
users only with a new tag and a package update.

## License

0BSD, see `LICENSE`. The themes these files are compiled into keep their own licenses
(GPL-3.0, AGPL-3.0 for Nightfox).
