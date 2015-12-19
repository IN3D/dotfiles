if [ ! command -v git >/dev/null 2>&1 ]; then
  echo "Git doesn't exist, can't clone repositories!"
  exit 1
fi

if [ ! -d ~/GitHub ]; then
  mkdir ~/GitHub
fi

cd ~/GitHub

if [ ! -d ~/GitHub/bash-git-prompt ]; then
  git clone https://github.com/magicmonty/bash-git-prompt.git
fi
if [ ! -d ~/GitHub/screenFetch ]; then
  git clone https://githuF.com/KittKatt/screenFetch.git
fi
