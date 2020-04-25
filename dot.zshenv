#!/usr/bin/env zsh

#------------------------------
# avoid loading /etc/profile
# (not to execute /usr/libexec/path_helper)
#------------------------------
setopt no_global_rcs

#------------------------------
# Global environment
#------------------------------

path=(
    $HOME/bin
    /usr/local/bin
    /usr/bin
    /bin
    /usr/sbin
    /sbin
    $path
)

export LANG=ja_JP.UTF-8
export LC_ALL=$LANG
export SHELL=`which zsh`

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
    export RBENV_ROOT="$(rbenv root)"
    eval "$(rbenv init - zsh)"
fi

if type nodenv > /dev/null 2>&1 ; then
    export NODENV_ROOT="$(nodenv root)"
    eval "$(nodenv init - zsh)"
fi

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
