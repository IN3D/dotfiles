for f in ./.bash_functions; do source $f; done

alias ll=ls -l
alias la=ls -a
alias lrt=ls -lrt
alias vim=nvim
alias vi=nvim
alias ed=nvim

# Don't store duplicate commands in the history
export HISTCONTROL=ignoreboth

# Grep highlight color
export GREP_COLOR='[01;32'

export EDITOR=nvim

export LSCOLORS=Exfxcxdxcxegedabagacdx

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  source $(brew --prefix nvm)/nvm.sh
fi

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
  GIT_PS1_SHOWSTASHSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_SHOWUPSTREAM=1
  GIT_PS1_SHOWCOLORHITS=1
  GIT_PS1_STATESEPARATOR="|"

GIT_PROMPT_START="\e[0;33m$(whoami)\e[0m at \e[0;35m$(hostname | cut -d . -f 1)\e[0m in \e[0;32m\w\e[0m"
  GIT_PROMPT_END="\n> "
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:~/bin
