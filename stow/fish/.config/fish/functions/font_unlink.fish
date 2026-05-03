function font_unlink --description "Removes symlinks from the user fc-cache directory"
  set -l fl $HOME/FontLibrary
  for name in $argv
    set -l expected $fl/$name
    set -l dest $HOME/.fonts/$name
    if not test -L $dest
      echo "font_unlink: not a symlink: $dest" >&2
      return 1
    end
    if test (readlink -f $dest) != (readlink -f $expected)
      echo "font_unlink: $dest does not point to FontLibrary/$name" >&2
      return 1
    end
    rm $dest
  end
end
