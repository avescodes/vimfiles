set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set runtimepath+=~/.vim/vundle.git
call vundle#rc()

Bundle 'gmarik/vundle'

" Aesthetics
Bundle 'mrtazz/molokai.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'

" Syntaxon
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'

" Extras
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'wookiehangover/jshint.vim'
Bundle 'TailMinusF'
Bundle 'taglist.vim'
Bundle 'Tabular'
Bundle 'airblade/vim-gitgutter'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

set directory=/tmp/
set encoding=utf-8
set background=dark
colorscheme molokai
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set list
set listchars=""
set listchars+=tab:▸\ 
set listchars+=trail:·
set listchars+=extends:>
set listchars+=precedes:<

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.un~,.DS_Store,.gitkeep,*/vendor/*,*/bin/*,.*,*/coverage/*

set number                         " Show numbers gutter
set numberwidth=3                  " Numbers gutter 3 cols wide
set ruler       " show the cursor position all the time
set cursorline
set scrolloff=3
set shortmess=atI

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault                    " Always assume /g on substitutions

" Splits
set splitbelow
set splitright

set mouse=a " Enable mouse events (scrolling), particularly over tmux+iTerm2

if version >= 730 && has("macunix")
  " Default yank and paste go to Mac's clipboard
  set clipboard=unnamed
endif

if v:version >= 703
  set undofile
  let &undodir=&directory
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'

set laststatus=2  " always show the status bar

if has("statusline") && !&cp

  " Start the status line
  set statusline=%f\ %m\ %r

  " Add fugitive
  set statusline+=%{fugitive#statusline()}\ 

  " Finish the statusline
  set statusline+=Line:%l/%L\ [%p%%]
  set statusline+=\ Col:%v
  set statusline+=\ Buf:#%n
  set statusline+=\ [%b][0x%B]
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extras Customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" CtrlP
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g`\"" | endif

" Treat JSON files like JavaScript
autocmd BufRead,BufNewFile {Vagrantfile,Guardfile,Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
autocmd BufRead,BufNewFile {COMMIT_EDITMSG}                                                  set ft=gitcommit
autocmd BufNewFile,BufRead {*.json}                                                          set ft=javascript
autocmd BufRead,BufNewFile {*.cljs}                                                          setlocal filetype=clojure

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Rename current file
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

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>
map <leader>ws :call KillWhitespace
