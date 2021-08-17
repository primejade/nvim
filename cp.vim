" important option that should already be set!
set hidden

" available options:
" * g:split_term_style
" * g:split_term_resize_cmd
"
"" split term function {{{
function! TermWrapper(command) abort
  if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
  if g:split_term_style ==# 'vertical'
    let buffercmd = '70vnew'
  elseif g:split_term_style ==# 'horizontal'
    let buffercmd = '20new'
  else
    echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
    throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
  endif
  if exists('g:split_term_resize_cmd')
    exec g:split_term_resize_cmd
  endif
  exec buffercmd
  exec 'term ' . a:command
  exec 'setlocal nornu nonu'
  exec 'startinsert'
endfunction
"" }}}
"
""" commands
""  C/C++ section {{{
""  -CPPCompile- 
command! -nargs=0 CPPCompile      call TermWrapper(printf('g++ %s', expand('%')))
""  -CCompile-    
command! -nargs=0 CCompile        call TermWrapper(printf('gcc %s', expand('%')))
""  -TestAndRun-   run ./a.out
command! -nargs=0 CCRunOutput     call TermWrapper(printf('./a.out'))
"
"" Commands:
autocmd FileType cpp   nnoremap <leader>fe :CPPCompile<CR>
autocmd FileType c     nnoremap <leader>fe :CCompile<CR>
autocmd FileType c,cpp nnoremap <leader>fw :CCRunOutput<CR>
"" }}}

""  compile and run in external terminal with makefile {{{
command! -nargs=0 EXTerOutput         call TermWrapper(printf('xterm -T RunPrompt -e "./output"'))
command! -nargs=0 EXTerCompilOutput   call TermWrapper(printf('xterm -T RunPrompt -e "make && ./output"'))

autocmd FileType c,cpp nnoremap <leader>ft :EXTerOutput<CR>
autocmd FileType c,cpp nnoremap <leader>fg :EXTerCompilOutput<CR>
"" }}}

""  Global make commend {{{
command! -nargs=0 MakeItMake     call TermWrapper(printf('make'))
command! -nargs=0 MakeAndRun     call TermWrapper(printf('make && ./output'))

autocmd FileType *     nnoremap <leader>fv :MakeItMake<CR>
autocmd FileType c,cpp nnoremap <leader>fq :MakeAndRun<CR>
"" }}}

""  groff and latex compilation {{{
autocmd FileType tex    nnoremap <leader>fe :!pdflatex %:r.tex<CR>
autocmd FileType nroff  nnoremap <leader>fe :!groff -ms -Tpdf %:r.ms > %:r.pdf<CR>
"" }}}

""" markdown section {{{
"" markdown to pdf via pandoc
autocmd Filetype markdown nnoremap <leader>fe :!pandoc %:r.md -o %:r.pdf<CR>
" }}}

"" python section {{{
command! -nargs=0 PyConsoleRun   call TermWrapper(printf('python %s', expand ('%')))
autocmd FileType python nnoremap <leader>fe :PyConsoleRun<CR>

autocmd FileType python nnoremap <leader>ft :!xterm -T RunPrompt -e "python % ; read -p 'Press Enter to exit ' dumpvar"<CR>

"" }}}
"autocmd FileType nroff nnoremap <leader>fe :NroffCompile<CR>
"autocmd FileType python nnoremap <leader>fb :!python %<CR>
"
"" choose between 'vertical | ' and 'horizontal - ' {{{
"" for how the terminal window is split
"" (default is vertical)
let g:split_term_style = 'vertical' " |
"let g:split_term_style = 'horizontal' " -
"" }}}
"" split size {{{
"let g:split_term_resize_cmd = 'resize 80'
"let g:split_term_resize_cmd = ('resize 80')
"" }}}
