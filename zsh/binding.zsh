autoload -Uz search_ghq_with_fzf
autoload -Uz git_ignore_local
autoload -Uz git_unignore_local

zle -N search_ghq_with_fzf
bindkey "^g" search_ghq_with_fzf
