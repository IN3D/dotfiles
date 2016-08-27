" --------------------------------------------------------------------------------
" Mappings
" --------------------------------------------------------------------------------

" --------------------
"  General Mappings
" --------------------

" set leader key to space, Spacemacs has the right idea
let mapleader=' '

" select everything
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

" normal mode newlines
nnoremap go o<ESC>k
nnoremap gO O<ESC>j

" jump through larger amounts of text
nnoremap <C-j> 15gjzz
nnoremap <C-k> 15gkzz
vnoremap <C-j> 15gjzz
vnoremap <C-k> 15gkzz

"nnoremap <C-f> :Files<CR>
"vnoremap <C-f> :Files<CR>
nnoremap <C-f> :GFiles<CR>
vnoremap <C-f> :GFiles<CR>

" neovim mappings
" sane terminal escape
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-[> <C-\><C-n>
endif

" NOTE: check ./after/plugin/ for mappings. They were moved here so that my
" mappings didn't have to compete with mappings from other plugins that I'm
" using.
