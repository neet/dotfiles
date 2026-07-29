fpath+="$HOME/.zsh/functions"

autoload -Uz compinit
autoload -Uz promptinit

bindkey -e

compinit
promptinit

# direnv
# https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"

export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

export PATH="$PATH:$HOME/.zsh/bin"

# tmux
if [ -z "$TMUX" ]; then
  tmux attach || tmux new -s default
fi

# keybindings
source "$HOME/.zsh/binding.zsh"

