export AMICI_USERNAME="jvalentini"
export DEV_USERNAME='jvalentini'
export APP_USERNAME='jvalentini_amicillccom'

export JIRA_HOST='jira.amicillc.com'
export JIRA_PORT='443'
export JIRA_USERNAME='jvalentini'

[ -f $HOME/dotfiles/secret.sh ] && source $HOME/dotfiles/secret.sh

if [[ $HOST == 'alyssa' ]]; then
    # Alyssa exports
    export ORACLE_HOME="/u01/app/oracle/product/client/11.2.0.4"
#     export ORACLE_HOME="/u01/app/oracle/product/client/11g"
    export TNS_ADMIN="$ORACLE_HOME/network/admin"
    export LD_LIBRARY_PATH="$ORACLE_HOME/lib"
    export SCRIPTS_DIR="$HOME/scripts"
    export PATH="$HOME/.cask/bin:$SCRIPTS_DIR/ruby:$SCRIPTS_DIR/php:$ORACLE_HOME/bin:$HOME/.gems/bin:$HOME/installs/bin:/home/dev/bin:/usr/local/sbin/:$PATH"
    export SQLPATH="$HOME/.sqlplus:$HOME/git/sqlplus-scripts/"

    # Virtualenv
    export WORKON_HOME="$HOME/env"
    export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python2.7"
    export VIRTUALENVWRAPPER_VIRTUALENV="/usr/local/bin/virtualenv-2.7"
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
else
    export no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,infrastructure.amicillc.com,testing.amicillc.com
    export http_proxy=http://13.147.7.31:8000
    export https_proxy=http://13.147.7.31:8000
    export ORACLE_HOME="/opt/oracle/instantclient_12_1"
    export TNS_ADMIN="$HOME"
    export PATH="$HOME/.cask/bin:$HOME/bin:$HOME/.rbenv/bin:$HOME/installs/bin:$ORACLE_HOME:$PATH"
    export SQLPATH="$HOME/.sqlplus:$HOME/git/sqlplus-scripts/"

    # Virtualenv
    export WORKON_HOME="$HOME/virtualenv"
    export PROJECT_HOME="$HOME/git/"
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
    source /usr/local/bin/virtualenvwrapper.sh

    export EDITOR="$HOME/installs/bin/editor.sh"
    export JAVA_HOME="/usr/"

    eval "$(rbenv init -)"
fi