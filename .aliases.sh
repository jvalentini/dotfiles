#!/usr/bin/env bash

alias ls='ls -a --color=auto'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias 1="cd .."
alias 2="cd ../.."
alias 3="cd ../../.."
alias 4="cd ../../../.."
alias 5="cd ../../../../.."

alias rm="rm -i"

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias alyssa='ssh jvalentini@alyssa'
alias be='bundle exec'

alias omnix='cd $HOME/git/omnix'
alias pc='php $HOME/installs/bin/composer.phar'
alias pu='php $HOME/installs/bin/phpunit.phar'
alias t='php $HOME/installs/bin/phpunit.phar'

alias ec='emacsclient -c &'

alias omnix='cd ~/git/omnix'

alias phpunit='php $HOME/git/omnix/amici_php/scripts/phpunit'

function g {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

# Allows commit message without typing quotes (can't have quotes in the commit msg though).
function gc {
  # git commit -m "$*"
  echo "$*"
}

if [ -f $HOME/dotfiles/.local-aliases.sh ]; then
    source $HOME/dotfiles/.local-aliases.sh
fi

function update_tnsnames {
    if [ -n "$TNS_ADMIN" ]
    then
        echo "Checking for tnsname updates..."
        (cd $TNS_ADMIN && git pull)
    else
        echo "Requires TNS_ADMIN to be set"
    fi
}