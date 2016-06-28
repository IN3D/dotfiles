if command -v brew >/dev/null 2>&1; then
  if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
  fi
else
  source ~/GitHub/bash-git-prompt/gitprompt.sh
fi
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWCOLORHITS=1
GIT_PS1_STATESEPARATOR="|"

if [ $USER == 'root' ]; then
  GIT_PROMPT_START="\e[1;31mASSUMING DIRECT CONTROL\e[0m"
else
  GIT_PROMPT_START="\e[0;33m$(whoami)\e[0m at \e[0;35m$(hostname | cut -d . -f 1)\e[0m in \e[0;32m\w\e[0m"
fi
GIT_PROMPT_END="\n> "

