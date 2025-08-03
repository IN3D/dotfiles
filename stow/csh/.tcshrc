alias h history 25
alias j jobs -l
alias ls ls -G
alias la ls -aF
alias lf ls -FA
alias ll ls -lAF
alias tmux tmux -2

set EDITOR vim

set history = 1000
set savehist = (1000 merge)
set autolist = ambiguous
set autoexpand
set autorehash

if ( $?tcsh ) then
  bindkey "^W" backward-delete-word
endif

alias precmd 'set prompt="%~ %{\e[`if ($status == 0) echo "32"; if ($status != 0) echo "31"`m%}λ%{\e[0m%} "'
