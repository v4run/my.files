" Colorscheme
set background=dark
let g:gruvbox_sign_column='bg0'
let g:gruvbox_improved_strings='0'
let g:gruvbox_italic='1'
let g:gruvbox_improved_warnings='1'
let g:gruvbox_invert_indent_guides='1'
let g:gruvbox_invert_tabline='0'
let g:gruvbox_italicize_strings='0'
let g:gruvbox_transparent_bg='1'
let g:gruvbox_contrast_dark='soft'
autocmd vimenter * ++nested colorscheme gruvbox
" transparent background
" hi Normal guibg=NONE ctermbg=NONE
" transparent not text background
" hi EndOfBuffer guibg=NONE ctermbg=NONE
" transparent line number background
" hi LineNR guibg=NONE ctermbg=NONE
