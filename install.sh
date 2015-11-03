#!/usr/bin/env bash

dotfile_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd $HOME

function create_link {
    file=$1
    ln -sf $dotfile_dir/$file $file
}

files=(".zshrc" ".screenrc" ".bashrc" ".gitconfig" ".gitignore" ".gemrc" ".xinitrc" ".xscreensaver" ".synergy.conf" ".pylintrc" ".pypirc" ".ansible.cfg" ".floorc.json" ".bumpversion.cfg")

for i in "${files[@]}"
do
    create_link $i
done

git clone git@github.com:jvalentini/xmonad-ubuntu-conf.git ~/.xmonad

pip_dir=$HOME/.pip
mkdir -p $pip_dir && cd $pip_dir && ln -sf "$dotfile_dir/pip.conf" pip.conf

sqlplus_dir=$HOME/.sqlplus
mkdir -p $sqlplus_dir && cd $sqlplus_dir && ln -sf "$dotfile_dir/.sqlplus/login.sql" login.sql

ssh_dir=$HOME/.ssh
mkdir -p $ssh_dir && cd $ssh_dir && ln -sf "$dotfile_dir/ssh-config" config
