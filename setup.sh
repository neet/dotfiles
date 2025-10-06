#!/bin/sh
set -eu

DRY=0
if [ "${1:-}" = "--dry" ]; then
  DRY=1
  shift
fi

ROOT=${ROOT:-"$PWD"}

set -- \
  .config \
  .zsh \
  .editorconfig \
  .hushlogin \
  .zprofile \
  .zshrc \
  Brewfile \
  Brewfile.lock.json \

for base in "$@"; do
  find "$base" -type f -print | while IFS= read -r rel; do
    src="$ROOT/$rel"
    dst="$HOME/$rel"

    if [ "$DRY" -eq 1 ]; then
      echo "mkdir -p $(dirname "$dst")"
      echo "rm -f $dst"
      echo "ln -s $src $dst"
    else
      mkdir -p "$(dirname "$dst")"
      rm -f "$dst"
      ln -s "$src" "$dst"
    fi
  done
done
