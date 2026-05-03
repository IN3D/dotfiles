function __fish_complete_font_unlink --description 'Basenames of symlinks in ~/.fonts'
  set -l fd $HOME/.fonts
  test -d $fd || return
  for p in $fd/*
    test -L $p && path basename $p
  end
end

complete -c font_unlink -f -d 'Remove ~/.fonts symlink for a FontLibrary dir' -a '(__fish_complete_font_unlink)'
