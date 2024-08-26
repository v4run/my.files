local utils = require("stable.utils")
local nnoremap = utils.nnoremap
local nmap = utils.nmap
local vnoremap = utils.vnoremap
local inoremap = utils.inoremap
local onoremap = utils.onoremap

-- Open file manager
nnoremap("<Leader>fe", "<cmd>NvimTreeToggle<CR>")

-- go to next/previous match, move current line to center, open just enough folds in case
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- send to oblivion
nnoremap("<Leader>d", '"_d')
vnoremap("<Leader>d", '"_d')

-- delete the selected content to void and paste
vnoremap("<Leader>p", '"_dp')
vnoremap("<Leader>P", '"_dP')

-- move selection up or down, reindent and reselect
vnoremap("<C-j>", ":move '>+1<CR>gv=gv")
vnoremap("<C-k>", ":move '<-2<CR>gv=gv")
vnoremap(">", ">gv")
vnoremap("<", "<gv")

-- copy to system clipboard
vnoremap("Y", '"+y')
-- append to system clipboard
vnoremap("<Leader>y", '"cy<cmd>let @+ .= @c<CR>')

-- Toggle wrap
nnoremap("<Leader>z", ":set wrap!<CR>")

-- Run neoformat
nnoremap("<Leader>ff", ":Neoformat<CR>")

-- Select filetype
nnoremap("<Leader>ft", ":Telescope filetypes<CR>")

-- Ctrl-c -> Esc
inoremap("<C-c>", "<esc>")
onoremap("<C-c>", "<esc>")

-- Spelling suggestion
nmap("<C-s>", ":Telescope spell_suggest<CR>")

nmap("<C-p>", ":Telescope find_files<CR>")

nmap("<Leader>/", ":Telescope live_grep<CR>")

-- Switch between buffers
nmap("<C-h>", ":bp<CR>")
nmap("<C-l>", ":bn<CR>")

-- Delete current buffer
nmap("<C-q>", ":confirm bd<CR>")

nmap("<C-j>", ":cnext<CR>")
nmap("<C-k>", ":cprev<CR>")
nmap("<Leader>h", ":cclose<CR>:lclose<CR>")

nmap("<Up>", ":resize +2,<CR>")
nmap("<Down>", ":resize -2,<CR>")
nmap("<S-Up>", ":vertical resize +5,<CR>")
nmap("<S-Down>", ":vertical resize -5,<CR>")

-- Gen ai bindings
nnoremap("<Leader>gep", ":Gen<CR>")
vnoremap("<Leader>gep", ":Gen<CR>")
nnoremap("<Leader>gea", ":Gen Ask<CR>")
vnoremap("<Leader>gea", ":Gen Ask<CR>")
nnoremap("<Leader>gec", ":Gen Chat<CR>")
vnoremap("<Leader>gec", ":Gen Chat<CR>")

nnoremap("<C-w><C-z>", "<C-w>|<C-w>_")
nnoremap("<C-w>z", "<C-w>=")

-- nnoremap("<Leader>lg", ":LazyGit<CR>")
