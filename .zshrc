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

# If a command already exists in history, delete the older command.
HIST_IGNORE_ALL_DUPS="true"
HIST_REDUCE_BLANKS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails heroku lein virtualenvwrapper pip celery)

source $ZSH/oh-my-zsh.sh

# All export vars should be found in a local .export file
source $HOME/dotfiles/.exports.sh

# Add aliases
source $HOME/dotfiles/.aliases.sh

# export PATH=$HOME/.cask/bin:/home/jvalentini/.rbenv/shims:/home/jvalentini/.rbenv/bin:/home/jvalentini/scripts/ruby:/home/jvalentini/scripts/perl:/home/jvalentini/scripts/php:/home/dev/bin:/u01/app/oracle/product/client/11g/bin:/home/jvalentini/installs/bin:/home/jvalentini/.gems/bin:/usr/local/sbin/:/home/jvalentini/scripts/ruby:/home/jvalentini/scripts/perl:/home/jvalentini/scripts/php:/home/dev/bin:/u01/app/oracle/product/client/11g/bin:/home/jvalentini/installs/bin:/home/jvalentini/.gems/bin:/usr/local/sbin/:/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:/home/jvalentini/bin:/u01/app/oracle/product/client/11g/bin:./:/home/jvalentini/.rvm/bin:$PATH
