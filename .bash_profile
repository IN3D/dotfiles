source ~/.bash_functions
source ~/.git-prompt.sh

alias vim=nvim
alias vi=nvim
alias ed=nvim

PATH="$BASE_PATH:.:$UTILPATH:$MYSQL:/usr/local/php5/bin"

# Don't store duplicate commands in the history
export HISTCONTROL=ignoreboth

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# Grep highlight color
export GREP_COLOR='[01;32'

export EDITOR=nvim

export LSCOLORS=Exfxcxdxcxegedabagacdx

GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWCOLORHITS=1
GIT_PS1_STATESEPARATOR="|"

GIT_PROMPT_START="\e[0;33m$(whoami)\e[0m at \e[0;35m$(hostname | cut -d . -f 1)\e[0m in \e[0;32m$(basename $PWD)\e[0m"
GIT_PROMPT_END="\n> "
