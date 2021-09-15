"  _  _ ___    
" | || | __|   H
" | __ | _|    A
" |_||_|___|   P
"              

autocmd BufWritePost *note-*.md silent !~/bin/BuildTakeNote.sh %:p
