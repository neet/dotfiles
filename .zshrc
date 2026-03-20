fpath+=($HOME/.zsh/functions $fpath)
fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -Uz welcome
autoload -Uz dot
autoload -Uz search_ghq_with_fzf
autoload -Uz compinit
autoload -Uz promptinit

bindkey -e

compinit
promptinit

# https://github.com/sindresorhus/pure
prompt pure

# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#homebrew
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# direnv
# https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"

export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$HOME/.zsh/bin"

# https://rust-lang.github.io/rustup/installation/other.html#homebrew
export PATH="$PATH:$(brew --prefix rustup)/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# tmux
if [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi

# keybindings
. "$HOME/.zsh/binding.zsh"

welcome

