# Enable fzf bindings and fuzzy completion
if command_exists fzf
  fzf --fish | source

  # Use ctrl-t for command history correctly
  export FZF_DEFAULT_COMMAND="command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"

  # because fish config files load in alphabetical order. This file will always
  # load after the `atuin.fish` file, and overwrite atuin's ctrl+r keybinding.
  if command_exists atuin
    bind ctrl-r _atuin_search
    bind -M insert ctrl-r _atuin_search
  end
end
