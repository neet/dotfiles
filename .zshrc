autoload -Uz compinit
autoload -Uz promptinit

bindkey -e

compinit
promptinit

fpath+="$HOME/.zsh/functions"

# https://github.com/sindresorhus/pure
prompt pure

# direnv
# https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"

export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH_AUTOSUGGEST_STRATEGY="history completion"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
export PATH="$PATH:$HOME/.zsh/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# history related settings
# https://linux.die.net/man/1/zshoption
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

# Add ~/.local/bin to PATH (uv)
if [[ -f "$HOME/.local/bin/env" ]]; then
  source "$HOME/.local/bin/env"
fi

# keybindings
source "$HOME/.zsh/binding.zsh"

if [[ $OSTYPE = linux-gnu* ]]; then
  # https://wiki.archlinux.org/title/Zsh#Fish-like_syntax_highlighting_and_autosuggestions
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

elif [[ $OSTYPE = darwin* ]]; then
  BREW_PREFIX=$(brew --prefix)

  fpath+="$BREW_PREFIX/share/zsh/site-functions"

  # https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#homebrew
  # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
  source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

  # https://rust-lang.github.io/rustup/installation/other.html#homebrew
  export PATH="$PATH:$(brew --prefix rustup)/bin"
fi

# tmux
if [ -z "$TMUX" ]; then
  tmux attach || tmux new -s default
fi
