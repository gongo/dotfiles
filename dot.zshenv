#!/usr/bin/env zsh

#------------------------------
# Global environment
#------------------------------

export LANG=ja_JP.UTF-8
export LC_ALL=$LANG
export SHELL=`which zsh`

path=(
    $HOME/bin
    $path
)

#------------------------------
# Development environment
#------------------------------

### Golang

if type go > /dev/null 2>&1 ; then
    export GOPATH=$HOME/Workspaces
    path=($GOPATH/bin $path)
fi

### Rbenv

if type rbenv > /dev/null 2>&1 ; then
    eval "$(rbenv init - zsh)"
fi

### Homebrew

path=(
    $HOME/.homebrew/bin
    $path
)

#------------------------------
# PATH environment
#------------------------------

### Remove duplicated paths

typeset -U path PATH

### Allow the following paths:
#
# (N)  Existing directories
# (-/) Directories and symbolic links that point to directories
#
path=(
    ${^path}(N-/)
)
