autoload -Uz welcome
autoload -Uz dot

bindkey -e

# unsetopt share_history
fpath=($HOME/.zsh/functions $fpath)

export EDITOR=nvim

# https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md
export XDG_CONFIG_HOME="$HOME/.config"

# https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"

# https://starship.rs/guide/
eval "$(starship init zsh)"

# https://github.com/junegunn/fzf?tab=readme-ov-file#environment-variables
export FZF_DEFAULT_OPTS="--color=16"

# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi

. "$HOME/.zsh/binding.zsh"

welcome

