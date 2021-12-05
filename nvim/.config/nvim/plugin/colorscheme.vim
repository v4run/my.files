" Colorscheme
set background=dark
autocmd vimenter * ++nested colorscheme onehalfdark
" transparent background
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" transparent not text background
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
" transparent line number background
autocmd vimenter * hi LineNR guibg=NONE ctermbg=NONE
