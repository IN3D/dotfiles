" airline
set laststatus=2
set ttimeoutlen=50
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_left_sep=''
let g:airline_left_alt_sep=''

" ctrl-p
let g:ctrlp_custom_ignore='node_modules\|bower_components\|DS_Store\|git'

" git gutter
let g:gitgutter_max_signs=9001

" indent guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" indent line
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_char = '┆'
let g:indentLine_leadingSpaceChar = '·'

" syntastic
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='☠'
let g:syntastic_warning_symbol='☣'
let g:syntastic_style_error_symbol='✗'
let g:syntastic_style_warning_symbol='⚠'

" ultisnips
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-l>'
let g:UltiSnipsJumpBackwardTrigger='<c-h>'
let g:UltiSnipsEnableSnipMate = 0
