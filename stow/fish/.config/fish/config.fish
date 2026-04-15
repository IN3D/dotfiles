# file is in version control so safe to source without a check
source $HOME/.config/fish/aliases.fish

# Add local binaries to path
set -gx PATH "$HOME/.local/bin:$PATH"

if command_exists nvim
  set -gx EDITOR nvim
else if command_exists vim
  set -gx EDITOR vim
end

# Source machine-specific config if available
if test -f $HOME/.config/fish/local.fish
  source $HOME/.config/fish/local.fish
end
