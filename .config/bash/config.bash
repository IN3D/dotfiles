# Exports
# =============================================================================
export config_dir="$HOME/GitHub/dot_files/.config/bash"
export HISTCONTROL=ignoreboth
export GREP_COLOR='[01;32'
export EDITOR=nvim
export LSCOLORS=Exfxcxdxcxegedabagacdx
export NVM_DIR="~/.nvm"
# =============================================================================


# Source
# =============================================================================
if [ -f "$(brew --prefix nvm)/nvm.sh" ]; then
  source $(brew --prefix nvm)/nvm.sh
fi
if command -v brew >/dev/null 2>&1; then
  source "$config_dir/managers/brew.bash"
fi
if command -v apt-get >/dev/null 2>&1; then
  source "$config_dir/managers/apt.bash"
fi
if command -v pacman >/dev/null 2>&1; then
  source "$config_dir/managers/pacman.bash"
fi
if command -v zypper >/dev/null 2>&1; then
  source "$config_dir/managers/zypper.bash"
fi
if command -v dnf >/dev/null 2>&1; then
  alias yum=dnf
  source "$config_dir/managers/yum.bash"
fi
# =============================================================================


# Functions
# =============================================================================
if [ -d "$config_dir/functions" ]; then
  for f in ~/GitHub/dot_files/.config/bash/functions/*; do
    source $f
  done
else
  echo 'no bash functions directory'
fi
# =============================================================================


# Aliases
# =============================================================================
# listings
alias ls='ls -G' # ls color mode
alias l='ls -lFh' # long list, directories with trailing slash, better sizes
alias ll='ls -lFh' # long list, trailing / on dirs
alias la='ls -lAFh' # list all (except ./ and ../)
alias lt='ls -ltFh' # list by time
alias lrt='ls -lrtFh' # list by time, reversed
alias ldot='ls -ld .*' # list dot files
alias lS='ls -1lFSsh' # list with files sizes in 512 bytes, with total
alias lart='ls -1FcArt' # short, files from most to least recently modified

# editor
alias vim=nvim
alias vi=nvim
alias ed=nvim

alias grep='grep --color'
# Super grep
# Recursive: shows line numbers and headers, with 5 lines of context
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'

alias t='tail -f'

# for piping
alias L=less
alias T=tail

alias fd='find . -type d -name'
alias ff='find . -type f -name'

# safe versions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# =============================================================================


# PS1
# =============================================================================
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
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
fi
# =============================================================================


# Version Managers
# =============================================================================
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# =============================================================================

PATH=$PATH:~/bin
