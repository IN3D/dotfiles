# file is in version control so safe to source without a check
source $HOME/.config/fish/aliases.fish

# Add local binaries to path
export PATH="$HOME/.local/bin:$PATH"

# Source machine-specific config if available
if test -f $HOME/.config/fish/local.fish
  source $HOME/.config/fish/local.fish
end
