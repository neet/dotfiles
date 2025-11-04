fpath=($HOME/.zsh/functions $fpath)

autoload -Uz welcome
autoload -Uz dot
autoload -Uz dev

bindkey -e

export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"

autoload -Uz compinit
compinit

# direnv
# https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"

# starship
# https://starship.rs/guide/
eval "$(starship init zsh)"

# fzf
# https://github.com/junegunn/fzf?tab=readme-ov-file#environment-variables
export FZF_DEFAULT_OPTS="--color=16"

# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#homebrew
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# tmux
if [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi

# keybindings
. "$HOME/.zsh/binding.zsh"

welcome

