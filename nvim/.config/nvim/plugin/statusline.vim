" Status line settings
let g:lightline = {
			\ 	'colorscheme': 'onehalfdark',
			\ 	'active': {
			\ 		'left': [
			\ 			[ 'mode', 'paste'],
			\ 			[ 'gitbranch', 'readonly', 'relativepath', 'modified' ]
			\ 		]
			\ 	},
			\ 	'component_function': {
			\ 		'gitbranch': 'FugitiveHead'
			\ 	},
			\ }

" Old status line [replaced by lightline]
" function! SetStatusLine()
" 	set statusline=
" 	set statusline+=\ %f\ %m\ %y\ %R " show filename, modified flag, file type, readonly flag
" 	set statusline+=%= " separate left and right part
" 	set statusline+=%{FugitiveStatusline()} " git details (current branch)
" 	set statusline+=\ [%l,\ %c]\ %p%%\  " add line number, column number and percent
" 	set laststatus=2 " always show statusline
" endfunction

" call SetStatusLine()
