" -----------------------------------------------------------------------------
" Plugins relating to language syntax, highlighting, etc
" -----------------------------------------------------------------------------
if exists('g:installing_plugins')
  let js_and_friends = ['javascript', 'javascript.jsx', 'coffee', 'ls', 'typescript']

  Plug 'chochos/ceylon-vim',                     { 'for': 'ceylon' }
  Plug 'claco/jasmine.vim',                      { 'for': js_and_friends }
  Plug 'vim-scripts/nginx.vim',                  { 'for': 'nginx' }
  Plug 'cakebaker/scss-syntax.vim',              { 'for': ['scss', 'sass'] }
  Plug 'HerringtonDarkholme/yats.vim',           { 'for': 'typescript' }
  Plug 'burnettk/vim-angular',                   { 'for': 'javascript' }
  Plug 'jwalton512/vim-blade',
  Plug 'kchmck/vim-coffee-script',               { 'for': 'coffee' }
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-cucumber',                     { 'for': 'cucumber' }
  Plug 'nvie/vim-flake8',                        { 'for': 'python' }
  Plug 'fatih/vim-go',                           { 'do': ':GoInstallBinaries' }
  Plug 'tpope/vim-haml',                         { 'for': 'haml' }
  Plug 'digitaltoad/vim-jade',                   { 'for': 'jade' }
  Plug 'elzr/vim-json'
  Plug 'groenewege/vim-less',                    { 'for': 'less' }
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-rails',                        { 'for': 'ruby' }
  Plug 'vim-ruby/vim-ruby'
  Plug 'dag/vim-fish',                           { 'for': 'fish' }
  Plug 'gkz/vim-ls',                             { 'for': 'ls' }
  Plug 'IN3D/vim-raml',                          { 'for': 'raml' }
  Plug 'othree/html5.vim'
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': js_and_friends }
  Plug 'hail2u/vim-css3-syntax'
  Plug 'othree/yajs.vim',                        { 'for': js_and_friends }
  Plug 'mustache/vim-mustache-handlebars',       { 'for': 'handlebars' }
  Plug 'derekwyatt/vim-scala',                   { 'for': 'scala' }
  Plug 'rust-lang/rust.vim',                     { 'for': 'rust' }
  Plug 'raichoo/purescript-vim',                 { 'for': 'purescript' }
  Plug 'elixir-lang/vim-elixir',                 { 'for': 'elixir' }
  Plug 'mxw/vim-jsx',                            { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'dart-lang/dart-vim-plugin',              { 'for': 'dart' }
  Plug 'darthmall/vim-vue',                      { 'for': 'vue' }
  Plug 'ElmCast/elm-vim'
  Plug 'neovimhaskell/haskell-vim', "             { 'for': 'haskell' }
  " Plug 'chrisbra/csv.vim'
  Plug 'keith/swift.vim',                        { 'for': 'swift' }
  Plug 'jez/vim-better-sml',                     { 'for': 'sml' }
  Plug 'zah/nim.vim',                            { 'for': 'nim' }
  Plug 'fsharp/vim-fsharp',                      { 'for': 'fsharp'}
  finish
endif
