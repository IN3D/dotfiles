" vim: fdm=marker:
"
" --------------------------------------------------------------------------------
" Mappings
" --------------------------------------------------------------------------------

" ===== General Mappings ===== {{{

" set leader key to space, Spacemacs has the right idea
let mapleader=' '
let maplocalleader=','

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
nnoremap <C-b> :Buffers<CR>
vnoremap <C-b> :Buffers<CR>

unmap <C-r>
nnoremap <C-r> :Rip<CR>

" neovim mappings
" sane terminal escape
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-[> <C-\><C-n>
endif

" deoplete
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"
" }}}

" ====== Emacs bindings ====== {{{

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

imap <C-x><C-s> <C-o>:w<CR>
" not stricty the same thing, but equivilent to my workflow
" Rather than opening up a file find, open up the vinegar menu
imap <C-x><C-f> <C-o>-<ESC>

" delete a word forward
imap <M-d> <C-o>e<C-o>diw
imap <M--><M-d> <C-w>

imap <M-BS> <C-w>

imap <M-f> <C-o>e<Right>
" this doesn't work??? (TODO: figure out why)
imap <M-b> <C-o>b
" isn't actually emacs but feels natural-ish
imap <M-z> <C-o>b

" }}}

" NOTE: check ./after/plugin/ for mappings. They were moved here so that my
" mappings didn't have to compete with mappings from other plugins that I'm
" using.
