" Vundle that shit. Vimrcs love vundles. =====================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
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
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'

" Vim, we need to talk... ====================================================
syntax enable
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

set number                         " Show numbers gutter
set numberwidth=3                  " Numbers gutter 3 cols wide
set ruler       " show the cursor position all the time
set cursorline

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

"" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'


set mouse=a " Enable mouse events (scrolling), particularly over tmux+iTerm2

if version >= 730 && has("macunix")
  " Default yank and paste go to Mac's clipboard
  set clipboard=unnamed
endif

if has("autocmd")
  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript
endif

let mapleader = ","

map <leader>gg :topleft 100 :split Gemfile<cr>
nnoremap <leader><leader> <c-^>
" find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

nmap <F1> <Esc>                    " No help please

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

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

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
