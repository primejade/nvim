"   _  _ ___     
"  | || | __|   H
"  | __ | _|    A
"  |_||_|___|   P
"                
"                                     "
" main section                        "
" "
source ~/.config/nvim/main.vim
set background=light                  " use the dark theme
"
" colorscheme                         "
" "
" codedark onedark phoenix github     " list of good colorschemes{{{
" xcodedarkhc molokai                 " --
" ghdark dalton minimalist ayu        " --
" sunbather dark_plus vadelma         " --}}}
"                                      
"colorscheme PaperColor                " active colorscheme
"colorscheme solarized8                " active colorscheme
"colorscheme gruvbox                   " active colorscheme
colorscheme xcodelighthc              " active colorscheme
"colorscheme OceanicNextLight           " active colorscheme
"                                      
" lightline                           "
" "
" materia material codedark           " list of some scheme
" ayu deus darcula one vadelma        " -
" OldHope selenized_black             " -
"
" active colorscheme
let g:lightline = {
     \ 'colorscheme' : 'codedark',
     \ }

""" vim airline 
"" colorscheme
"let g:airline_theme='onehalflight'
"let g:airline_theme='onehalflight'
"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu
"

""
""" skel templates
"" add ready-to-use text by .ext
source ~/.config/nvim/skeldir/config.skel.vim

"" statusline
source ~/.config/nvim/codiumstatus.vim

"" compile, debug and run
source ~/.config/nvim/cp.vim

"" plugins, auto complations
source ~/.config/nvim/extra.vim

"" keybinds
source ~/.config/nvim/keys.vim
"" 

