" Colorscheme
set background=dark
let g:gruvbox_sign_column='dark0_soft'
let g:gruvbox_improved_strings='0'
let g:gruvbox_italic='1'
let g:gruvbox_improved_warnings='1'
let g:gruvbox_invert_indent_guides='1'
let g:gruvbox_invert_tabline='0'
let g:gruvbox_italicize_strings='0'
let g:gruvbox_contrast_dark='soft'

augroup theme
	autocmd vimenter * ++nested colorscheme gruvbox
	" transparent background
	autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
	" transparent not text background
	autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
	" transparent line number background
	autocmd vimenter * hi LineNR guibg=NONE ctermbg=NONE
augroup end
