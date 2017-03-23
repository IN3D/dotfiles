" Un-map a shit ton of plugins
" your mappings are bad and you should feel bad
" ==========================================
" unmap <silent><leader>t
" unmap <silent><leader>u " thought I needed this at some point?
" unmap <silent><leader>gc
" unmap <silent><leader>hp
" unmap <silent><leader>hr
" unmap <silent><leader>hs
" unmap <silent><leader>hu

" ######### Kill Your Leaders ##########
" Redirects the output of the 'map <leader>' call to a string variable called
" This is still very much in progress, need to do a lot more work.
" mappings.
:redir => mappings
:silent map <leader>
:redir END

for m in split(mappings, "\n")
  if !(m ==? "No mapping found")
    let filtered = substitute(m, '^n\|v\s*\|\s*\(.\{-}\)\s*$', '\1', '')
    let leader_binding = split(filtered, ' ')[0]
    " NOTE: unmap is a bit dangerous here. It will wipe out *all* mappings
    " for any mode, so if there is:
    " n <leader>l
    " v <leader>l
    " it will unmap both, on the first call, and the subsequent call will
    " fail.
    :redir => raw_still_mapped
    :silent map leader_binding
    :redir END
    " remove leading newline, trailing whitespace
    let still_mapped = substitute(raw_still_mapped, '^\n*\(.\{-}\)\s*$', '\1', '')
    " This feels sub-optimal, kind of just a quick fix for the moment.
    if !(still_mapped ==? "No mapping found")
      execute "unmap <silent>" . leader_binding
    endif
  endif
endfor
" ######### Kill Your Leaders ##########

" Mappings
" Top level mappings
noremap <silent><leader>/ :nohls<CR>

" Align
vmap <Leader>a= :Tabularize/=<CR>
vmap <Leader>a: :Tabularize/\w\+: \zs<CR>
vmap <Leader>a> :Tabularize/=><CR>

" Toggles
nnoremap <silent><leader>tb :EasyBuffer<CR>
nnoremap <silent><leader>tl :set list!<CR>
nnoremap <silent><leader>tn :NERDTreeToggle<CR>
nnoremap <silent><leader>ts :set spell!<CR>
nnoremap <silent><leader>tu :UndotreeToggle<CR>

" Fugitive (i.e. Git)
nnoremap <silent><leader>ga :Gwrite<CR>
nnoremap <silent><leader>gb :Gblame<CR>
nnoremap <silent><leader>gc :Gcommit<CR>
nnoremap <silent><leader>gd :Gdiff<CR>
nnoremap <silent><leader>gp :Gpush<CR>
nnoremap <silent><leader>gs :Gstatus<CR>

" Projects
nnoremap <silent><leader>pf :GFiles<CR>

" buffers
nnoremap <silent><leader>bb :Buffers<CR>

" Searching
nnoremap <silent><leader>ss :Swoop<CR>
nnoremap <silent><leader>sgr :Rip<CR>

" Easymotion
map <leader><leader> <Plug>(easymotion-prefix)
nmap <leader><leader>t <Plug>(easymotion-s2)

" rainbow parenthesis
" this doesn't work either, but it doesn't throw an error at least
autocmd VimEnter * command! RainbowParenthesis
" augroup rainbow_lisp
"   autocmd!
"   autocmd FileType lisp,clojure,scheme RainbowParenthesis
" augroup END
