" Settings
let g:blamer_delay = 500
let g:blamer_template = '(<commit-short>) <committer>, <author-time> • <summary>'

" Toggle git blame
function! s:ToggleGitBlame()
	let found = 0
	for windownumber in range(1, winnr('$'))
		if getbufvar(winbufnr(windownumber), '&filetype') ==# 'fugitiveblame'
			exe windownumber . 'close'
			let found = 1
		endif
	endfor
	if !found
		Git blame
	endif
endfunction

" Execute :Git command
nmap <Leader>gs :G<CR>

" Mapping to toggle git blame window
nmap <silent> gb :call <SID>ToggleGitBlame()<CR>

" Inline git blame using blamer.nvim
nmap <silent> <Leader>gb :BlamerToggle<CR>

