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
plugins=(git ruby rails heroku lein pip celery vagrant python bundler github)

source $ZSH/oh-my-zsh.sh

# All export vars should be found in a local .export file
source $HOME/dotfiles/.exports.sh

# Add aliases
source $HOME/dotfiles/.aliases.sh

# Unset PS1 for dumb terms like tramp for emacs.
[ $TERM = "dumb" ] && unsetopt zle && PS1='$ '

# export PATH=$HOME/.cask/bin:/home/jvalentini/.rbenv/shims:/home/jvalentini/.rbenv/bin:/home/jvalentini/scripts/ruby:/home/jvalentini/scripts/perl:/home/jvalentini/scripts/php:/home/dev/bin:/u01/app/oracle/product/client/11g/bin:/home/jvalentini/installs/bin:/home/jvalentini/.gems/bin:/usr/local/sbin/:/home/jvalentini/scripts/ruby:/home/jvalentini/scripts/perl:/home/jvalentini/scripts/php:/home/dev/bin:/u01/app/oracle/product/client/11g/bin:/home/jvalentini/installs/bin:/home/jvalentini/.gems/bin:/usr/local/sbin/:/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:/home/jvalentini/bin:/u01/app/oracle/product/client/11g/bin:./:/home/jvalentini/.rvm/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi
