let mapleader = ","

" CtrlP maps
map <leader>p :CtrlP<cr>
map <leader>js :CtrlP app/assets/javascripts<cr>

" Open Gemfile
map <leader>gg :topleft 100 :split Gemfile<cr>

" Swap w/ mru buffer
nnoremap <leader><leader> <c-^>

" find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" No help please
nmap <F1> <Esc>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Reselect visual block after indent/outdent - vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

" For pairing
inoremap jk <Esc>
inoremap jj <Esc>
