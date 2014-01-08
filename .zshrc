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
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export ORACLE_HOME="/u01/app/oracle/product/client/11g"
export SCRIPTS_DIR="$HOME/scripts"
export PATH="$HOME/.cask/bin:$SCRIPTS_DIR/ruby:$SCRIPTS_DIR/php:$ORACLE_HOME/bin:$HOME/.gems/bin:$HOME/installs/bin:/home/dev/bin:/usr/local/sbin/:$PATH"

# export PATH=$HOME/.cask/bin:/home/jvalentini/.rbenv/shims:/home/jvalentini/.rbenv/bin:/home/jvalentini/scripts/ruby:/home/jvalentini/scripts/perl:/home/jvalentini/scripts/php:/home/dev/bin:/u01/app/oracle/product/client/11g/bin:/home/jvalentini/installs/bin:/home/jvalentini/.gems/bin:/usr/local/sbin/:/home/jvalentini/scripts/ruby:/home/jvalentini/scripts/perl:/home/jvalentini/scripts/php:/home/dev/bin:/u01/app/oracle/product/client/11g/bin:/home/jvalentini/installs/bin:/home/jvalentini/.gems/bin:/usr/local/sbin/:/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:/home/jvalentini/bin:/u01/app/oracle/product/client/11g/bin:./:/home/jvalentini/.rvm/bin:$PATH
