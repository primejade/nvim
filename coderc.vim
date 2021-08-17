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
"colorscheme monokai_pro               " active colorscheme
colorscheme OceanicNext               " active colorscheme
"                                      
"" lightline                          "
""
"" materia material codedark          " list of some scheme{{{
"" ayu deus darcula one vadelma       " -
"" OldHope selenized_black            " -}}}
"
" active colorscheme
let g:lightline = {
     \ 'colorscheme' : 'mpvadelma',
     \ }
"
""" vim airline 
"" colorscheme
"let g:airline_theme='codedark'
"
""
""" skel templates
"" add ready-to-use text by .ext
source ~/.config/nvim/skeldir/config.skel.vim

"" plugins, auto complations
source ~/.config/nvim/extra.vim

"" statusline
"source ~/.config/nvim/codestatus.vim

"" compile, debug and run
source ~/.config/nvim/cp.vim

"" keybinds
source ~/.config/nvim/keys.vim
"" 
