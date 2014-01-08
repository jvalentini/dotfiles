export ORACLE_HOME="/u01/app/oracle/product/client/11.2.0.4"
export SCRIPTS_DIR="$HOME/scripts"
export PATH="$HOME/.cask/bin:$SCRIPTS_DIR/ruby:$SCRIPTS_DIR/perl:$SCRIPTS_DIR/php:/home/dev/bin:$ORACLE_HOME/bin:$HOME/installs/bin:$HOME/.gems/bin:/usr/local/sbin/:$PATH"
export LD_LIBRARY_PATH="$ORACLE_HOME/lib:$HOME/installs/lib:$LD_LIBRARY_PATH"
export TNS_ADMIN="$ORACLE_HOME/network/admin"
export SQLPATH="$HOME/.sqlplus:$HOME/p4/ext/sqlplus/scripts:$HOME/p4/ext/sqlplus/scripts/coding_reports"
export GEM_HOME="$HOME/.gems"
# export EDITOR="$HOME/installs/bin/editor.sh"
export EDITOR="emacsclient -t"
export P4CONFIG="$HOME/.p4rc"
export MANPATH="$HOME/installs/share/man/man1:$MANPATH"
export TERM="xterm-256color"
export AMICI_USERNAME="jvalentini"
export DEV_USERNAME='jvalentini'
export APP_USERNAME='jvalentini_amicillccom'

unset LESS

# Virtualenv
export WORKON_HOME="$HOME/env"
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python2.7"
export VIRTUALENVWRAPPER_VIRTUALENV="/usr/local/bin/virtualenv-2.7"
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

source virtualenvwrapper.sh

if echo hello|grep --color=auto l >/dev/null 2>&1; then
  export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
fi

[ -f ~/etc/z/z.sh ]    && source ~/etc/z/z.sh
[ -f ~/etc/aliases ]   && source ~/etc/aliases
[ -f ~/etc/functions ] && source ~/etc/functions
[ -f ~/etc/passwds ]   && source ~/etc/passwds
[ -f ~/etc/.matterlist ]  && source ~/etc/.matterlist

[ -f ~/p4/amici/main/amici_php/scripts/test_env.sh ] && source ~/p4/amici/main/amici_php/scripts/test_env.sh

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# ignore spaces at the beginning
export HISTCONTROL=ignorespace
# increase size of history
export HISTSIZE=1000
# ignore common commands
export HISTIGNORE="pwd:ls:ls -l:ls -al:ls -a:fg:exit:sync:resolve:sync && resolve:history:"

if [ -f ~/.git-completion.bash ]; then
. ~/.git-completion.bash
fi

get_dir() {
    printf "%s" $(pwd | sed "s:$HOME:~:")
}

get_sha() {
    git rev-parse --short HEAD 2>/dev/null
}

if [ -f ~/git-prompt.sh ]; then
. ~/git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
fi

alias screen-irc='screen -x main -p 1'
alias screen-main='screen -S main'
