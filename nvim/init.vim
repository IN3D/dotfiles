" vim: fdm=marker:
" =============================================================================
" Who: Eric Hopkins <eric.on.tech@gmail.com>
" What: Vim configuration, main file.
" Version: 3.0
" =============================================================================

" === Initialize === {{{
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-scripts/nginx.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'

call plug#end()

filetype plugin indent on

" If there's something that needs to be specifically run on an OS then it can
" be run in here.
if !empty(glob('~/.vim/local.vim'))
  source ~/.vim/local.vim
endif

colo gruvbox
" }}}

" === Base Config === {{{
syntax on
set shell=bash " probably don't need this now
set autoindent
set smarttab
set ts=2 sts=2 sw=2 et
set linebreak
set bg=dark

" 'sane backspace'
set backspace=2
set backspace=indent,eol,start
" don't color all of super-long lines
set synmaxcol=200

" remove 'beep repeatedly' mode
set novisualbell
set noerrorbells

if has('nvim')
  set termguicolors
endif

" Use utf8 when available
if has('multi_byte')
  if &termencoding == ""|let &termencoding = &encoding|endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
endif

set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
" }}}

" === Mappings === {{{
let mapleader=' '
nnoremap vy ggVG

" unmap the manual and suspend function
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

" sensible
noremap H ^
noremap L $
noremap J G
noremap K gg
nnoremap U <C-r>

" jump through larger amounts of text
nnoremap <C-j> 15gjzz
nnoremap <C-k> 15gkzz
vnoremap <C-j> 15gjzz
vnoremap <C-k> 15gkzz

" sane terminal escape
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-[> <C-\><C-n>
endif

" insert mode
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>^
imap <C-e> <C-o>$
imap <C-n> <Down>
imap <C-p> <Up>

imap <C-g> <ESC>

" add a newline above the current line
imap <C-m> <C-o>O

imap <M-BS> <C-w>

imap <M-f> <C-o>e<Right>
" this doesn't work??? (TODO: figure out why)
imap <M-b> <C-o>b
" isn't actually emacs but feels natural-ish
imap <M-z> <C-o>b

noremap <silent><leader>/ :nohls<CR>
" }}}
