bindkey -e
unsetopt share_history

FPATH="$HOME/.zsh/functions":$FPATH
. "$HOME/.zsh/binding.zsh"

# https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"

# https://starship.rs/guide/
eval "$(starship init zsh)"

# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
