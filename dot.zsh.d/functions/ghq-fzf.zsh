#!/bin/zsh

function ghq-fzf () {
    local selected_dir=$(ghq list | fzf-tmux -p 80%)

    if [ -n "$selected_dir" ]; then
        BUFFER="cd $(ghq root)/${selected_dir}"
        zle accept-line
    fi

    zle clear-screen
}

zle -N ghq-fzf
bindkey '^xb' ghq-fzf

