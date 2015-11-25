# Exports
# =============================================================================
set -x config_dir "$HOME/GitHub/dot_files/.config/fish"

# A bunch of junk environmental variables for testing
set -x email_address 'junk@junk.com'
set -x PSQL_DEV 'aLocalPassword'
set -x gmail_username 'junk@junk.com'
set -x gmail_password 'junkPassword'
set -x DEV_KEY = 'abc12abc12abc12abc12abc12abc12abc12abc1233333333'
set -x PRD_KEY = 'abc12abc12abc12abc12abc12abc12abc12abc1233333333'
# =============================================================================


# Exports
# =============================================================================
if command -v brew > /dev/null 2>&1
  source "$config_dir/managers/brew.fish"
end
if command -v apt-get > /dev/null 2>&1
  source "$config_dir/managers/apt.fish"
end
if command -v zypper > /dev/null 2>&1
  source "$config_dir/managers/zypper.fish"
end
if command -v pacman > /dev/null 2>&1
  source "$config_dir/managers/pacman.fish"
end
if command -v dnf > /dev/null 2>&1
  alias yum dnf
  source "$config_dir/managers/yum.fish"
end
# =============================================================================


# PS1
# =============================================================================
set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_color_untrackedfiles yellow
set __fish_git_prompt_color_dirtystate red
set __fish_git_prompt_color_branch cyan
set __fish_git_prompt_color_cleanstate green
set __fish_git_prompt_color_stagedstate white
set __fish_git_prompt_color_upstream_ahead ffb90f
set __fish_git_prompt_color_upstream_behind blue
# =============================================================================


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

alias grep 'grep --color'
# Super grep
# Recursive: shows line numbers and headers, with 5 lines of context
alias sgrep 'grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'
alias t 'tail -f'

# for piping
alias L less
alias T tail

alias fd 'find . -type d -name'
alias ff 'find . -type f -name'

# directory shortcuts
alias API '~/MekManager/mekmanager_api'
alias CLIENT '~/MekManager/mekmanager_client'
alias FISH_DIR '~/.config/fish'
alias GITHUB '~/GitHub'

# editors
alias vi nvim
alias vim nvim
# =============================================================================
