#!/bin/bash
set -eu

dry=0
if [[ "$#" -gt 0 && "$1" = "--dry" ]]; then
  dry=1
  shift
fi

root="$PWD"

entries=(
  .config/ghostty/config
  .config/git
  .config/lazygit
  .config/nvim
  .config/opencode/opencode.jsonc
  .config/starship.toml
  .editorconfig
  .hushlogin
  .pi
  .tmux.conf
  .zsh
  .zshrc
)

if [[ $OSTYPE = darwin* ]]; then
  entries+=(
    .Brewfile
    .Brewfile.lock.json
    .config/ghostty/macos
  )
fi

if [[ $OSTYPE = linux-gnu* ]]; then
  entries+=(
    .config/solaar/rules.yaml
    .config/ghostty/linux-gnu
  )
fi

for entry in "${entries[@]}"; do
  src="$root/$entry"
  dst="$HOME/$entry"

  if [[ $dry -eq 0 ]]; then
    rm -f "$dst"
    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
  else
    echo "rm -f \"$dst\""
    echo "mkdir -p \"$(dirname "$dst")\""
    echo "ln -s \"$src\" \"$dst\""
  fi
done

chmod +x "$HOME/.zsh/bin/"*
