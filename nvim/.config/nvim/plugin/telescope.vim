" Wrap text in telescope preview
autocmd User TelescopePreviewerLoaded setlocal wrap

lua << EOF
local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup({
	defaults = {
		winblend = 10,
		layout_config = {
			bottom_pane = {
				height = 25,
				preview_cutoff = 0,
				prompt_position = "top",
			},
			vertical = {
				height = 0.95,
				preview_cutoff = 40,
				preview_height = 0.6,
				prompt_position = "bottom",
				width = 0.95
			},
			horizontal = {
				height = 0.95,
				preview_cutoff = 120,
				preview_width = 0.7,
				prompt_position = "bottom",
				width = 0.95
			},
		},
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
			previewer = false,
			shorten_path = true,
			theme = 'ivy',
		},
		find_files = {
			hidden = true,
			path_display = {'smart'},
			layout_strategy = 'vertical',
		},
		live_grep = {
			layout_strategy = 'vertical',
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
