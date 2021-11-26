" Sync syntax highlight from start
nnoremap <Leader><Space> :syntax sync fromstart<CR>
" go to next match and move current line to center
nnoremap n nzzzv
" go to prev match and move current line to center
nnoremap N Nzzzv
" move line up and down using J and K. reselect reindent and select again
" in visual mode
nnoremap <leader>j :move .+1<CR>==
nnoremap <leader>k :move .-2<CR>==
" Send line to oblivion
nnoremap <Leader>d "_d

" delete the selected content to void (register - _) and paste before
vnoremap <Leader>d "_d
vnoremap <Leader>p "_dP
" move selection up and down using J and K. reselect reindent and select again
" in visual mode
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv

" Mappings
nmap <silent> <Leader>a :cclose<CR>:lclose<CR>
nmap <silent> <C-j> :cnext<CR>
nmap <silent> <C-k> :cprev<CR>
nmap <silent> <Leader>z :set wrap!<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

inoremap <C-c> <esc>

