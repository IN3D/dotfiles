" Un-map a shit ton of plugins
" your mappings are bad and you should feel bad
" ========================================
unmap <silent><leader>t
unmap <silent><leader>ta
unmap <silent><leader>tc
unmap <silent><leader>tH
unmap <silent><leader>tJ
unmap <silent><leader>tK
unmap <silent><leader>tL
unmap <silent><leader>tRC
unmap <silent><leader>tRL
unmap <silent><leader>tRR
unmap <silent><leader>tr
unmap <silent><leader>tS
"unmap <silent><leader>u " thought I needed this at some point?
unmap <silent><leader>nr
unmap <silent><leader>hp
unmap <silent><leader>hr
unmap <silent><leader>hs
unmap <silent><leader>hu

let g:lmap = {}

" Bindings
let g:lmap.a = { 'name' : 'Align' }
let g:lmap.a['='] = ['/=', 'On "="']
let g:lmap.a[':'] = ['/:\zs', 'On ":"']
let g:lmap.a['>'] = ['/=>', 'On "=>"']

let g:lmap.g = { 'name' : 'Git' }
let g:lmap.g.a = [':Gwrite', 'Add']
let g:lmap.g.b = [':Gblame', 'Blame']
let g:lmap.g.d = [':Gdiff', 'Diff']
let g:lmap.g.p = [':Gpush', 'Push']
let g:lmap.g.s = [':Gstatus', 'Status']

let g:lmap.t = { 'name' : 'Toggle' }
let g:lmap.t.l = [':set list!', 'List characters']
let g:lmap.t.n = [':NERDTreeToggle', 'NerdTree']
let g:lmap.t.s = [':set spell!', 'Spell checking']
let g:lmap.t.t = [':TagbarToggle', 'Tagbar']
let g:lmap.t.u = [':UndotreeToggle', 'UndoTree']
let g:lmap.t.z = [':Goyo', 'Zen/Goyo mode']
let g:lmap['/'] = [':nohls', 'Clear highlighting']
let g:lmap[' '] = ['', 'EasyMotion leader']


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
nnoremap <silent><leader>tz :Goyo<CR>

" Fugitive (i.e. Git)
nnoremap <silent><leader>ga :Gwrite<CR>
nnoremap <silent><leader>gb :Gblame<CR>
nnoremap <silent><leader>gd :Gdiff<CR>
nnoremap <silent><leader>gp :Gpush<CR>
nnoremap <silent><leader>gs :Gstatus<CR>


" Setup LeaderMap
call leaderGuide#register_prefix_descriptions(' ', 'g:lmap')
nnoremap <silent><leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent><leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

" Easymotion
" I'd like to get this so it's <leader><leader>t
nmap t <Plug>(easymotion-t2)
