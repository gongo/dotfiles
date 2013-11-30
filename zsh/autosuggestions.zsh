source $DOTFILES_ZSH_DIR/bundle/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed)
bindkey '^T' autosuggest-toggle
# use ctrl+f to accept a suggested word
#bindkey '^F' autosuggest-accept-suggested-word
bindkey '^F' emacs-forward-word
