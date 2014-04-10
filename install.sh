#!/usr/bin/env bash

dotfile_dir=$PWD

cd $HOME

function create_link {
    file=$1
    ln -sf $dotfile_dir/$file $file
}

files=(".zshrc" ".screenrc" ".bashrc" ".gitconfig" ".gitignore")

for i in "${files[@]}"
do
    create_link $i
done

ls -al --color
