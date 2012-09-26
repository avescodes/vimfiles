"" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.un~,.DS_Store,.gitkeep,*/vendor/gems/*
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

"" VimClojure
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
" let vimclojure#NailgunClient = $HOME . "/.vim/lib/vimclojure-nailgun-client/ng"
let vimclojure#NailgunClient = "/usr/local/bin/ng"

