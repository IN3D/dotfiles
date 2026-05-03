function __fish_complete_font_link --description 'Basenames of dirs in ~/FontLibrary'
  set -l fl $HOME/FontLibrary
  test -d $fl || return
  for p in $fl/*
    test -d $p && path basename $p
  end
end

complete -c font_link -f -d 'Symlink FontLibrary dir into ~/.fonts' -a '(__fish_complete_font_link)'
