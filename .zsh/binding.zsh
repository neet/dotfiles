autoload -Uz search_ghq_with_fzf

# Ctrl-g: Search GHQ with Fzf
zle -N search_ghq_with_fzf
bindkey '^g' search_ghq_with_fzf

