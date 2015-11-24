alias h history 25
alias j jobs -l
alias la ls -aF
alias lf ls -FA
alias ll ls -lAF
alias vi nvim
alias vim nvim
alias ed nvim

set EDITOR nvim

set history = 1000
set savehist = (1000 merge)
set autolist = ambiguous
set autoexpand
set autorehash

if ( $?tcsh ) then
  bindkey "^W" backward-delete-word
endif

alias __git_current_branch 'git rev-parse --abbrev-ref HEAD >& /dev/null && echo "(`git rev-parse --abbrev-ref HEAD`)"'
alias precmd 'set prompt="%{\e[33m%}`whoami`%{\e[0m%} at %{\e[35m%}`hostname | cut -d . -f 1`%{\e[0m%} in %{\e[32m%}%/%{\e[0m%} `__git_current_branch`\n> "'
