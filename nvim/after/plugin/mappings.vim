" Un-map a shit ton of plugins
" your mappings are bad and you should feel bad
" ========================================
unmap <silent><leader>t
"unmap <silent><leader>u " thought I needed this at some point?
unmap <silent><leader>hp
unmap <silent><leader>hr
unmap <silent><leader>hs
unmap <silent><leader>hu


" Mappings
" Top level mappings
noremap <silent><leader>/ :nohls<CR>

" Align
vmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a> :Tabularize/=><CR>

" Toggles
nnoremap <silent><leader>tl :set list!<CR>
nnoremap <silent><leader>tn :NERDTreeToggle<CR>
nnoremap <silent><leader>ts :set spell!<CR>
nnoremap <silent><leader>tu :UndotreeToggle<CR>

" Fugitive (i.e. Git)
nnoremap <silent><leader>ga :Gwrite<CR>
nnoremap <silent><leader>gb :Gblame<CR>
nnoremap <silent><leader>gd :Gdiff<CR>
nnoremap <silent><leader>gp :Gpush<CR>
nnoremap <silent><leader>gs :Gstatus<CR>

" Easymotion
" I'd like to get this so it's <leader><leader>t
nmap <silent><leader><leader>t <Plug>(easymotion-t2)
