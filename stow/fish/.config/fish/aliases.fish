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

alias t 'tail -f'

# for piping
alias L less
alias T tail

# editors
alias vi nvim

# jobs list
alias jl='jobs -l'
