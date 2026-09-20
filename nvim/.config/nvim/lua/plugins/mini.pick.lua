return {
	"echasnovski/mini.pick",
	version = "*",
	opts = {
		-- Delays (in ms; should be at least 1)
		delay = {
			-- Delay between forcing asynchronous behavior
			async = 10,

			-- Delay between computation start and visual feedback about it
			busy = 50,
		},

		-- Keys for performing actions. See `:h MiniPick-actions`.
		mappings = {
			caret_left = "<Left>",
			caret_right = "<Right>",

			choose = "<CR>",
			choose_in_split = "<C-s>",
			choose_in_tabpage = "<C-t>",
			choose_in_vsplit = "<C-v>",
			choose_marked = "<C-CR>",

			delete_char = "<BS>",
			delete_char_right = "<Del>",
			delete_left = "<C-o>",
			delete_word = "<C-w>",

			mark = "<C-x>",
			mark_all = "<C-a>",

			move_down = "<C-j>",
			move_start = "<C-g>",
			move_up = "<C-k>",

			paste = "<C-r>",

			refine = "<C-Space>",
			refine_marked = "<M-Space>",

			scroll_down = "<C-d>",
			scroll_left = "<C-h>",
			scroll_right = "<C-l>",
			scroll_up = "<C-u>",

			stop = "<Esc>",

			toggle_info = "<S-Tab>",
			toggle_preview = "<Tab>",
		},

		-- General options
		options = {
			-- Whether to show content from bottom to top
			content_from_bottom = false,

			-- Whether to cache matches (more speed and memory on repeated prompts)
			use_cache = false,
		},

		-- Source definition. See `:h MiniPick-source`.
		source = {
			items = nil,
			name = nil,
			cwd = nil,

			match = nil,
			show = function(buf_id, items, query)
				MiniPick.default_show(buf_id, items, query, { show_icons = true })
			end,
			preview = nil,

			choose = nil,
			choose_marked = nil,
		},

		-- Window related options
		window = {
			-- Float window config (table or callable returning it)
			config = nil,

			-- String to use as cursor in prompt
			prompt_caret = "▏",

			-- String to use as prefix in prompt
			prompt_prefix = "> ",
		},
	},
	init = function()
		vim.ui.select = require("mini.pick").ui_select
	end,
	config = function(_, opts)
		local pick = require("mini.pick")
		pick.setup(opts)

		-- Make terminal paste (Cmd+V) work inside a picker. mini.pick's own
		-- `vim.paste` override only accepts single-call pastes (phase == -1),
		-- but the TUI streams bracketed pastes as phases 1/2/3. Buffer the
		-- chunks and hand them over as one non-streaming paste, which mini.pick
		-- then inserts at the caret exactly like `<C-r>+`.
		local paste = vim.paste
		local chunks = {}
		vim.paste = function(lines, phase)
			if phase == -1 or not pick.is_picker_active() then
				return paste(lines, phase)
			end
			if phase == 1 then
				chunks = {}
			end
			-- A chunk's first line continues the previous chunk's last line.
			if #chunks > 0 then
				chunks[#chunks] = chunks[#chunks] .. (lines[1] or "")
				vim.list_extend(chunks, lines, 2)
			else
				vim.list_extend(chunks, lines)
			end
			if phase == 3 then
				local all = chunks
				chunks = {}
				return paste(all, -1)
			end
			return true
		end
	end,
}
