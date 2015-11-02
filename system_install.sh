#!/usr/bin/env bash

sudo apt-get purge emacs emacs-snapshot-common emacs-snapshot-bin-common emacs-snapshot emacs-snapshot-el emacs-snapshot-gtk emacs23 emacs23-bin-common emacs23-common emacs23-el emacs23-nox emacs23-lucid auctex apel emacs24 emacs24-bin-common emacs24-common emacs24-common-non-dfsg emacs24-el

# Add the following with visudo (/etc/sudoers)
sudo echo 'Defaults env_keep += "http_proxy https_proxy ftp_proxy no_proxy"' >> /etc/sudoers

sudo add-apt-repository ppa:git-core/ppa
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y build-essential software-properties-common python-software-properties terminator curl git corkscrew zsh xmonad xmobar xscreensaver offlineimap gnome-panel xmonad xmobar xscreensaver libaio1 virtualbox vagrant php python python-dev python-pip pylint ipython rbenv ruby-dev redis sqlite pidgin pidgin-plugin-pack openssh-client openssh-server php5

sudo pip install -U pip
sudo pip install virtualenvwrapper

sudo apt-get install -y ansible

mkdir ~/bin
curl -sS https://getcomposer.org/installer | php && mv composer.phar ~/bin && cd ~/bin && ln -sf composer.phar composer

sudo pip install format-sql

# emacs
sudo apt-get build-dep emacs24
curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
rm -rf ~/.emacs.d
git clone https://github.com/jvalentini/emacs.git .emacs.d/

# ruby
sudo apt-get -y install libc6-dev libssl-dev libmysql++-dev libsqlite3-dev make build-essential libssl-dev libreadline6-dev zlib1g-dev libyaml-dev

# zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# chsh -s /bin/zsh

# dotfiles
git clone https://github.com/jvalentini/dotfiles.git
cd dotfiles
bash ./install.sh

# TODO!!!!!!!!
mkdir -p ~/.erc/logs
move over ~/.emacs.d/custom/secret.json


git clone git@gitlab.amicillc.com:dev-tools/amici-el.git ~/.emacs.d/lib/amici-el

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
