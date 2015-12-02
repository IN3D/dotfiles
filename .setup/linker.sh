if [ -e ~/.bashrc ]; then
  mv ~/.bashrc ~/.bashrc.old
fi
ln -s ~/GitHub/dot_files/.config/bash/config.bash ~/.bashrc


if [ -e ~/.bash_profile ]; then
  mv ~/.bash_profile ~/.bash_profile.old
fi
ln -s ~/GitHub/dot_files/.config/bash/config.bash ~/.bash_profile


if [ -e ~/.cshrc ]; then
  mv ~/.cshrc ~/.cshrc.old
fi
ln -s ~/GitHub/dot_files/.config/csh/config.csh ~/.cshrc


if [ -e ~/.tcshrc ]; then
  mv ~/.tcshrc ~/.tcshrc.old
fi
ln -s ~/GitHub/dot_files/.config/csh/config.csh ~/.tcshrc


if [ -e ~/.gitconfig ]; then
  mv ~/.gitconfig ~/.gitconfig.old
fi
ln -s ~/GitHub/dot_files/.gitconfig ~/.gitconfig


if [ -e ~/.vim ]; then
  mv ~/.vim ~/.vim.old
fi
ln -s ~/GitHub/dot_files/.config/nvim ~/.vim


if [ -e ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.old
fi
ln -s ~/GitHub/dot_files/.config/nvim/init.vim ~/.vimrc


if [ -e ~/.nvim ]; then
  mv ~/.nvim ~/.nvim.old
fi
ln -s ~/GitHub/dot_files/.config/nvim ~/.nvim


if [ -e ~/.nvimrc ]; then
  mv ~/.nvimrc ~/.nvimrc.old
fi
ln -s ~/GitHub/dot_files/.config/nvim/init.vim ~/.nvimrc


if [ -e ~/.nvimrc ]; then
  mv ~/.spacemacs ~/.spacemacs.old
fi
ln -s ~/GitHub/dot_files/.config/emacs/space.el ~/.spacemacs


if [ -e ~/.nvimrc ]; then
  mv ~/.inputrc ~/.inputrc.old
fi
ln -s ~/GitHub/dot_files/.inputrc ~/.inputrc
