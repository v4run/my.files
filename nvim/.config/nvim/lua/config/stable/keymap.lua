vim.keymap.set("i", "<C-c>", "<esc>", { desc = "Ctrl-c to Esc" })
vim.keymap.set("o", "<C-c>", "<esc>", { desc = "Ctrl-c to Esc" })
vim.keymap.set(
	"n",
	"n",
	"nzzzv",
	{ desc = "Goto next occurance, move line to center, expand any folds", noremap = true }
)
vim.keymap.set(
	"n",
	"N",
	"Nzzzv",
	{ desc = "Goto next occurance, move line to center, expand any folds", noremap = true }
)
vim.keymap.set("v", "<leader>p", '"_dp', { desc = "Paste without yanking selection", noremap = true })
vim.keymap.set("v", "<leader>P", '"_dP', { desc = "Paste without yanking selection", noremap = true })
vim.keymap.set("v", "<C-j>", ":move '>+1<CR>gv=gv", { desc = "Move the selection one row down" })
vim.keymap.set("v", "<C-k>", ":move '<-2<CR>gv=gv", { desc = "Move the selection one row up" })
vim.keymap.set("v", ">", ">gv", { desc = "Increase indentation the selection", noremap = true })
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indentation the selection", noremap = true })
vim.keymap.set("v", "Y", '"+y', { desc = "Copy to system clipboard", noremap = true })
-- vim.keymap.set("v", "<leader>y", '"cy<cmd>let @+ .= @c<CR>', { desc = "Append to system clipboard" })
vim.keymap.set("n", "<leader>z", ":set wrap!<CR>", { desc = "Toggle word wrap" })
vim.keymap.set("n", "<C-q>", ":confirm bd<CR>", { desc = "Close buffer with confirm" })
vim.keymap.set("n", "<leader>o", ":Neorg<CR>", { desc = "Launch Neorg" })
vim.keymap.set("n", "<leader>.", ":! %<Left><Left>", { desc = "Run a command on the file", noremap = true })
vim.keymap.set(
	"n",
	"<leader>>",
	":new +setlocal\\ bt=nofile\\ bh=wipe\\ nobl\\ noswapfile\\ nu | 0read ! #<Left><Left>",
	{ desc = "Run a command and read output to a new buffer", noremap = true }
)
vim.keymap.set("n", "<C-w><C-z>", "<C-w>|<C-w>_", { desc = "Zoom window", noremap = true })
vim.keymap.set("n", "<C-w>z", "<C-w>=", { desc = "Reset window sizes", noremap = true })
vim.keymap.set("n", "<C-f>", ":bn<CR>", { desc = "Goto next buffer" })
vim.keymap.set("n", "<C-b>", ":bp<CR>", { desc = "Goto previous buffer" })
vim.keymap.set("n", "<C-j>", ":silent! cnext<CR>", { desc = "Display next error in list" })
vim.keymap.set("n", "<C-k>", ":silent! cprevious<CR>", { desc = "Display previous error in list" })

-- Nvimtree
vim.keymap.set("n", "<leader>fe", ":NvimTreeToggle<CR>", { desc = "Toggle Nvimtree" })

-- mini.pick
vim.keymap.set("n", "<leader>ft", ":Pick filetypes<CR>", { desc = "Choose file type" })
vim.keymap.set("n", "<C-s>", ":Pick spellsuggest<CR>", { desc = "Pick spell suggest" })
vim.keymap.set("n", "<leader>/", ":Pick grep_live<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<C-p>", function()
	MiniPick.builtin.cli({
		command = { "fd", "--type=f", "--no-follow", "--color=never", "--hidden" },
		spawn_opts = {
			name = "Files (fd)",
		},
	})
end, { desc = "Find files" })

-- Conform
vim.keymap.set("n", "<leader>ff", "", { desc = "Format code" })

-- harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>h", function()
	harpoon:list():add()
end, { desc = "Harpoon current file" })
vim.keymap.set("n", "<leader>m", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle harpoon menu" })
for i = 1, 9, 1 do
	-- Add <leader>1, <leader>2, .. to select files 1, .. 9
	vim.keymap.set("n", "<leader>" .. i, function()
		harpoon:list():select(i)
	end, { desc = "Select harpooned " .. i })
end
