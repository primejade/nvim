"   _  _ ___    
"  | || | __|   H
"  | __ | _|    A
"  |_||_|___|   P
"               
"                                   "
"" status line section {{{10
" git status function
"
"function! GitBranch()
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction
"function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
"endfunction 
"
"function! CharCount()
"   return system("wc -m $ 2>/dev/null")
"endfunction
"function! PrintOutCount()
"   let l:CharOutCount = CharCount()
"   return strlen(l:CharOutCount) > 0?'  '.l:CharOutCount.' ':''
"endfunction 
"
"function! CharCount()
"  return system("wc -m % 2> /dev/null | awk '{print $1}' ")
"endfunction
"function! ShowCount()
"  let l:countcharacters = CharCount()
"  return strlen(l:countcharacters) > 0?'  '.l:countcharacters.' ':''
"endfunction
"
" status bar colors
"au InsertEnter * hi statusline guifg=black guibg=#dddddd ctermfg=black ctermbg=magenta
"au InsertLeave * hi statusline guifg=#050505  guibg=#aaaaaa ctermfg=black ctermbg=cyan
"hi statusline                  guifg=#050505  guibg=#aaaaaa ctermfg=black ctermbg=cyan


" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)
"" }}}10
"
" Status Line Custom{{{1
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
\ "\<C-V>" : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}
" to display current mode in status line
"}}}1
" git function {{{1
function! StatuslineGitBranch()
    if exists("g:git_branch")
        return g:git_branch
    else
        return ''
    endif
endfunction

function! GetGitBranch()
    let l:is_git_dir = system('echo -n $(git rev-parse --is-inside-work-tree)')
    let g:git_branch = l:is_git_dir == 'true' ?
        \ system('bash -c "echo -n $(git rev-parse --abbrev-ref HEAD)"') : ''
endfunction

autocmd BufEnter * call GetGitBranch()
"" }}}1

"
" config section {{{1
set laststatus=2                      " show status line
set statusline=                       " status line config
set statusline+=%#StatusLine#         " color-scheme
set statusline+=%1*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=\»\                   " blank space
set statusline+=%3*\ %<%F             " Full path
set statusline+=%2*\ %r               " blank space
set statusline+=%=                    " Switch to the right side
set statusline+=\ \                   " blank space
set statusline+=%c                    " cursor current position
set statusline+=%4*\ \|\              " blank space
set statusline+=%2*%l\:%L             " blank space
set statusline+=%2*\                  " blank space
set statusline+=%5*\ \-%Y\-\          " file type
set statusline+=%5*\ \«               " blank space
set statusline+=\                     " blank space
set statusline+=%n\ \[%M\]            " modification symbol
set statusline+=\                     " blank space
set statusline+=%1*\                  " blank space
set statusline+=%{StatuslineGitBranch()}
set statusline+=\                     " blank space
" }}}1

""set laststatus=2{{{1
""set noshowmode
""set statusline=
""set statusline+=%1*\ %{toupper(g:currentmode[mode()])}\  " The current mode
""set statusline+=\»\                                  " blank space
""set statusline+=%2*\ %<%F\ %m%r%h%w\                 " File path, modified, readonly, helpfile, preview
""set statusline+=%3*\ %Y\                             " FileType
""set statusline+=%3*\|                                " Separator
""set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''} " Encoding
""set statusline+=\ (%{&ff})                           " FileFormat (dos/unix..)
""set statusline+=%=                                   " Right Side
""set statusline+=%3*\ col:\ %02v\                     " Colomn number
""set statusline+=%2*\ ln:\ %02l/%L                    " Line number / total lines, percentage of document
""set statusline+=%2*\ \|                              " Separator
""set statusline+=%2*\ (%P)\                           " Line number / total lines, percentage of document
""set statusline+=%1*\ %n\                             " Buffer number
""set statusline+=\ %{strftime('%H:%M')}               " show time 
"" }}}1
"
" statusline colors
"
""" pink-black{{{1
""hi User1 cterm=bold ctermfg=232 ctermbg=168 gui=bold guifg=#000000 guibg=#d75f87
""hi User2 cterm=bold ctermfg=168 ctermbg=232 gui=bold guifg=#d75f87 guibg=#121212
""hi User3 cterm=bold ctermfg=243 ctermbg=232 gui=bold guifg=#767676 guibg=#121212
""hi User4 cterm=bold ctermfg=235 ctermbg=232 gui=bold guifg=#262626 guibg=#121212
""hi User5 cterm=bold ctermfg=015 ctermbg=232 gui=bold guifg=#f1f1f1 guibg=#121212
"""}}}1
""" dark-green-black{{{1
""hi User1 cterm=bold ctermfg=232 ctermbg=71  gui=bold guifg=#000000 guibg=#499c54
""hi User2 cterm=bold ctermfg=71  ctermbg=232 gui=bold guifg=#499c54 guibg=#121212
""hi User3 cterm=bold ctermfg=103 ctermbg=232 gui=bold guifg=#6897bb guibg=#121212
""hi User4 cterm=bold ctermfg=235 ctermbg=232 gui=bold guifg=#262626 guibg=#121212
""hi User5 cterm=bold ctermfg=015 ctermbg=232 gui=bold guifg=#f1f1f1 guibg=#121212
"""}}}1
""" light-green-black{{{1
""hi User1 cterm=bold ctermfg=232 ctermbg=119 gui=bold guifg=#000000 guibg=#87ff5f
""hi User2 cterm=bold ctermfg=119 ctermbg=232 gui=bold guifg=#87ff5f guibg=#121212
""hi User3 cterm=bold ctermfg=243 ctermbg=232 gui=bold guifg=#767676 guibg=#121212
""hi User4 cterm=bold ctermfg=235 ctermbg=232 gui=bold guifg=#262626 guibg=#121212
""hi User5 cterm=bold ctermfg=015 ctermbg=232 gui=bold guifg=#f1f1f1 guibg=#121212
"""}}}1
""" medium-blue-black{{{1
""hi User1 cterm=bold ctermfg=232 ctermbg=4   gui=bold guifg=#000000 guibg=#007acc
""hi User2 cterm=bold ctermfg=4   ctermbg=232 gui=bold guifg=#007acc guibg=#121212
""hi User3 cterm=bold ctermfg=243 ctermbg=232 gui=bold guifg=#767676 guibg=#121212
""hi User4 cterm=bold ctermfg=235 ctermbg=232 gui=bold guifg=#262626 guibg=#121212
""hi User5 cterm=bold ctermfg=015 ctermbg=232 gui=bold guifg=#f1f1f1 guibg=#121212
"""}}}1
""" light-blue-black{{{1
"""hi User1 cterm=bold ctermfg=232 ctermbg=14  gui=bold guifg=#000000 guibg=#4fb8cc
"""hi User2 cterm=bold ctermfg=14  ctermbg=232 gui=bold guifg=#4fb8cc guibg=#121212
"""hi User3 cterm=bold ctermfg=243 ctermbg=232 gui=bold guifg=#767676 guibg=#121212
"""hi User4 cterm=bold ctermfg=235 ctermbg=232 gui=bold guifg=#262626 guibg=#121212
"""hi User5 cterm=bold ctermfg=015 ctermbg=232 gui=bold guifg=#f1f1f1 guibg=#121212
"""}}}1
""" orange-black{{{1
""hi User1 cterm=bold ctermfg=232 ctermbg=208 gui=bold guifg=#000000 guibg=#ff8700
""hi User2 cterm=bold ctermfg=208 ctermbg=232 gui=bold guifg=#ff8700 guibg=#121212
""hi User3 cterm=bold ctermfg=243 ctermbg=232 gui=bold guifg=#767676 guibg=#121212
""hi User4 cterm=bold ctermfg=235 ctermbg=232 gui=bold guifg=#262626 guibg=#121212
""hi User5 cterm=bold ctermfg=015 ctermbg=232 gui=bold guifg=#f1f1f1 guibg=#121212
"""}}}
""" light-red-black{{{1
""hi User1 cterm=bold ctermfg=232 ctermbg=167 gui=bold guifg=#000000 guibg=#fb4943
""hi User2 cterm=bold ctermfg=167 ctermbg=232 gui=bold guifg=#fb4943 guibg=#121212
""hi User3 cterm=bold ctermfg=243 ctermbg=232 gui=bold guifg=#767676 guibg=#121212
""hi User4 cterm=bold ctermfg=235 ctermbg=232 gui=bold guifg=#262626 guibg=#121212
""hi User5 cterm=bold ctermfg=015 ctermbg=232 gui=bold guifg=#f1f1f1 guibg=#121212
"""}}}1
""" yellow-black{{{1
""hi User1 cterm=bold ctermfg=232 ctermbg=226 gui=bold guifg=#000000 guibg=#ffff00
""hi User2 cterm=bold ctermfg=226 ctermbg=232 gui=bold guifg=#ffff00 guibg=#121212
""hi User3 cterm=bold ctermfg=243 ctermbg=232 gui=bold guifg=#767676 guibg=#121212
""hi User4 cterm=bold ctermfg=235 ctermbg=232 gui=bold guifg=#262626 guibg=#121212
""hi User5 cterm=bold ctermfg=015 ctermbg=232 gui=bold guifg=#f1f1f1 guibg=#121212
"""}}}1
""" Black and White{{{1
""hi User1 cterm=bold ctermfg=232 ctermbg=255 gui=bold guifg=#000000 guibg=#eeeeee
""hi User2 cterm=bold ctermfg=255 ctermbg=232 gui=bold guifg=#eeeeee guibg=#121212
""hi User3 cterm=bold ctermfg=243 ctermbg=232 gui=bold guifg=#767676 guibg=#121212
""hi User4 cterm=bold ctermfg=235 ctermbg=232 gui=bold guifg=#262626 guibg=#121212
""hi User5 cterm=bold ctermfg=015 ctermbg=232 gui=bold guifg=#f1f1f1 guibg=#121212
"""}}}1
""" gray-black  {{{1
""hi User1 cterm=bold ctermfg=232 ctermbg=243 gui=bold guifg=#000000 guibg=#767676
""hi User2 cterm=bold ctermfg=243 ctermbg=232 gui=bold guifg=#767676 guibg=#121212
""hi User3 cterm=bold ctermfg=255 ctermbg=232 gui=bold guifg=#eeeeee guibg=#121212
""hi User4 cterm=bold ctermfg=235 ctermbg=232 gui=bold guifg=#262626 guibg=#121212
""hi User5 cterm=bold ctermfg=015 ctermbg=232 gui=bold guifg=#f1f1f1 guibg=#121212
"""}}}1

"
" " very costumized
""" blue {{{1
""hi User1 cterm=bold ctermfg=015 ctermbg=238 gui=bold guifg=#ffffff guibg=#444444
""hi User2 cterm=bold ctermfg=015 ctermbg=4   gui=bold guifg=#ffffff guibg=#005faf
""hi User3 ctermfg=015 ctermbg=025 guifg=#ffffff guibg=#005faf
""hi User4 ctermfg=233 ctermbg=025 guifg=#1c1c1c guibg=#005faf
""hi User5 cterm=bold ctermfg=226 ctermbg=232 gui=bold guifg=#ffff00 guibg=#121212
""" }}}1
""" pink {{{1
""hi User1 cterm=bold ctermfg=015 ctermbg=238 gui=bold guifg=#5c5c5c guibg=#c7c7c7
""hi User2 ctermfg=232 ctermbg=168 guifg=#000000 guibg=#d75f87
""hi User3 cterm=bold ctermfg=232 ctermbg=168 gui=bold guifg=#000000 guibg=#d75f87
""hi User4 ctermfg=232 ctermbg=168 guifg=#000000 guibg=#d75f87
""hi User5 ctermfg=208 ctermbg=232 guifg=#c7c7c7 guibg=#5c5c5c
""" }}}1
" green {{{1
hi User1 cterm=bold ctermfg=015 ctermbg=238 gui=bold guifg=#ffffff guibg=#444444
hi User2 cterm=bold ctermfg=232 ctermbg=71  gui=bold guifg=#000000 guibg=#499c54
hi User3 ctermfg=232 ctermbg=71  guifg=#000000 guibg=#499c54
hi User4 ctermfg=232 ctermbg=71  guifg=#000000 guibg=#499c54
hi User5 cterm=bold ctermfg=167 ctermbg=232 gui=bold guifg=#fb4943 guibg=#121212
"}}}1
""" purple {{{1
""hi User1 cterm=bold ctermfg=208 ctermbg=232 gui=bold guifg=#d75f87 guibg=#121212
""hi User2 cterm=bold ctermfg=232 ctermbg=167 gui=bold guifg=#000000 guibg=#bb66ee
""hi User3 ctermfg=232 ctermbg=167 guifg=#000000 guibg=#bb66ee
""hi User4 ctermfg=232 ctermbg=167 guifg=#000000 guibg=#bb66ee
""hi User5 cterm=bold ctermfg=14  ctermbg=238 gui=bold guifg=#4fb8cc guibg=#2c2c2c
""" }}}
