""   _  _ ___    
""  | || | __|   H
""  | __ | _|    A
""  |_||_|___|   P
""               
""                                     "
"" main section                        "
""
source ~/.config/nvim/main.vim
set background=dark                    " use the dark theme
""
"" colorscheme                         "
"" 
"" codedark onedark phoenix github     " list of good colorschemes
"" xcodedarkhc molokai                 " --
"" ghdark dalton minimalist ayu        " --
"" sunbather dark_plus vadelma         " --
""                                      
colorscheme xcodedarkhc
""                                      
"" lightline                           "
""
"" materia material codedark           " list of some scheme
"" ayu deus darcula one vadelma        " -
"" OldHope selenized_black             " -
""
"" vim airline 
" colorscheme
"let g:airline_theme='xcodedarkhc'
"
""
"" active colorscheme
"let g:lightline = { 'colorscheme' : 'mpvadelma', }
"let g:lightline = { 'colorscheme' : 'deus', }
let g:lightline = { 'colorscheme' : 'materia', }
let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline': 1
    \ }
""
"
""" skel templates
"" add ready-to-use text by .ext
source ~/.vim/skels.vim

"" plugins, auto complations
"source ~/.config/nvim/extra.vim
source ~/.config/nvim/ide.vim

"" statusline
"source ~/.config/nvim/xcodestatus.vim

"" compile, debug and run
source ~/.config/nvim/cp.vim

"" keybinds
source ~/.config/nvim/keys.vim

"" nnn filemanager
"source ~/.config/nvim/nnn.vim

"" nerdtree
"source ~/.config/nvim/nerdtree.vim
