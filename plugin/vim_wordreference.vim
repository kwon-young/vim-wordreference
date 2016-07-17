" --------------------------------
" Add our plugin to the path
" --------------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Function(s)
" --------------------------------
function! s:WrdRef(dic, word)
python << endOfPython

import wordreference
reload(wordreference)

def create_new_buffer(file_name, file_type, contents):
    vim.command('rightbelow vsplit {0}'.format(file_name))
    vim.command('normal! ggdG')
    vim.command('setlocal filetype={0}'.format(file_type))
    vim.command('setlocal buftype=nowrite')
    for i, line in enumerate(contents):
        cmd = u'call append({0}, "{1}")'.format(i, line)
        vim.command(cmd)

def make_translation_buffer():
    dic = vim.eval("a:dic")
    word = vim.eval("a:word")
    contents = wordreference.wrdref.translate(dic, word)
    contents = contents.split('\n')
    create_new_buffer("Translation_buffer", "text", contents)

make_translation_buffer()

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! -nargs=* WrdRef call s:WrdRef(<f-args>)
