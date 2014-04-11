#!/usr/bin/env bash

dotfile_dir=$PWD

cd $HOME

function create_link {
    file=$1
    ln -sf $dotfile_dir/$file $file
}

files=(".zshrc" ".screenrc" ".bashrc" ".gitconfig" ".gitignore" ".gemrc" ".xinitrc" ".xscreensaver" ".xmobarrc" ".synergy.conf")

for i in "${files[@]}"
do
    create_link $i
done

xmonad="xmonad.hs"
xmonad_dir=$HOME/.xmonad

mkdir -p $xmonad_dir && cd $xmonad_dir && ln -sf "$dotfile_dir/.xmonad/$xmonad" $xmonad
