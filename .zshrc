bindkey -e
unsetopt share_history

export EDITOR=nvim

fpath=($HOME/.zsh/functions $fpath)

# https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md
export XDG_CONFIG_HOME="$HOME/.config"

# https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"

# https://starship.rs/guide/
eval "$(starship init zsh)"

# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

welcome() {
  echo "$(tput bold)YUKI.N>$(tput sgr0)また図書館に"
}

. "$HOME/.zsh/binding.zsh"

welcome

