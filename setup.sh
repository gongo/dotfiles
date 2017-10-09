#!/bin/sh

dotfiles() {
    local current_dir=$(cd $(dirname $0) && pwd)
    for dot in `find ${current_dir} -maxdepth 1 -name "dot.*"` ; do
        echo $dot
    done
}

symlink() {
    local from=$1
    local todir=$2
    local tofile="${todir}/${from##*/dot}"

    if [ ! -f $tofile -o ! -d $tofile -o  -L $tofile ] ; then
        ln -sfn "${from}" "${tofile}"
        echo "Linking ${tofile}"
    else
        echo "${tofile} is exists and not symbolic link. Dot not overwrite."
    fi
}

for f in `dotfiles $0` ; do
    symlink $f $HOME
done
