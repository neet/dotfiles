preview_with_glow() {
  local glow_opts="$(ghq root)/{}/README.md"

  # https://github.com/charmbracelet/glow/issues/654
  echo "CLICOLOR_FORCE=1 COLORTERM=truecolor glow -p -s dark $glow_opts"
}

# ==============================================================================
# Opening GHQ in Fzf
# keybind: ^g
# ==============================================================================
search_ghq_with_fzf() {
  local active_project=$(
    ghq list | fzf \
      --tmux 80% \
      --style full \
      --list-label "Repositories" \
      --preview-label "README.md" \
      --input-label "Keyword" \
      --preview "$(preview_with_glow)"
  )

  if [ -n "$active_project" ]; then
    cd "$(ghq root)/${active_project}"
    zle accept-line
  fi

  zle reset-prompt
}

zle -N search_ghq_with_fzf
bindkey '^g' search_ghq_with_fzf

