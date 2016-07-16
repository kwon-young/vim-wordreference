" --------------------------------
" Add our plugin to the path
" --------------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Function(s)
" --------------------------------
function! WrdRef()
python << endOfPython

import vim_wordreference
reload(vim_wordreference)

for n in range(5):
    out = vim_wordreference.translate()

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! WrdRef call WrdRef()
