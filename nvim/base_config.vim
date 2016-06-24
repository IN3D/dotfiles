syntax on
set shell=bash
set rnu nu
set title
set autoindent
set smarttab
set ts=2
set sts=2
set sw=2
set et
set linebreak
set background=dark
set lazyredraw
" make absolutely, positively sure I have 'sane backspace'
set backspace=2
set backspace=indent,eol,start

" remove 'beep repeatedly' mode
set novisualbell
set noerrorbells
set vb t_vb=

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
