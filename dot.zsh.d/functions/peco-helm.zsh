#!/bin/zsh

# https://gist.github.com/masutaka/3c82d4cb8f0cf900b573
function peco-helm () {
    local IFS=$'\n'
    local selected_dir=$((ghq list --full-path | sed -e "s@$HOME@~@"; cdr -l | perl -pne 's@^[0-9]+ +@@') | awk '!x[$0]++{print $0}' | peco)

    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi

    zle clear-screen
}

zle -N peco-helm
bindkey '^xb' peco-helm

