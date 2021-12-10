" Wrap text in telescope preview
autocmd User TelescopePreviewerLoaded setlocal wrap

lua << EOF
local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup({
	defaults = {
		color_devicons = true,
		mappings = {
			i = {
				['<C-j>'] = actions.move_selection_next,
				['<C-k>'] = actions.move_selection_previous,
			},
		},
		file_ignore_patterns = {
			"node_modules/",
			".git/",
		},
	},
	pickers = {
		file_browser = {
			hidden = true,
		},
		find_files = {
			hidden = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
		},
	},
})

telescope.load_extension('fzf')
EOF
