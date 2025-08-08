# Aliases
# =============================================================================
alias ls 'ls -G'
alias l 'ls -lFh'
alias ll 'ls -lFh'
alias la 'ls -lAFh'
alias lt 'ls -ltFh'
alias lrt 'ls -lrtFh'
alias ldot 'ls -ld .*'
alias lS 'ls -1lFSsh'
alias lart 'ls -1FcArt'

# alias grep 'grep --color'
# Super grep
# Recursive: shows line numbers and headers, with 5 lines of context
alias sugrep 'grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'
alias t 'tail -f'

# for piping
alias L less
alias T tail

alias fd 'find . -type d -name'
alias ff 'find . -type f -name'

# editors
alias vi nvim
alias vim nvim
# =============================================================================
