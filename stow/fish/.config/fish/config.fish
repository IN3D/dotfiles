# vim: set foldmethod=marker:

# Aliases {{{
# ==============================================================================

# For older machines that may have exa available, but not eza
if command_exists exa; and not command_exists eza
  alias eza='exa'
end

# Prefer eza over ls if it's available
if command_exists eza
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

# Super grep: ripgrep when installed, else grep -R (same idea: -n -H -C 5, skip VCS dirs)
if command_exists rg
  function sugrep
    rg -C 5 -H --hidden \
      --glob '!**/.git/**' --glob '!**/.svn/**' --glob '!**/CVS/**' \
      $argv
  end
else
  alias sugrep 'grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'
end

alias t 'tail -f'

# TODO: need to track down why this keeps happening
# No clear cause as to why, but waybar will crash on occasion. Causing the bar
# to disappear. This ensures that anything associate with the process is fully
# terminated. Then starts it in a way that it isn't tied to the terminal session
# that runs the command
alias restart-waybar="killall waybar; nohup waybar &"

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

# Add local binaries to path
export PATH="$HOME/.local/bin:$PATH"

# Source machine-specific config if available
if test -f $HOME/.config/fish/local.fish
  source $HOME/.config/fish/local.fish
end

# Enable fzf bindings and fuzzy completion
if command_exists fzf
  fzf --fish | source

  # Use ctrl-t for command history correctly
  export FZF_DEFAULT_COMMAND="command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
end

# setup asdf
if test -z $ASDF_DATA_DIR
  set _asdf_shims "$HOME/.asdf/shims"
else
  set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
  set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

if command_exists direnv
  direnv hook fish | source
end

if command_exists zoxide
  zoxide init fish | source
  alias cd 'z'
end

if command_exists thefuck
  thefuck --alias | source
end

if test -d "$HOME/.opencode/bin"
  fish_add_path "$HOME/.opencode/bin"
end
