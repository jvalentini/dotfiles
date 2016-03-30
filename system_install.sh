#!/usr/bin/env bash

sudo apt-get purge emacs emacs-snapshot-common emacs-snapshot-bin-common emacs-snapshot emacs-snapshot-el emacs-snapshot-gtk emacs23 emacs23-bin-common emacs23-common emacs23-el emacs23-nox emacs23-lucid auctex apel emacs24 emacs24-bin-common emacs24-common emacs24-common-non-dfsg emacs24-el

# Add the following with visudo (/etc/sudoers)
sudo echo 'Defaults env_keep += "http_proxy https_proxy ftp_proxy no_proxy"' >> /etc/sudoers

sudo add-apt-repository ppa:leolik/leolik
sudo add-apt-repository ppa:amandeepgrewal/notifyosdconfig
sudo add-apt-repository ppa:mc3man/trusty-media
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -s -c) contrib"
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository ppa:git-core/ppa
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y build-essential software-properties-common python-software-properties ubuntu-restricted-extras dkms terminator curl git corkscrew zsh xmonad xmobar xscreensaver offlineimap gnome-panel xmonad xmobar xscreensaver libaio1 linux-headers-generic virtualbox-dkms virtualbox-5.0 php python python-dev python-pip pylint ipython rbenv ruby-dev redis sqlite pidgin pidgin-plugin-pack openssh-client openssh-server php5 gstreamer0.10-ffmpeg htop default-jre jq vlc vlc-plugin-notify silversearcher-ag gcc-multilib autoconf automake autotools-dev

wget https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4_x86_64.deb && sudo dpkg -i vagrant_1.7.4_x86_64.deb && rm vagrant_1.7.4_x86_64.deb

NOTE for firefox html5 support: you need to install the relevant ffmpeg package for your distribution and set media.mediasource.enabled, media.fragmented-mp4.exposed and media.fragmented-mp4.ffmpeg.enabled to true in about:config

sudo apt-get install libnotify-bin
pkill notify-osd
sudo apt-get install notifyosdconfig

# zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# chsh -s /bin/zsh

# dotfiles
git clone https://github.com/jvalentini/dotfiles.git
cd dotfiles
bash ./install.sh

sudo dpkg-reconfigure virtualbox-dkms
sudo dpkg-reconfigure virtualbox

sudo -H pip install -U pip setuptools virtualenvwrapper httpie 'requests[security]'

sudo apt-get install -y ansible

mkdir ~/bin
curl -sS https://getcomposer.org/installer | php && mv composer.phar ~/bin && cd ~/bin && ln -sf composer.phar composer

sudo pip install format-sql

# emacs
sudo apt-get build-dep emacs24
curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
rm -rf ~/.emacs.d
git clone https://github.com/jvalentini/emacs.git .emacs.d/
cask
mkdir -p ~/.erc/logs
move over ~/.emacs.d/custom/secret.json

# ruby
sudo apt-get -y install libc6-dev libssl-dev libmysql++-dev libsqlite3-dev make build-essential libssl-dev libreadline6-dev zlib1g-dev libyaml-dev
# sudo gem install librarian-chef

# rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# node
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# Download oracle instantclient 11.2 - both the basic package and sqlplus
# http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html
sudo mkdir -p /opt/oracle
sudo mv instantclient_11_2 /opt/oracle/

unzip instantclient-basic-linux.x64-11.2.0.4.0.zip
unzip instantclient-sqlplus-linux.x64-11.2.0.4.0.zip
unzip instantclient-sdk-linux.x64-11.2.0.4.0.zip

cd $ORACLE_HOME
sudo ln -s libclntsh.so.11.1 libclntsh.so

sudo npm install -g eslint

mkdir -p ~/installs/packer
cd ~/installs/packer && wget https://releases.hashicorp.com/packer/0.8.6/packer_0.8.6_linux_amd64.zip && unzip packer_0.8.6_linux_amd64.zip

# Ack
curl -L http://betterthangrep.com/ack-standalone > ~/bin/ack && chmod 0755 ~/bin/ack

cd ~/installs && git clone https://github.com/sampson-chen/sack.git && cd sack && chmod +x install_sack.sh && ./install_sack.sh && cd ~/ && ln -sf ~/dotfiles/.sackrc .sackrc

# RescueTime
# wget https://www.rescuetime.com/setup/installer?os=amd64deb doesn't work
sudo apt-get install -y gtk2-engines-pixbuf
sudo dpkg -i rescuetime_current_amd64.deb

cd ~/installs && git clone https://github.com/universal-ctags/ctags.git && cd ctags && ./autogen.sh && ./configure && make && sudo make install

sudo ansible-galaxy install debops.sshd

curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker jvalentini