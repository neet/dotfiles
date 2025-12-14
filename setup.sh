#!/bin/sh
set -eu

DRY=0
if [ "${1:-}" = "--dry" ]; then
  DRY=1
  shift
fi

ROOT=${ROOT:-"$PWD"}

set -- \
  .config/ghostty \
  .config/git \
  .config/lazygit \
  .config/nvim\
  .config/starship.toml \
  .tmux.conf \
  .zsh \
  .editorconfig \
  .hushlogin \
  .zprofile \
  .zshrc \
  .Brewfile \
  .Brewfile.lock.json \

for entry in "$@"; do
  src="$ROOT/$entry"
  dst="$HOME/$entry"

  if [ "$DRY" -eq 1 ]; then
    echo "rm -f $dst"
    echo "ln -s $src $dst"
  else
    rm -f "$dst"
    ln -s "$src" "$dst"
  fi
done

chmod +x $HOME/.zsh/bin/*
