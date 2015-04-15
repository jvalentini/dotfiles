#!/usr/bin/env bash

dotfile_dir=$PWD

cd $HOME

function create_link {
    file=$1
    ln -sf $dotfile_dir/$file $file
}

files=(".zshrc" ".screenrc" ".bashrc" ".gitconfig" ".gitignore" ".gemrc" ".xinitrc" ".xscreensaver" ".xmobarrc" ".synergy.conf" ".pylintrc" ".floorc" ".pypirc" ".ansible.cfg")

for i in "${files[@]}"
do
    create_link $i
done

xmonad_dir=$HOME/.xmonad
mkdir -p $xmonad_dir && cd $xmonad_dir && ln -sf "$dotfile_dir/.xmonad/xmonad.hs" xmonad.hs

pip_dir=$HOME/.pip
mkdir -p $pip_dir && cd $pip_dir && ln -sf "$dotfile_dir/pip.conf" pip.conf

sqlplus_dir=$HOME/.sqlplus
mkdir -p $sqlplus_dir && cd $sqlplus_dir && ln -sf "$dotfile_dir/.sqlplus/login.sql" login.sql