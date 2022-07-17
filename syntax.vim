if exists("b:current_syntax")
  finish
endif

let b:current_syntax = 1

setlocal conceallevel=3

syn match Statement "\~[^\~]\+\~" contains=presentTilde
syn match QuickFixLine "+[^+]\++" contains=presentPlus
syn match Statement "`[^ ][^`]\+`" contains=presentBacktick
syn match Statement "`[a-zA-Z0-9]\+`" contains=presentBacktick
syn match String "\*[^\*]\{3,}\*" contains=presentStar
syn match String "\*[a-zA-Z0-9]\+\*" contains=presentStar
syn match Question "-[^-:]\{3,}-" contains=presentDash
syn match Question "-[a-zA-Z0-9.\(]\+-" contains=presentDash

syn match presentTilde contained "\~" conceal
syn match presentPlus contained "+" conceal
syn match presentBacktick contained "`" conceal
syn match presentStar contained "\*" conceal
syn match presentDash contained "-" conceal
