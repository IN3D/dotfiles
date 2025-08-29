# System support
#
# Source global defaults and definitions if the distro provides them
# =============================================================================
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Exports
# =============================================================================
export config_dir="$HOME/.config/bash"
export HISTCONTROL=ignoreboth
export GREP_COLOR='[01;32'
export EDITOR=nvim
export LSCOLORS=Exfxcxdxcxegedabagacdx
export NVM_DIR=~/.nvm
export TERM="xterm-256color"
# =============================================================================

# Detect
# =============================================================================
osName=`uname`
# =============================================================================

# Aliases
# =============================================================================
# listings
if [ $osName = "Darwin" ] || [ $osName = "FreeBSD" ]; then
  alias ls='ls -G' # ls color mode (Unix)
else
  alias ls='ls --color' # ls color mode (Linux)
fi

# For older machines that may have exa available, but not eza
if command -v exa &> /dev/null && ! command -v eza &> /dev/null; then
  alias eza='exa'
fi

# Prefer eza over ls if it's available
if command -v eza &> /dev/null; then
  alias l='eza -lh'
  alias ll='eza -lh'
  alias la='eza -lah'
  alias lt='eza -lh --sort=modified'
  alias lrt='eza -lh --sort=modified --reverse'
  alias ldot='eza -1 -lh --sort=size --reverse'
  alias lart='eza -1 -lah --sort=modified'
else
  alias l='ls -lh' # long list, directories with trailing slash, better sizes
  alias ll='ls -lh' # long list, trailing / on dirs
  alias la='ls -lAh' # list all (except ./ and ../)
  alias lt='ls -lth' # list by time
  alias lrt='ls -lrth' # list by time, reversed
  alias ldot='ls -ld .*' # list dot files
  alias lS='ls -1lSsh' # list with files sizes in 512 bytes, with total
  alias lart='ls -1cArt' # short, files from most to least recently modified
fi

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
alias cp='cp -i'
alias mv='mv -i'

# npm, node gobal list
alias ngl='npm list -g --depth=0'

# jobs list
alias jl='jobs -l'

# tmux 256 mode
alias tmux='tmux -2'

# for stow
alias stow-link="stow -d $HOME/.dotfiles/stow -t $HOME"
alias stow-unlink="stow -d $HOME/.dotfiles/stow -t $HOME -D"
# =============================================================================

# Version Managers
# =============================================================================

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Load RVM into a shell session *as a function*
# Note: RVM needs to load first
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# =============================================================================

# Check the window size after every command.
shopt -s checkwinsize

# PS1
PS1='\w $(if [ $? -eq 0 ]; then echo "\[\033[32m\]λ\[\033[0m\]"; else echo "\[\033[31m\]λ\[\033[0m\]"; fi) '

if [ -f ~/.dotfiles/bash/local.bash ]; then
  source ~/.dotfiles/bash/local.bash
fi
# PATH=$PATH:~/bin
# PATH=~/.linuxbrew/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# opencode
export PATH=/home/eric/.opencode/bin:$PATH
