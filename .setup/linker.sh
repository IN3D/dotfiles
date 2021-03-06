echo "Linking things up..."

if [ ! -d ~/.old ]; then
  mkdir ~/.old
  echo "Made ~/.old/ directory"
fi


if [ `uname` == "Darwin" ]; then
  if [ -e ~/.bash_profile ]; then
    mv ~/.bash_profile ~/.old/.bash_profile
    echo "Moved .bash_profile into ~/.old/"
  fi

  ln -s ~/.config/bash/config.bash ~/.bash_profile
  echo "Linked up new .bash_profile"
else
  if [ -e ~/.bashrc ]; then
    mv ~/.bashrc ~/.old/.bashrc
    echo "Moved .bashrc into ~/.old/"
  fi

  ln -s ~/.config/bash/config.bash ~/.bashrc
  echo "Linked up new .bashrc"
fi

if [ -e ~/.cshrc ]; then
  mv ~/.cshrc ~/.old/.cshrc
  echo "Moved .cshrc into ~/.old/"
fi
ln -s ~/.config/csh/config.csh ~/.cshrc
echo "Linked up new .cshrc"


if [ -e ~/.tcshrc ]; then
  mv ~/.tcshrc ~/.old/.tcshrc
  echo "Moved .tcshrc into ~/.old/"
fi
ln -s ~/.config/csh/config.csh ~/.tcshrc
echo "Linked up new .tcshrc"


if [ -e ~/.zshrc ]; then
  mv ~/.zshrc ~/.old/.zshrc
  echo "Moved .zshrc into ~/.old/"
fi
ln -s ~/.config/zsh/config.zsh ~/.zshrc
echo "Linked up new .zshrc"


if [ -e ~/.gitconfig ]; then
  mv ~/.gitconfig ~/.old/.gitconfig
  echo "Moved .gitconfig into ~/.old/"
fi
ln -s ~/.config/.gitconfig ~/.gitconfig
echo "Linked up new .gitconfig"


if [ -d ~/.vim ]; then
  mv ~/.vim ~/.old/.vim
  echo "Moved .vim/ into ~/.old/"
fi
ln -s ~/.config/nvim ~/.vim
echo "Linked up new .vim/"


if [ -e ~/.vimrc ]; then
  mv ~/.vimrc ~/.old/.vimrc
  echo "Moved .vimrc/ into ~/.old/"
fi
ln -s ~/.config/nvim/init.vim ~/.vimrc
echo "Linked up new .vimrc"

if [ -e ~/.emacs.d ]; then
  mv ~/.emacs.d ~/.old/.emacs.d
  echo "Moved .emacs.d/ into ~/.old/"
fi
ln -s ~/.config/emacs ~/.emacs.d
echo "Linked up new .emacs.d/"

if [ -e ~/.xmonad ]; then
  mv ~/.xmonad ~/.old/.xmonad
  echo "Moved .xmonad/ into ~/.old/"
fi
ln -s ~/.config/xmonad ~/.xmonad
echo "Linked up new .xmonad/"

# For nvim < 0.1.x
if [ -e ~/.nvim ]; then
  mv ~/.nvim ~/.old/.nvim
  echo "Moved .nvim/ into ~/.old/"
fi
ln -s ~/.config/nvim ~/.nvim
echo "Linked up new .nvim/"


# For nvim < 0.1.x
if [ -e ~/.nvimrc ]; then
  mv ~/.nvimrc ~/.old/.nvimrc
  echo "Moved .nvimrc/ into ~/.old/"
fi
ln -s ~/.config/nvim/init.vim ~/.nvimrc
echo "Linked up new .nvimrc"


# My emacs config will make a return at some point
# if [ -e ~/.spacemacs ]; then
#   mv ~/.spacemacs ~/.old/.spacemacs
#   echo "Moved .spacemacs into ~/.old/"
# fi
# ln -s ~/.config/emacs/space.el ~/.spacemacs
# echo "Linked up new .spacemacs"


if [ -e ~/.inputrc ]; then
  mv ~/.inputrc ~/.old/.inputrc
  echo "Moved .inputrc into ~/.old/"
fi
ln -s ~/.config/inputrc ~/.inputrc
echo "Linked up new .inputrc"


if [ -e ~/.tmux.conf ]; then
  mv ~/.tmux.conf ~/.tmux.conf.old
  echo "Moved .tmux.conf into ~/.old/"
fi
ln -s ~/.config/tmux.conf ~/.tmux.conf
echo "Linked up new .tmux.conf"
