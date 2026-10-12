#!/bin/sh
# Copy the GTK theme fixes from the development tree into this repository.
#
# The fixes are developed in /mnt/SSD/packaging (generic_gtk_fixes/ for every theme package,
# Fausto-Korpsvart/ for the relic themes), where the theme packages reach them through symlinks.
# A published symlink would point to a path that only exists on this machine, so this repository
# holds real copies: run this script, review the diff, commit and tag. The relic-*-gtk-theme PKGBUILDs download a tag of this repository.
set -eu

here=$(cd "$(dirname "$0")" && pwd)
dev=${RELIC_DEV_TREE:-/mnt/SSD/packaging}

copy() {
	# cp -L: dereference, so a symlinked source is copied as a file
	cp -L "$dev/$1" "$here/$2"
	echo "  $1 -> $2"
}

echo "Syncing from $dev"
copy generic_gtk_fixes/fixes-3.0.scss generic/fixes-3.0.scss
copy generic_gtk_fixes/fixes-4.0.scss generic/fixes-4.0.scss
copy Fausto-Korpsvart/fixes-variables.scss relic/fixes-variables.scss
copy Fausto-Korpsvart/local-fixes-4.0.scss relic/local-fixes-4.0.scss

if git -C "$here" rev-parse --git-dir >/dev/null 2>&1; then
	git -C "$here" status --short
fi
