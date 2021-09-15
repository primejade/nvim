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
""
""" Commands:
autocmd FileType cpp   nnoremap <leader>fe :CPPCompile<CR>
autocmd FileType c     nnoremap <leader>fe :CCompile<CR>
autocmd FileType c,cpp nnoremap <leader>fw :CCRunOutput<CR>
""" }}}
"""  compile and run in external terminal with makefile {{{
"command! -nargs=0 EXTerOutput         call TermWrapper(printf('xterm -T RunPrompt -e "./output"'))
"command! -nargs=0 EXTerCompilOutput   call TermWrapper(printf('xterm -T RunPrompt -e "make && ./output"'))
"
"autocmd FileType c,cpp nnoremap <leader>ft :EXTerOutput<CR>
"autocmd FileType c,cpp nnoremap <leader>fg :EXTerCompilOutput<CR>
""" }}}
""  markdown, groff and latex compilation {{{
"autocmd FileType tex    nnoremap <leader>fe :!pdflatex %:r.tex<CR>
autocmd FileType tex    nnoremap <leader>fe :!xelatex %:r.tex<CR>

" pandoc using latex
autocmd Filetype markdown nnoremap <leader>fe :!pandoc %:r.md -o %:r.pdf<CR>
" use groff instead of latex
"autocmd Filetype markdown nnoremap <leader>fe :!pandoc %:r.md -t ms -o %:r.ms.pdf<CR>

autocmd FileType nroff  nnoremap <leader>fe :!groff -wall -ms -Tpdf %:r.ms > %:r.pdf<CR>

"command! -nargs=0 GroffPDF        call TermWrapper(printf('groff -wall -ms -Tpdf %s > %.pdf', expand('%')))
"autocmd FileType nroff  nnoremap <leader>fe :GroffPDF<CR>
"autocmd FileType nroff  nnoremap <leader>fe :vert new && term groff -wall -ms -Tpdf %:r.ms > %:r.pdf<CR>i
"" }}}

""  shell section {{{
""  -RunshScript- 
command! -nargs=0 ShScript  call TermWrapper(printf('sh %s', expand('%')))
""  -RunBashScript- 
command! -nargs=0 BashScript  call TermWrapper(printf('bash %s', expand('%')))
""  -RunCshScript- 
command! -nargs=0 CshScript  call TermWrapper(printf('csh %s', expand('%')))
""
""" Commands:
autocmd FileType sh,zsh,csh,bash nnoremap <leader>fe :ShScript<CR>
autocmd FileType sh,zsh,csh,bash nnoremap <leader>fw :BashScript<CR>
autocmd FileType sh,zsh,csh,bash nnoremap <leader>fq :CshScript<CR>
""" }}}
"
""  Global make commend {{{
command! -nargs=0 MakeItMake        call TermWrapper(printf('make'))
"command! -nargs=0 ForceMakeItMake   call TermWrapper(printf('make force'))
"command! -nargs=0 MakeAndRun        call TermWrapper(printf('make && ./output'))
"command! -nargs=0 RunIt             call TermWrapper(printf('./output'))

autocmd FileType *     nnoremap <leader>cc :MakeItMake<CR>
"autocmd FileType *     nnoremap <leader>fr :ForceMakeItMake<CR>
"autocmd FileType c,cpp nnoremap <leader>fw :RunIt<CR>
"autocmd FileType c,cpp nnoremap <leader>fq :MakeAndRun<CR>

"autocmd FileType * <Leader>mm :!~/bin/makefile.sh %:e $(echo %:t | sed s/.%:e//g)<CR>
"" }}}
"
"" python section {{{
command! -nargs=0 PyConsoleRun   call TermWrapper(printf('python %s', expand ('%')))

autocmd FileType python  nnoremap <leader>fe   :PyConsoleRun<CR>
autocmd FileType python  nnoremap <leader>ft   :!xterm -T RunPrompt -e "python % ; read -p 'Press Enter to exit ' dumpvar"<CR>

"" }}}
"autocmd FileType nroff nnoremap <leader>fe :NroffCompile<CR>
"autocmd FileType python nnoremap <leader>fb :!python %<CR>
"
"" choose between 'vertical | ' and 'horizontal - ' {{{
"" for how the terminal window is split
"" (default is vertical)
"let g:split_term_style = 'vertical' " |
let g:split_term_style = 'horizontal' " -
"" }}}
"" split size {{{
"let g:split_term_resize_cmd = 'resize 80'
"let g:split_term_resize_cmd = ('resize 80')
"" }}}
