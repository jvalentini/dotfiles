#!/usr/bin/env bash

export AMICI_USERNAME="jvalentini"
export AMICI_TEST_SCHEMA="test_jt16"
export DEV_USERNAME='jvalentini'
export APP_USERNAME='jvalentini_amicillccom'
export ORACLE_USERNAME=$DEV_USERNAME

export JIRA_HOST='jira.amicillc.com'
export JIRA_PORT='443'
export JIRA_USERNAME='jvalentini'

export OMNIX_SRC='$HOME/git/omnix'

export TERM=xterm-256color

function git-log2json () {
    git log \
        --pretty=format:'{%n "commit": "%H",%n "author": "%an <%ae>",%n "date": "%ad",%n "message": "%f"%n},' \
        $@ | \
        perl -pe 'BEGIN{print "["}; END{print "]\n"}' | \
        perl -pe 's/},]/}]/'
}

[ -f $HOME/dotfiles/secret.sh ] && source $HOME/dotfiles/secret.sh

if [[ $HOST == 'alyssa' ]]; then
    # Alyssa exports
    export ORACLE_HOME="/u01/app/oracle/product/client/11.2.0.4"
#     export ORACLE_HOME="/u01/app/oracle/product/client/11g"
    export TNS_ADMIN="$ORACLE_HOME/network/admin"
    export LD_LIBRARY_PATH="$ORACLE_HOME/lib"
    export SCRIPTS_DIR="$HOME/scripts"
    export PATH="$HOME/.composer/vendor/bin:$HOME/.cask/bin:$SCRIPTS_DIR/ruby:$SCRIPTS_DIR/php:$ORACLE_HOME/bin:$HOME/.gems/bin:$HOME/installs/bin:/home/dev/bin:/usr/local/sbin/:$PATH"
    export SQLPATH="$HOME/.sqlplus:$HOME/git/sqlplus-scripts/"

    # Virtualenv
    export WORKON_HOME="$HOME/env"
    export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python2.7"
    export VIRTUALENVWRAPPER_VIRTUALENV="/usr/local/bin/virtualenv-2.7"
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
    source /usr/local/bin/virtualenvwrapper.sh

    export P4CONFIG=".p4rc"
elif [[ $HOST == 'justin-vm' ]]; then
    export ORACLE_HOME="/opt/oracle/instantclient_11_2"
    export LD_LIBRARY_PATH="$ORACLE_HOME"
    export NLS_LANG='AMERICAN_AMERICA.utf8'
    export TNS_ADMIN="$HOME/tnsnames/"
    export PATH="$HOME/.cask/bin:$HOME/bin:$HOME/.rbenv/bin:$HOME/installs/bin:$ORACLE_HOME:$PATH"
    export SQLPATH="$HOME/.sqlplus:$HOME/git/sqlplus-scripts/"
    export JAVA_OPTS="$JAVA_OPTS -Dhttp.proxyHost=13.147.7.31 -Dhttp.proxyPort=8000"

    # Virtualenv
    export WORKON_HOME="$HOME/virtualenv"
    export PROJECT_HOME="$HOME/git/"
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
    source /usr/local/bin/virtualenvwrapper.sh

    export EDITOR="emacs"
    export JAVA_HOME="/usr/"

    eval "$(rbenv init -)"
elif [[ $HOST == 'justin-lenovo' ]]; then
    export PATH="$HOME/.cask/bin:$HOME/.rbenv/bin:$HOME/installs/bin:$PATH"
    export EDITOR="emacs"
    eval "$(rbenv init -)"
    export PROJECT_HOME="$HOME/git/"
    export WORKON_HOME="$HOME/virtualenv"
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
else
    export no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,infrastructure.amicillc.com,testing.amicillc.com
    export http_proxy=http://httpproxy.amicillc.com:8080
    export https_proxy=http://httpproxy.amicillc.com:8080
    export ORACLE_HOME="/opt/oracle/instantclient_11_2"
    export LD_LIBRARY_PATH="$ORACLE_HOME"
    export NLS_LANG='AMERICAN_AMERICA.utf8'
    export TNS_ADMIN="$HOME/tnsnames/"
    export SQLPATH="$HOME/.sqlplus:$HOME/git/sqlplus-scripts/"
    export JAVA_OPTS="$JAVA_OPTS -Dhttp.proxyHost=13.147.7.31 -Dhttp.proxyPort=8000"

    # Virtualenv
    export WORKON_HOME="$HOME/virtualenv"
    export PROJECT_HOME="$HOME/git/"
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
    source /usr/local/bin/virtualenvwrapper.sh

    export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64"
    export PATH="$HOME/.cask/bin:$HOME/bin:$HOME/.rbenv/bin:$HOME/installs/bin:$ORACLE_HOME:$WORKON_HOME:$PROJECT_HOME:$JAVA_HOME/bin:$PATH"

    export EDITOR="emacsclient"

    eval "$(rbenv init -)"
fi

export PATH=$HOME/installs/packer:$PATH

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