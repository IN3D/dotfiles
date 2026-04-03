# Enable fzf bindings and fuzzy completion
if command_exists fzf
  fzf --fish | source

  # Use ctrl-t for command history correctly
  export FZF_DEFAULT_COMMAND="command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
end
