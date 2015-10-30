source ~/.bash_functions

alias vim=nvim
alias vi=nvim
alias ed=nvim

PATH="$BASE_PATH:.:$UTILPATH:$MYSQL:/usr/local/php5/bin"

# Set the prompt - different color for different days - just for kicks
dow=$(date | cut -d " " -f 1)
PS1='\n[01;32m$dow \[$(tput setaf 4)\][`pwd`] [0m$(get_git_branch)\n> '

# Don't store duplicate commands in the history
export HISTCONTROL=ignoreboth

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# Grep highlight color
export GREP_COLOR='[01;32'

export EDITOR=nvim

export LSCOLORS=Exfxcxdxcxegedabagacdx
