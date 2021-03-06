""   _  _ ___    
""  | || | __|   H
""  | __ | _|    A
""  |_||_|___|   P
""               
""                                    "
"" main section                       "
""
source ~/.config/nvim/main.vim
set background=dark                   " use the dark theme
"
"" colorscheme                        "
""
"" codedark onedark phoenix github    " list of good colorschemes
"" xcodedarkhc molokai                " --
"" ghdark dalton minimalist ayu       " --
"" sunbather dark_plus vadelma        " --
"                                     
colorscheme codedark
"                                      
"" lightline                          "
""
"" materia material codedark          " list of some scheme{{{
"" ayu deus darcula one vadelma       " -
"" OldHope selenized_black            " -}}}
"
" active colorscheme
"let g:lightline = { 'colorscheme' : 'materia', }
"let g:lightline = { 'colorscheme' : 'deus', }
"
"" vim airline 
let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
"
"" colorscheme
let g:airline_theme='codedark'

""
""" skel templates
"" add ready-to-use text by .ext
source ~/.vim/skels.vim

"" plugins, auto complations
"source ~/.config/nvim/ide.vim
source ~/.config/nvim/extra.vim

source ~/.config/nvim/plug-config/coc.vim
"" statusline
"source ~/.config/nvim/codestatus.vim

"" compile, debug and run
source ~/.config/nvim/cp.vim

"" keybinds
source ~/.config/nvim/keys.vim

"" nnn filemanager
"source ~/.config/nvim/nnn.vim

"" nerdtree
source ~/.config/nvim/nerdtree.vim
