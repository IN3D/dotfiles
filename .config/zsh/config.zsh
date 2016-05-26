# Autoload
# =============================================================================
autoload -U colors && colors
autoload -Uz compinit
compinit
# =============================================================================

# Exports
# =============================================================================
export config_dir="$HOME/GitHub/dot_files/.config/zsh"
export EDITOR=nvim
export TERM="xterm-256color"
export GOPATH="$HOME/Code"
export GOBIN="$GOPATH/bin"
export PATH=$GOPATH:$GOBIN:$PATH

# junk environmental variables
export email_address='junk@junk.com'
export PSQL_DEV='aLocalPassword'
export gmail_username='junk@junk.com'
export gmail_password='junkPassword'
export DEV_KEY='abc123abc123abc123abc123abc123abc123abc123abc123122333333'
export PRD_KEY='abc123abc123abc123abc123abc123abc123abc123abc123122333333'
export JWT_KEY='superSecretKey'
# =============================================================================

# Variables
# =============================================================================
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
osname=`uname`
# =============================================================================


# Variables
# =============================================================================
# OS X
if command -v brew >/dev/null 2>&1; then
  source "$config_dir/managers/brew.zsh"
  if [ -f "$(brew --prefix nvm)/nvm.sh" ]; then
    source $(brew --prefix nvm)/nvm.sh
  fi
fi

# Debian & Ubuntu
if command -v apt-get >/dev/null 2>&1; then
  source "$config_dir/managers/apt.zsh"
fi

# Arch
if command -v pacman >/dev/null 2>&1; then
  source "$config_dir/managers/pacman.zsh"
fi

# Suse
if command -v zypper >/dev/null 2>&1; then
  source "$config_dir/managers/zypper.zsh"
fi

# Red Hats
if command -v dnf >/dev/null 2>&1; then
  alias yum=dnf
  source "$config_dir/managers/yum.zsh"
fi
# =============================================================================

# Functions
# =============================================================================
if [ -d "$config_dir/functions" ]; then
  for f in ~/GitHub/dot_files/.config/zsh/functions/*; do
    source $f
  done
else
  echo 'no zsh funtions directory'
fi
# =============================================================================

# Aliases
# =============================================================================
if [ `uname` = "Darwin" ] || [ `uname` = "FreeBSD" ]; then
  alias ls='ls -G' # ls color mode (unix)
else
  alias ls='ls --color' # ls color mode (linux)
fi

alias l='ls -lFh' # long list, directoriew with trailing slash, better sizes
alias ll='ls -lFh' # "
alias la='ls -lAFh' # list all, except ./ and ../
alias lt='ls -ltFh' # list by time
alias lrt='ls -lrtFh' # list by time, reversed
alias ldot='ls -ld .*' # list dot files
alias lart='ls -1FcArt' # short, files from most to least recently modified

# editor
alias vim=nvim
alias vi=nvim
alias ed=nvim

alias grep='grep --color'
# Super grep
# Recursive: shows line numbers and headers, with 5 lines of context
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'

# head/tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L='| less'
alias -g NE='2> /dev/null'

# finding things
alias fd='find . -type d -name' # find directory
alias ff='find . -type f -name' # find file

# npm
# npm global list: list all global npm modules, without showing dependency tree
alias ngl='npm list -g --depth=0'

# jobs
alias jl='jobs -l'

# tmux
alias tmux='tmux -2' # 256 mode
# =============================================================================

# PS1
# =============================================================================
if [ -f ~/GitHub/zsh-git-prompt/zshrc.sh ]; then
  source ~/GitHub/zsh-git-prompt/zshrc.sh
PROMPT='%F{yellow}$(whoami)%f at %F{magenta}$(hostname | cut -d . -f 1)%f in %F{green}%~%f $(git_super_status)
$fg_bold[red]λ$reset_color '
else
PROMPT='%F{yellow}$(whoami)%f at %F{magenta}$(hostname | cut -d . -f 1)%f in %F{green}%~%f
λ '
fi
# =============================================================================

# Version Managers
# =============================================================================
# Load RVM
# Note: this must come first

if [ -d "$HOME/.rvm" ]; then
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi

if [ -d "$HOME/.plenv" ]; then
  export PATH="$HOME/.plenv/bin:$PATH"
  eval "$(plenv init -)"
fi

if [ -d "$HOME/.linuxbrew" ]; then
  export PATH="$HOME/.linuxbrew/bin:$PATH"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# =============================================================================
