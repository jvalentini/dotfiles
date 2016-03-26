unset LESS

if echo hello|grep --color=auto l >/dev/null 2>&1; then
  export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
fi

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# ignore spaces at the beginning
export HISTCONTROL=ignorespace
# increase size of history
export HISTSIZE=2000
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

export NVM_DIR="/home/justin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


source $HOME/dotfiles/.exports.sh
source $HOME/dotfiles/.aliases.sh
