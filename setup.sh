#!/bin/bash
set -eu

dry=0
if [ $1 = "--dry" ]; then
  dry=1
  shift
fi

root="$PWD"

entries=(
  .config/ghostty
  .config/git
  .config/lazygit
  .config/nvim
  .config/starship.toml
  .config/opencode/opencode.jsonc
  .pi
  .tmux.conf
  .zsh
  .editorconfig
  .hushlogin
  .zprofile
  .zshrc
  .zshenv
  .Brewfile
  .Brewfile.lock.json
)

for entry in "${entries[*]}"; do
  src="$root/$entry"
  dst="$HOME/$entry"

  if [[ $dry -eq 0 ]]; then
    rm -f "$dst"
    ln -s "$src" "$dst"
  else
    echo "rm -f $dst"
    echo "ln -s $src $dst"
  fi
done

chmod +x "$HOME/.zsh/bin/"*
