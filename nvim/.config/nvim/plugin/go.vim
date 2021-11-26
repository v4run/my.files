" Settings
let g:go_metalinter_autosave = 0
let g:go_jump_to_error = 1
let g:go_updatetime = 500
let g:go_doc_popup_window = 0
let g:go_def_mapping_enabled = 1
let g:go_auto_type_info = 0
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = 'gopls'
let g:go_list_type = 'quickfix'
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_rename_command = 'gopls'
let g:go_metalinter_command = 'golangci-lint'
let g:go_gopls_complete_unimported = 1

" Custom mappings
function! GoCustomMappings()
	nmap <buffer> gi :GoImplements<CR>
	nmap <buffer> gc :GoCallers<CR>
	nmap <buffer> gr :GoReferrers<CR>
	nmap <buffer> <Leader>x <Plug>(go-run)
	nmap <buffer> <Leader>b <Plug>(go-build)
	nmap <buffer> <Leader>i <Plug>(go-info)
	nmap <buffer> <Leader>s :GoSameIdsAutoToggle<CR>
	nmap <buffer> <Leader>gd <Plug>(go-def-tab)
	nmap <buffer> <Leader>e :GoIfErr<CR>
	nmap <buffer> <Leader>p :GoDecls<CR>
	nmap <buffer> <Leader>ta :GoAddTags<Space>
	nmap <buffer> <Leader>td :GoRemoveTags<Space>
	nmap <buffer> <Leader>r :GoRename<CR>
	nmap <buffer> <Leader>l :GoMetaLinter<CR>
	nmap <buffer> <Leader>9 :GoDecls<CR>
	nmap <buffer> <Leader>0 :GoDeclsDir<CR>
	inoremap <buffer> <C-p> <C-x><C-o>
	inoremap <buffer> <C-n> <C-x><C-o>
endfunction

au FileType go call GoCustomMappings()

