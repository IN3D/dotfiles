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

" neovim mappings
" sane terminal escape
tnoremap <Esc> <C-\><C-n>
tnoremap <C-[> <C-\><C-n>

" --------------------
"  Leader Mappings
" --------------------

" Clear search
noremap <silent><leader>/ :nohls<CR>

" -----------
" Toggles
" -----------

" --------
" General
" --------
nnoremap <silent><leader>ts :set spell!<CR>
nnoremap <silent><leader>tl :set list!<CR>

" --------
" Plugins
" --------

" Fugitive
nnoremap <silent><leader>tgb :Gblame<CR>
nnoremap <silent><leader>tgs :Gstatus<CR>
nnoremap <silent><leader>tgd :Gdiff<CR>

" Goyo
nnoremap <silent><leader>tzen :Goyo<CR>

" NERDTree
nnoremap <silent><leader>tnt :NERDTreeToggle<CR>

" Rainbow
nnoremap <silent><leader>trb :RainbowToggle<CR>

" Tagbar
nnoremap <silent><leader>ttb :TagbarToggle<CR>

" Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Undotree
nnoremap <silent><leader>tut :UndotreeToggle<CR>


" T: Toggle
command Ts set spell!
command Tl set list!
command Tgb Gblame
command Tgs Gstatus
command Tgd Gdiff
command Trb RainbowParenthesesToggle
command Tut UndotreeToggle
command Tgo Goyo
command Tnt NERDTreeToggle
command Tbt TagbarToggle
