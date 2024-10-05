local telescope = require("telescope")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local putils = require("telescope.previewers.utils")
-- List of mime types to hide the preview
local mime_types_to_hide = { "application/x-executable" }
local mime_types_set_to_hide = {}
for i = 1, #mime_types_to_hide do
	mime_types_set_to_hide[mime_types_to_hide[i]] = true
end
local binary_hider = function(filepath, bufnr, opts)
	filepath = vim.fn.expand(filepath)
	Job:new({
		command = "file",
		args = { "--mime-type", "-b", filepath },
		on_exit = function(j)
			local mime_type = j:result()[1]
			if mime_types_set_to_hide[mime_type] then
				vim.schedule_wrap(putils.set_preview_message)(
					bufnr,
					opts.winid,
					"Cannot be previewed",
					opts.preview.msg_bg_fillchar
				)
			else
				previewers.buffer_previewer_maker(filepath, bufnr, opts)
			end
		end,
	}):sync()
end

telescope.setup({
	defaults = {
		-- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		buffer_previewer_maker = binary_hider,
		-- winblend = 10,
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
				width = 0.95,
			},
			horizontal = {
				height = 0.95,
				preview_cutoff = 120,
				preview_width = 0.7,
				prompt_position = "bottom",
				width = 0.95,
			},
		},
		color_devicons = true,
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
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
			theme = "ivy",
		},
		find_files = {
			hidden = true,
			path_display = { "smart" },
			layout_strategy = "vertical",
		},
		live_grep = {
			layout_strategy = "vertical",
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
		fzf = {
			fuzzy = true,
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("dap")
telescope.load_extension("ui-select")
