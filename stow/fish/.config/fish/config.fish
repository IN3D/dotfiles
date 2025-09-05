# vim: set foldmethod=marker:

# Aliases {{{
# ==============================================================================

# For older machines that may have exa available, but not eza
if command -v exa > /dev/null 2>&1; and not command -v eza > /dev/null 2>&1
  alias eza='exa'
end

# Prefer eza over ls if it's available
if command -v eza > /dev/null 2>&1
  alias l='eza -lh'
  alias ll='eza -lh'
  alias la='eza -lah'
  alias lt='eza -lh --sort=modified'
  alias lrt='eza -lh --sort=modified --reverse'
  alias ldot='eza -1 -lh --sort=size --reverse'
  alias lart='eza -1 -lah --sort=modified'
else
  alias ls 'ls -G'
  alias l 'ls -lFh'
  alias ll 'ls -lFh'
  alias la 'ls -lAFh'
  alias lt 'ls -ltFh'
  alias lrt 'ls -lrtFh'
  alias ldot 'ls -ld .*'
  alias lS 'ls -1lFSsh'
  alias lart 'ls -1FcArt'
end

# alias grep 'grep --color'
# Super grep
# Recursive: shows line numbers and headers, with 5 lines of context
alias sugrep 'grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'
alias t 'tail -f'

# for piping
alias L less
alias T tail

# editors
alias vi nvim

# jobs list
alias jl='jobs -l'

# for stow
alias stow-link="stow -d $HOME/.dotfiles/stow -t $HOME"
alias stow-unlink="stow -d $HOME/.dotfiles/stow -t $HOME -D"
# ========================================================================== }}}

# Tools
# ==============================================================================

# Enable fzf bindings and fuzzy completion
fzf --fish | source

# Use ctrl-t for command history correctly
export FZF_DEFAULT_COMMAND="command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"

export PATH="$HOME/.local/bin:$PATH"

# pager coloring
export PAGER="most"
export MANROFFOPT=-c

# setup asdf
if test -z $ASDF_DATA_DIR
  set _asdf_shims "$HOME/.asdf/shims"
else
  set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path because it
# potentiallly changes the order of items in PATH
if not contains $_asdf_shims $PATH
  set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

direnv hook fish | source
zoxide init fish | source
