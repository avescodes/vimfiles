" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g`\"" | endif

" Treat JSON files like JavaScript
autocmd BufRead,BufNewFile {Vagrantfile,Guardfile,Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
autocmd BufRead,BufNewFile {COMMIT_EDITMSG}                                                  set ft=gitcommit
autocmd BufNewFile,BufRead {*.json}                                                          set ft=javascript
autocmd BufRead,BufNewFile {*.cljs}                                                          setlocal filetype=clojure
