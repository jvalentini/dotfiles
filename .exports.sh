if [[ $HOST == 'alyssa' ]]; then
    # Alyssa exports
    export ORACLE_HOME="/u01/app/oracle/product/client/11.2.0.4"
    export TNS_ADMIN="$ORACLE_HOME/network/admin"
    export SCRIPTS_DIR="$HOME/scripts"
    export PATH="$HOME/.cask/bin:$SCRIPTS_DIR/ruby:$SCRIPTS_DIR/php:$ORACLE_HOME/bin:$HOME/.gems/bin:$HOME/installs/bin:/home/dev/bin:/usr/local/sbin/:$PATH"
else
    export ORACLE_HOME="/opt/oracle/instantclient_12_1"
    export TNS_ADMIN="$HOME"
    export PATH="$HOME/.cask/bin:$HOME/bin:$HOME/.rbenv/bin:$HOME/installs/bin:$ORACLE_HOME:$PATH"
    export SQLPATH="$HOME/.sqlplus:$HOME/git/sqlplus-scripts/"

    export EDITOR="$HOME/installs/bin/editor.sh"
    export JAVA_HOME="/usr/"

    eval "$(rbenv init -)"
fi