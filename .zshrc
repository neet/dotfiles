################################################################################
# モジュールの読み込み
################################################################################

# https://docs.brew.sh/Installation
if [[ $OSTYPE = darwin* ]]; then
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

typeset -aU path

path+="$HOME/.zsh/bin"
path+="$HOME/.cargo/bin"
path+="$HOME/.local/bin"

if [[ $OSTYPE = darwin* ]]; then
  # https://rust-lang.github.io/rustup/installation/other.html#homebrew
  path+="$(brew --prefix rustup)/bin"
fi

################################################################################
# プラグインの読み込み
################################################################################

case "$OSTYPE" in
  linux-gnu*)
    ZSH_PLUGINS_DIR="/usr/share/zsh/plugins"
  ;;
  darwin*)
    ZSH_PLUGINS_DIR="$(brew --prefix)/share"
  ;;
esac

source "$ZSH_PLUGINS_DIR/zsh-auto-notify/auto-notify.plugin.zsh"
source "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

################################################################################
# Zsh の細かい設定
################################################################################

autoload -Uz compinit
autoload -Uz promptinit

compinit
promptinit

# https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html
KEYTIMEOUT=1
bindkey -v
bindkey -M viins '^F' end-of-line
bindkey -M viins '^P' up-history
bindkey -M viins '^N' down-history

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

export ZSH_AUTOSUGGEST_STRATEGY=("history" "completion")
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

export FZF_DEFAULT_OPTS="--color=base16,border:8 --gutter=' '"

# https://github.com/MichaelAquilina/zsh-auto-notify
AUTO_NOTIFY_IGNORE+=("neovim", "lazygit")

prompt pure

################################################################################
# セットアップ
################################################################################

eval "$(direnv hook zsh)"

if [[ -z $TMUX ]]; then
  tmux attach || tmux new -s default
fi
