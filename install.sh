#!/usr/bin/env bash

dotfile_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd $HOME

function create_link {
    file=$1
    ln -sf $dotfile_dir/$file $file
}

files=(".zshrc" ".screenrc" ".bashrc" ".gitconfig" ".gitignore" ".gemrc" ".xinitrc" ".xscreensaver" ".xmobarrc" ".synergy.conf" ".pylintrc" ".pypirc" ".ansible.cfg" ".floorc.json")

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

ssh_dir=$HOME/.ssh
mkdir -p $ssh_dir && cd $ssh_dir && ln -sf "$dotfile_dir/ssh-config" config
