" vim: fdm=marker:

" =========================== Rails Bindings ============================= {{{1
" ========== Projects ========== {{{2
" find a model
nnoremap <buffer><silent><localleader>pm :GFiles<CR>^app/models/
" find a controller
nnoremap <buffer><silent><localleader>pc :GFiles<CR>^app/controllers/
" find views
nnoremap <buffer><silent><localleader>pv :GFiles<CR>^app/views/
" }}}2

" ========== Go To ========== {{{2
nnoremap <buffer><silent><localleader>gtm :Emodel<CR>
nnoremap <buffer><silent><localleader>gtc :Econtroller<CR>
" }}}2
" }}}1

" =========================== General Ruby =============================== {{{1
" change double quotes to single quote
nnoremap <buffer><silent><localleader>" cs"'
" same, but for insert mode
inoremap <buffer><C-x><C-s> <C-o>cs"'
" change single quotes to double quotes
nnoremap <buffer><silent><localleader>' cs'"
" same, but for insert mode
inoremap <buffer><C-x><C-d> <C-o>cs'"

" run rspec on the current file
nnoremap <buffer><silent><localleader>tt :Dispatch rspec %
" }}}1
