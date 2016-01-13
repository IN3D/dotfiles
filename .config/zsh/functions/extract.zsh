# super-powered extractor. Fire and forget
extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2) tar xjf $1;;
      *.tar.gz) tar xzf $1;;
      *.bz2) bunzip2 $1;;
      *.rar) rar x $1;;
      *.gz) gunzip $1;;
      *.tar) tar xf $1;;
      *.tbz2) tar xjf $1;;
      *.tgz) tar xzf $1;;
      *.zip) unzip $1;;
      *.z) uncompress $1;;
      *.7z) 7z x $1;;
      *) echo "$1 doesn't match a known extraction method";;
    esac
  else
    echo "$1 isn't a file"
  fi
}
