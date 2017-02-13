" airline
set laststatus=2
set ttimeoutlen=0
set timeoutlen=300 " make sure that leader map pops up fast
let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#enabled=1
" Keep these here incase I want to go back quickly
" let g:airline_right_sep=''
" let g:airline_right_alt_sep=''
" let g:airline_left_sep=''
" let g:airline_left_alt_sep=''

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'c' : 'C',
      \ 'v' : 'V',
      \ 'V' : 'V',
      \ '' : 'V',
      \ 's' : 'S',
      \ 'S' : 'S',
      \ '' : 'S',
      \ }

" vim-ruby
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_rails=1
let g:rubycomplete_classes_in_global=1

" ctrl-p
let g:ctrlp_custom_ignore='node_modules\|bower_components\|DS_Store\|git'

" deoplete
let g:deoplete#enable_at_startup=1
let deoplete#tag#cache_limit_size = 100000000 " Day job is huge Rails app

let g:deoplete#sources={}
let g:deoplete#sources._ = ['buffer', 'tag']

let g:deoplete#omni_patterns={}

" no idea what this is supposed to do
" let g:deoplete#omni_patterns.elm = '[^ \t]+'
let g:deoplete#omni_patterns.elm = '\.'
"let g:elm_detailed_complete = 1

" editorconfig
let g:EditorConfig_exclude_patterns=['fugitive://.*']

" git gutter
let g:gitgutter_max_signs=9001

" indent guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" indent line
let g:indentLine_enabled=0
let g:indentLine_leadingSpaceEnabled=0
let g:indentLine_char='┆'
let g:indentLine_leadingSpaceChar='·'

" neomake
" let g:neomake_warning_sign = {
"   \ 'text': '⚠',
"   \ 'texthl': 'WarningMsg'
"   \}

" let g:neomake_error_sign = {
"   \ 'text': '✗',
"   \ 'texthl': 'ErrorMsg'
"   \}

" let g:neomake_javascript_enable_makers=['standard']
" autocmd! BufWritePost *.js Neomake standard

"  " \ 'buffer_output': 1, " not sure what this would be needed for
"  let g:neomake_elm_elmmake_maker = {
"    \ 'exe': 'elm-make',
"    \ 'errorformat':
"      \ '%E%.%#--\ %m\ -%# %f' . ',' .
"      \ '%C%l\\|' . ',' .
"      \ '%C%.%#'
"  \}
"  let g:neomake_elm_enabled_makers=['elmmake']

" autocmd! BufReadPost,BufWritePost *.elm Neomake elmmake

" syntastic
" NOTE: Legacy, I'm leaving this incase I ever come back to syntastic
let g:syntastic_ruby_checkers=['mri', 'rubocop']
let g:syntastic_always_populate_loc_list=1

" let g:syntastic_auto_loc_list=1
let g:syntastic_scala_checkers=['scalac', 'scalastyle']
let g:syntastic_javascript_checkers=['standard']
let g:syntastic_elm_checkers=['elm_make']
let g:syntastic_enable_balloons=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol='✗'
let g:syntastic_style_warning_symbol='⚠'
let g:elm_syntastic_show_warnings=1

" tasklist
let g:tlTokenList=['FIXME', 'TODO', 'XXX', 'HACK', 'BUG']

" ultisnips
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-l>'
let g:UltiSnipsJumpBackwardTrigger='<c-h>'
let g:UltiSnipsEnableSnipMate=0

" FZF
set rtp+=~/.fzf
let g:fzf_histor_dir='~/.fzf-history'

" Use ripgrep with fzf
command! -bang -nargs=* Rip call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --hidden --follow --glob "!.git/*" --glob "!plugged" '.shellescape(<q-args>), 1, <bang>0)

autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'right': '15%', 'options': '--reverse --margin 30%,0'})
autocmd VimEnter * command! Windows
  \ call fzf#vim#windows({'right': '30%', 'options': '--margin 30%,0'})
autocmd VimEnter * command! Buffers
  \ call fzf#vim#buffers({'right': '30%', 'options': '--margin 30%,0'})

" RainbowParenthesis
let g:rainbow#pairs=[['(', ')'], ['[', ']'], ['{', '}']]
