syntax on
set shell=bash
" disabled to avoid redrawing all the damn time
" set rnu nu
set title
set autoindent
set smarttab
set ts=2
set sts=2
set sw=2
set et
set linebreak
set bg=dark
set lazyredraw
" make absolutely, positively sure I have 'sane backspace'
set backspace=2
set backspace=indent,eol,start

" avoid performance issues when trying to color long lines
set synmaxcol=200

" remove 'beep repeatedly' mode
set novisualbell
set noerrorbells
set vb t_vb=

" NeoVim true color mode
if has('nvim')
  " this is depreciated now in some versions?
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  set termguicolors
endif

" always show the tab bar
set showtabline=2

" Configure to primarily use utf8
if has("multi_byte")
  if &termencoding == ""|let &termencoding = &encoding|endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
endif

" listchar settings
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
