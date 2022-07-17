set rtp +=.vim
set nocompatible

call plug#begin('./.vim/plugged')
Plug 'junegunn/goyo.vim'
call plug#end()

fun! FindExecCmd()
  let line = search('^!!:.*')
  if line > 0
    let command = substitute(getline(line), '^!!:', '', '')
    exe 'silent !%s' . command
    exe 'normal gg0'
    redraw!
  endif
endf

fun! PresentEnter()
  nnoremap <silent> l :n<CR>gg0
  nnoremap <silent> h :N<CR>gg0
  nnoremap <leader>E :call FindExecCmd()<CR>

  set nosplitbelow
  set nosplitright
  exe 'Goyo 145x40'
  exe 'normal gg0'
endf

aug PresentationMode
  au!
  au BufRead,BufNewFile *.vpm set ft=vpm
  au BufRead *.vpm call FindExecCmd()
  au BufRead *.vpm if filereadable('syntax.vim') | source syntax.vim | endif
  au VimEnter *.vpm call PresentEnter()
aug END

function! MapsNop()
  let mapped = filter(['R', 'H', 'J', 'K', 'L', '|', '_'], "empty(maparg(\"\<c-w>\".v:val, 'n'))")
  for c in mapped
    echo 'nnoremap <c-w>'.escape(c, '|').' <nop>'
  endfor
  return mapped
endfunction
"
"
"
"
