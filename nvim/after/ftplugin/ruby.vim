" =========================== Rails Bindings ==================================
" ========== Projects ==========
" find a model
nnoremap <buffer><silent><localleader>pm :GFiles<CR>^app/models/
" find a controller
nnoremap <buffer><silent><localleader>pc :GFiles<CR>^app/controllers/
" find views
nnoremap <buffer><silent><localleader>pv :GFiles<CR>^app/views/

" ========== Go To ==========
nnoremap <buffer><silent><localleader>gtm :Emodel<CR>
nnoremap <buffer><silent><localleader>gtc :Econtroller<CR>
