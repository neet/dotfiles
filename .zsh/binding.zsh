autoload -Uz search_ghq_with_fzf
autoload -Uz search_tmux 

# Ctrl-g: Search GHQ with Fzf
zle -N search_ghq_with_fzf
bindkey '^g' search_ghq_with_fzf

# Ctrl-w: Search Tmux with Fzf
zle -N search_tmux
bindkey '^w' search_tmux
