source $DOTFILES_ZSH_DIR/bundle/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen-use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zaw
antigen-bundle zsh-users/zsh-completions

# Tell antigen that you're done.
antigen-apply

for s in $DOTFILES_ZSH_DIR/antigen/*.zsh ; do
    source $s
done

# disable auto correct
unsetopt correct_all
