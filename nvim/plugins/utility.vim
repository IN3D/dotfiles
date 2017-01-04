" -----------------------------------------------------------------------------
" Plugins that add new, or expand upon existing functionality in vim.
" -----------------------------------------------------------------------------
if exists('g:installing_plugins')
  let g:fzf_install = 'yes | ./install'
  " Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'godlygeek/tabular'
  Plug 'SirVer/ultisnips'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['clojure', 'scheme', 'lisp', 'ruby'] }
  Plug 'junegunn/fzf.vim' ", { 'do': g:fzf_install }
  Plug 'mbbill/undotree'
  Plug 'easymotion/vim-easymotion'
  Plug 'mhinz/vim-startify'
  Plug 'troydm/easybuffer.vim'
  Plug 'mattn/emmet-vim'
  Plug 'vim-scripts/TaskList.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sk1418/Join'
  Plug 'kballenegger/vim-autoreadwatch'
  Plug 'mtth/scratch.vim'
  Plug 'wakatime/vim-wakatime'
  Plug 'Shougo/deoplete.nvim'
  Plug 'fishbullet/deoplete-ruby'
  Plug 'carlitux/deoplete-ternjs'
  Plug 'mhartington/deoplete-typescript'
  Plug 'vhakulinen/neovim-intellij-complete-deoplete'
  Plug 'junegunn/vim-journal'
  Plug 'neomake/neomake'
  Plug 'majutsushi/tagbar'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'Shougo/Denite.nvim'
  Plug 'Shougo/Unite.vim'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  " NOTE: devicons must come last
  Plug 'ryanoasis/vim-devicons'
  Plug 'prendradjaja/vim-vertigo'
  finish
endif
