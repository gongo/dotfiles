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
    $HOME/.local/bin
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

### Homebrew

if ! type brew > /dev/null 2>&1 ; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi

### Mise

if type mise > /dev/null 2>&1 ; then
    eval "$(mise activate zsh)"
fi

### Golang

export GOPATH=$HOME/Workspaces
path=($GOPATH/bin $path)

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
