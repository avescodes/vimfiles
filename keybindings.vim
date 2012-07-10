let mapleader = ","
let maplocalleader = ","

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

"" From Gary Bernhardt & DAS

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>mv :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>


