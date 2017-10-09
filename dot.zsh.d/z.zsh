source $DOTFILES_ZSH_DIR/bundle/z/z.sh

add-zsh-hook preexec _precmd_z

function _precmd_z () {
    _z --add "$(pwd -P)"
}
