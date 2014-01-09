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
   export GOPATH=$HOME/.go

   [ -z "$ld_library_path" ] && typeset -T LD_LIBRARY_PATH ld_library_path
   [ -z "$include" ] && typeset -T INCLUDE include

   # 重複する path を削除 & 即座に export
   typeset -xU path cdpath fpath manpath ld_library_path include

   path=(
       $HOME/app/bin
       $HOME/bin
       $GOPATH/bin
       /usr/local/bin
       /usr/bin
       /usr/sbin
       /sbin
       /bin
       $path
   )

##

   source $DOTFILES_DIR/load-env

## 存在しない path の削除

   path=(${^path}(N))
