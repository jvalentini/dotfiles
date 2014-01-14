# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails heroku lein)

source $ZSH/oh-my-zsh.sh

export no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16
export http_proxy=http://13.147.7.31:8000
export https_proxy=http://13.147.7.31:8000

# All export should be found in a local .export file
if [[ $HOST == 'alyssa' ]]; then
    # Alyssa exports
    export ORACLE_HOME="/u01/app/oracle/product/client/11.2.0.4"
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

# export PATH=$HOME/.cask/bin:/home/jvalentini/.rbenv/shims:/home/jvalentini/.rbenv/bin:/home/jvalentini/scripts/ruby:/home/jvalentini/scripts/perl:/home/jvalentini/scripts/php:/home/dev/bin:/u01/app/oracle/product/client/11g/bin:/home/jvalentini/installs/bin:/home/jvalentini/.gems/bin:/usr/local/sbin/:/home/jvalentini/scripts/ruby:/home/jvalentini/scripts/perl:/home/jvalentini/scripts/php:/home/dev/bin:/u01/app/oracle/product/client/11g/bin:/home/jvalentini/installs/bin:/home/jvalentini/.gems/bin:/usr/local/sbin/:/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:/home/jvalentini/bin:/u01/app/oracle/product/client/11g/bin:./:/home/jvalentini/.rvm/bin:$PATH
