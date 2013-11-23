#!/bin/sh

dotfiles() {
    local current_dir=$(cd $(dirname $1) && pwd)
    for dot in `ls ${current_dir}/dot.*` ; do
    	echo $dot
    done
}

symlink() {
    local from=$1
    local todir=$2
    local tofile="${todir}/${from##*/dot}"

    if [ ! -f $tofile -o -L $tofile ] ; then
	ln -sf "${from}" "${tofile}"
    else
	echo "${tofile} is exists and not symbolic link. Dot not overwrite."
    fi
}

for f in `dotfiles $0` ; do
    symlink $f $HOME
done
