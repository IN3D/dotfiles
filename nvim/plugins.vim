call plug#begin('~/.vim/plugged')

let g:installing_plugins=1

for file in split(glob('~/.vim/plugins/*.vim'), '\n')
  exe 'source' fnameescape(file)
endfor

unlet g:installing_plugins

call plug#end()
