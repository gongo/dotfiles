#!/usr/bin/env zsh

    DOTFILES_DIR=$(() {
            local self_file=$HOME/.zshenv

            if [ -L $self_file ] ; then
                self_file=$(readlink $self_file)
            fi

            echo $(cd "$(dirname $self_file)" ; pwd)
        }
    )

## global environment

   export LANG=ja_JP.UTF-8
   export LC_ALL=$LANG
   export SHELL=`which zsh`

   # 重複する path を削除
   typeset -U path

   path=(
       $HOME/.homebrew/Cellar/emacs/24.2/bin
       $HOME/app/bin
       $HOME/bin
       $HOME/.homebrew/bin # for OS X
       /usr/local/bin
       /usr/bin
       /usr/sbin
       /sbin
       /bin
       /usr/local/texlive/2012/bin/i386-linux
       $path
   )

   # 存在しない path の削除
   path=(${^path}(N))

##

   source $DOTFILES_DIR/rbenv/env
   source $DOTFILES_DIR/bundlizer/env
