"   _  _ ___    
"  | || | __|   H
"  | __ | _|    A
"  |_||_|___|   P
"               
"
"" abreviation
ab fsf Free Software Foundation
ab het the
"                       
"" vim colorscheme
"colorscheme 256_noir        " b/w and red
"colorscheme codedark        " cool scheme
"colorscheme atlas           " gray
"colorscheme vulpo           " good
"colorscheme minimalist      " good
"colorscheme apprentice      " not bad
"colorscheme molokai         " kinda best
"colorscheme gruvbox         " yeah yeah, same ;)
"colorscheme xcodedarkhc
"colorscheme solarized8      " yeah yeah, same ;)
"
"
colorscheme dalton          " kinda best
"colorscheme ayu              "kinda best
"
"
set background=dark
set termguicolors
"
"
"" Create the 'tags' file
"command! MakeTags !ctags -R .
"
"" add ready-to-use text by .ext
source ~/.config/nvim/skeldir/config.skel.vim
"
"
"" status line configs {{{

"" }}}
"" tab line settings {{{
"set showtabline=2                     " show tabline 
"set tabline+=%#StatusLine#            " Colorscheme
"set tabline+=\                        " blank space
"set tabline+=%#Number#                " Colorscheme
"set tabline+=\                        " blank space
"set tabline+=%#StatusLine#               " Colorscheme
"set tabline+=\                        " blank space
"set tabline+=%t                       " Tab status
"set tabline+=%=                       " Separator
"set tabline+=\                        " blank space
"set tabline+=%#CursorLineNr#          " ColorScheme
"set tabline+=\                        " blank space
"set tabline+=\%r                      " 
"set tabline+=\                        " blank space
"set tabline+=%#CursorLineNr#          " ColorScheme
"set tabline+=\                        " blank space
"set tabline+=%f                       " full path
"set tabline+=\                        " blank space
"set tabline+=%#Question#              " Colorscheme
"set tabline+=\                        " blank space
"set tabline+=%{&fileencoding?&fileencoding:&encoding}     " file encoding
"set tabline+=\[%{&fileformat}\]       " show filetype
"set tabline+=\                        " blank space
"set tabline+=%#Number#                " Colorscheme 
"set tabline+=%Y                       " filetype
"set tabline+=\                        " blank space
"set tabline+=\-                       " Colorscheme
"set tabline+=\                        " blank space
"set tabline+=%999Xx%X                    " blank space
"set tabline+=\                        " blank space
"" }}}
"
set nobackup
"
noremap <silent> - :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR> " commenting line with F6
noremap <silent> + :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR> " uncommenting line with F7
"
"
noremap <silent> = :tabprevious<CR> " switch to previous tab with F3
"noremap <silent> #4 :tabnext<CR> " switch to next tab with F2
"
"" paste mode toggle
set pastetoggle=<F2>            " Paste mode toggle with F2 
                                " Pastemode disable auto-indent and bracket auto-compelation
                                " it helps you to paste code fro elsewhere .
"
"" auto complete for ( , " , ' , [ , { 
inoremap      (  ()<Left>
inoremap      "  ""<Left>
inoremap      `  ``<Left>
inoremap      '  ''<Left>
inoremap      [  []<Left>
inoremap      {  {}<Left>
inoremap      «  «»<Left>
"«
"
source ~/.config/nvim/cp.vim
source ~/.config/nvim/keys.vim
source ~/.config/nvim/skeldir/config.skel.vim
source ~/.config/nvim/main.vim
source ~/.config/nvim/TakeNote.vim
