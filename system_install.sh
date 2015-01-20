#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y git gnome-panel xmonad zsh python curl synergy python-pip rbenv libaio1 virtualbox python-dev redis ipython sqlite vagrant pylint ruby-dev vagrant

# ruby
sudo apt-get -y install libc6-dev libssl-dev libmysql++-dev libsqlite3-dev make build-essential libssl-dev libreadline6-dev zlib1g-dev libyaml-dev

pip install virtualenvwrapper

curl -L http://install.ohmyz.sh | sh
chsh -s /bin/zsh

git clone https://github.com/jvalentini/dotfiles.git
cd dotfiles
bash ./install.sh

curl -fsSkL https://raw.github.com/cask/cask/master/go | python

rm -rf ~/.emacs.d
git clone https://github.com/jvalentini/emacs.git .emacs.d/

touch ~/.emacs.d/custom/secret.json

cask

# Download oracle instantclient 11.2 - both the basic package and sqlplus
# http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html
sudo mkdir -p /opt/oracle
sudo mv instantclient_11_2 /opt/oracle/

cd $ORACLE_HOME
sudo ln -s libclntsh.so.11.1 libclntsh.so

git clone git@gitlab.amicillc.com:omnix-tools/tnsnames.git


sudo add-apt-repository ppa:leolik/leolik
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install libnotify-bin
pkill notify-osd
sudo add-apt-repository ppa:amandeepgrewal/notifyosdconfig
sudo apt-get update
sudo apt-get install notifyosdconfig

sudo gem install librarian-chef