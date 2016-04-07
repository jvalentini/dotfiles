#!/usr/bin/env bash

export TERM=xterm-256color

function git-log2json () {
    git log \
        --pretty=format:'{%n "commit": "%H",%n "author": "%an <%ae>",%n "date": "%ad",%n "message": "%f"%n},' \
        $@ | \
        perl -pe 'BEGIN{print "["}; END{print "]\n"}' | \
        perl -pe 's/},]/}]/'
}

[ -f $HOME/dotfiles/secret.sh ] && source $HOME/dotfiles/secret.sh

# Virtualenv
export WORKON_HOME="$HOME/virtualenv"
export PROJECT_HOME="$HOME/git/"
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# source /usr/local/bin/virtualenvwrapper.sh

export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64"
export PATH="$HOME/installs/packer:$HOME/.cask/bin:$HOME/bin:$HOME/.rbenv/bin:$HOME/installs/bin:$WORKON_HOME:$PROJECT_HOME:$JAVA_HOME/bin:$PATH"
export EDITOR="emacsclient"

eval "$(rbenv init -)"

[[ ! -d "$WORKON_HOME" ]] && mkdir "$WORKON_HOME" # Make virtualenv home directory if it doesn't exist yet
vew="$(which virtualenvwrapper.sh)"               # Source virtualenvwrapper to get its functions
[[ -n "$vew" && -e "$vew" ]] && source "$vew"

function authorized_keys() {
    echo "Hosts (~/dotfiles/hosts):"
    ansible-playbook -i ~/dotfiles/hosts ~/dotfiles/authorized_keys.yml --list-hosts
    ansible-playbook -i ~/dotfiles/hosts ~/dotfiles/authorized_keys.yml -k -f 5
}

function ansible_init() {
    git_root=`git rev-parse --show-toplevel`
    if [ $git_root != $PWD ]
    then
        echo 'ERROR: Git project root does not match current directory.'
        return
    else
        _ansible_bootstrap
    fi
}

function _ansible_bootstrap() {
    mkdir -p ansible
    cd ansible
    cat <<EOF > playbook.yml
---
- name: create user
  hosts: all
  sudo: true
  vars:
    user: "vagrant"
    add_ssh_public_key: true
  roles:
    - common
EOF
    echo "- src: git+git@gitlab.amicillc.com:dev-tools/ansible-common.git\n  name: common" > roles.yml
    echo "[defaults]\nroles_path = ansible/roles" > ../ansible.cfg
    cd ..
}