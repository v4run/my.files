" Sync syntax highlight from start
nnoremap <Leader><Space> :syntax sync fromstart<CR>
" go to next match and move current line to center
nnoremap n nzzzv
" go to prev match and move current line to center
nnoremap N Nzzzv
" Send to oblivion
nnoremap <Leader>d "_d

" delete the selected content to void (register - _) and paste before
vnoremap <Leader>d "_d
vnoremap <Leader>p "_dP
" move selection up and down using J and K. reselect reindent and select again
" in visual mode
vnoremap <C-j> :move '>+1<CR>gv=gv
vnoremap <C-k> :move '<-2<CR>gv=gv

imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

" Mappings
nmap <silent> <Leader>a :cclose<CR>:lclose<CR>
nmap <silent> <C-j> :cnext<CR>
nmap <silent> <C-k> :cprev<CR>
nmap <silent> <Leader>z :set wrap!<CR>
nmap <silent> <Leader>qo :copen<CR>
nmap <silent> <Leader>qc :cclose<CR>
map <silent> <Leader>ff :Neoformat<CR>
nmap <silent> <Leader>ft :Telescope filetypes<CR>
map <silent> <Leader>c <Plug>Commentary
nmap <silent> <Leader>cc <Plug>CommentaryLine
" Open new scratch file in new tab
nmap <silent> <Leader>fs :call NewScratch()<CR>
nmap <silent> <Leader>fb :Telescope buffers<CR>

" Insert mode completion
imap <C-x><C-k> <plug>(fzf-complete-word)
imap <C-x><C-f> <plug>(fzf-complete-path)
imap <C-x><C-l> <plug>(fzf-complete-line)

imap <C-c> <esc>

nmap <C-p> :Telescope find_files<CR>
nmap <Leader>fe :Telescope file_browser<CR>
nmap <Leader>/ :Telescope live_grep<CR>

