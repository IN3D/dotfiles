" =============================================================================
" Who: Eric Hopkins <eric.on.tech@gmail.com>
" What: vim configuration, main file.
" Version: 2.0
" =============================================================================

" run vundle installations
source ~/.vim/vundle.vim

" Autodetect file types (need to turn back on after vundle run)
filetype plugin indent on

source ~/.vim/base_config.vim   " Base, user level configuration
source ~/.vim/mappings.vim      " remapping of vim functionalities
source ~/.vim/plugin_config.vim " Configuration specific to plugins

" load settings specific to an environment, if there are any
if !empty(glob('~/.vim/local.vim'))
  source ~/.vim/local.vim
endif
