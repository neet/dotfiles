################################################################################
# モジュールの読み込み
################################################################################

# https://docs.brew.sh/Installation
if [[ $OSTYPE == darwin* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

fpath+="$HOME/.zsh/functions"

################################################################################
# システム用の環境変数の設定
################################################################################

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim

################################################################################
# PATH の追加
################################################################################

path+="$HOME/.zsh/bin"
path+="$HOME/.cargo/bin"
path+="$HOME/.local/bin"

if [[ $OSTYPE == darwin* ]]; then
  # https://rust-lang.github.io/rustup/installation/other.html#homebrew
  path+="$(brew --prefix rustup)/bin"
fi

################################################################################
# プラグインの読み込み
################################################################################

case "$OSTYPE" in
  linux-gnu*)
    # https://wiki.archlinux.org/title/Zsh#Fish-like_syntax_highlighting_and_autosuggestions
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ;;
  darwin*)
    BREW_PREFIX=$(brew --prefix)
    # https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#homebrew
    # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
    source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  ;;
esac

################################################################################
# Zsh の細かい設定
################################################################################

autoload -Uz compinit
autoload -Uz promptinit

compinit
promptinit

bindkey -e

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

export ZSH_AUTOSUGGEST_STRATEGY="history completion"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

export FZF_DEFAULT_OPTS="--color=base16,gutter:-1,border:8"

prompt pure

################################################################################
# セットアップ
################################################################################

eval "$(direnv hook zsh)"

if [[ -z $TMUX ]]; then
  tmux attach || tmux new -s default
fi
