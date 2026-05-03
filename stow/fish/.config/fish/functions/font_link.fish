function font_link --description "Symlinks fonts from the FontLibrary into user fc-cache directory"
  set -l fl $HOME/FontLibrary
  set -l fd $HOME/.fonts
  mkdir -p $fd
  for name in $argv
    set -l src $fl/$name
    if not test -d $src
      echo "font_link: not a directory: $src" >&2
      return 1
    end
    set -l dest $fd/$name
    if test -L $dest
      if test (readlink -f $dest) = (readlink -f $src)
        continue
      end
      rm $dest
    else if test -e $dest
      echo "font_link: $dest already exists and is not a symlink" >&2
      return 1
    end
    ln -s (readlink -f $src) $dest
  end
end
