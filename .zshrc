autoload -Uz compinit
autoload -Uz promptinit

compinit
promptinit

# https://github.com/sindresorhus/pure
prompt pure

# direnv
# https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export ZSH_AUTOSUGGEST_STRATEGY="history completion"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
export FZF_DEFAULT_OPTS="--color=base16,gutter:-1,border:8"

# path
path+="$HOME/.zsh/bin"
path+="$HOME/.cargo/bin"
path+="$HOME/.local/bin"

# history related settings
# https://linux.die.net/man/1/zshoptions
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# keybindings
bindkey -e

# functions
fpath+="$HOME/.zsh/functions"

# OS-specific setups
case "$OSTYPE" in
  linux-gnu*)
    # https://wiki.archlinux.org/title/Zsh#Fish-like_syntax_highlighting_and_autosuggestions
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ;;
  darwin*)
    # https://docs.brew.sh/Installation
    eval "$(/opt/homebrew/bin/brew shellenv)"

    BREW_PREFIX=$(brew --prefix)
    # https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#homebrew
    # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
    source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

    # https://rust-lang.github.io/rustup/installation/other.html#homebrew
    path+="$(brew --prefix rustup)/bin"
  ;;
esac

# tmux
if [[ -z $TMUX ]]; then
  tmux attach || tmux new -s default
fi
