syntax on
set shell=/bin/bash
set rnu nu
set title
set autoindent
set copyindent
set ts=2 sts=2 sw=2 et
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

" Configure to primarily use utf8
if has("multi_byte")
  if &termencoding == ""|let &termencoding = &encoding|endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
endif

" listchar settings
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
