if command_exists zoxide
  zoxide init fish | source
  alias cd 'z'
end
