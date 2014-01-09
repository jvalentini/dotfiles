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