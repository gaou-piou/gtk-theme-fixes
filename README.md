# gtk-theme-fixes

Geometry and consistency fixes for GTK 3/4 and GNOME Shell themes, compiled into the upstream SCSS
sources by theme packages in the AUR:

- `relic-*-gtk-theme`: maintained builds of the Catppuccin, Everforest, Gruvbox, Kanagawa,
  Material, Nightfox, Osaka, Rosé Pine, Tokyonight and Vague GTK themes by Fausto-Korpsvart, whose
  repositories are archived
- `<theme>-fixed-git`: vinceliuice's Colloid (and its Catppuccin, Dracula, Everforest, Gruvbox and
  Nord variants), Fluent, Graphite, Jasper, Lavanda, MacTahoe, Magnetic, Orchis and Orianin

`layan/` is unfinished: Layan's package installed the CSS shipped upstream, so these fixes never
reached it and its variables were never measured; it has no package yet.

Nothing here is a theme on its own.

## Layout

| Path | What it is |
|---|---|
| `generic/fixes-3.0.scss` | Generic GTK 3 fixes (headerbars, window buttons, Electron/Chromium titlebars) |
| `generic/fixes-4.0.scss` | Generic GTK 4 fixes (headerbars, window buttons, X11 frames, column headers, …) |
| `relic/fixes-variables.scss` | The relic themes' values for the generic fixes (measured geometry) |
| `relic/local-fixes-4.0.scss` | Fixes specific to the relic themes (Nautilus pathbar, linked entries, …) |
| `relic/local-fixes-gnome-shell.scss` | GNOME Shell fixes for the relic themes (notification banners, …) |
| `mactahoe/fixes-variables.scss` | MacTahoe's values for the generic fixes |
| `mactahoe/local-fixes-4.0.scss` | Fixes specific to MacTahoe (GTK 4) |
| `mactahoe/local-fixes-firefox.css` | Appended to MacTahoe's Firefox theme (`customChrome.css`) |
| `<theme>/` | The same for each `<theme>-fixed-git` package: `fixes-variables.scss`, and `local-fixes-3.0.scss`, `local-fixes-4.0.scss`, … where the theme needs its own |

The generic fixes read optional variables; a theme sets them in its variables file to switch a fix
on and give it its measurements. Each variable is documented where `fixes-*.scss` reads it.
A theme's own fixes live here too, so they reach its package without a package update. A
package's pkgver counts only the commits that change `generic/` or its own directory.

## What the fixes do

- Window buttons: the outer button as far from the window side as from the top, all buttons
  equally spaced, in GTK 4 and GTK 3 headerbars, libadwaita apps, the X11 titlebars mutter draws
  (`mutter-x11-frames`) and Electron/Chromium titlebars.
- Titlebars without a headerbar (Electron, LXAppearance, X11 frames): 44px.
- Nautilus: pathbar, location entry, list column headers, file chooser.
- GNOME Shell: notification banners no longer jump down on hover.

## Testing a change before it is released

The packages clone the `main` branch of this repository. Built with `local_build=true`, they take
the fixes from a `gtk-theme-fixes/` working tree in a parent directory of the PKGBUILD instead,
uncommitted changes included:

    local_build=true makepkg

## Window button styles

Themes whose upstream has a macOS-style button tweak take it from the theme's `$window_button`, so
one package serves both looks. Jasper builds with them (red/yellow/green circles, 14px, 6px apart,
a darker dot on hover, in every app, browser and Electron) with:

    mac_buttons=true makepkg

The theme names stay the same. Colloid's `--tweaks` take the same variable (colloid/fixes-variables.scss);
`themetest --theme Jasper-Mac-Dark-Dracula --all` checks the Jasper build.

## Releases

There are none: what is on `main` is what the next build of every theme gets, with no package
update. A package's `pkgver` ends in `r<commit count>.<commit>` of this repository, so a build
records which fixes it took and AUR helpers that check VCS sources (`--devel`) see a new commit.

Until 2026.10.23 the fixes were published as `gaou-piou/relic-gtk-fixes`, with tags; that
repository keeps them for the package versions that still point at it.

## License

0BSD, see `LICENSE`. The themes these files are compiled into keep their own licenses
(GPL-3.0, AGPL-3.0 for Nightfox).
