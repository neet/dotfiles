bindkey -e
unsetopt share_history

FPATH="$HOME/.zsh/functions":$FPATH
. "$HOME/.zsh/binding.zsh"

# https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"

# https://starship.rs/guide/
eval "$(starship init zsh)"
