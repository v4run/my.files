local keymap = require("varun.keymap")
local nnoremap = keymap.nnoremap
local nmap = keymap.nmap
local vnoremap = keymap.vnoremap
local inoremap = keymap.inoremap
local onoremap = keymap.onoremap

-- Open netrw
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

-- copy to system clipboard
vnoremap("Y", '"+y')

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
nmap("<C-q>", ":bd<CR>")

nmap("<C-j>", ":cnext<CR>")
nmap("<C-k>", ":cprev<CR>")
nmap("<Leader>h", ":cclose<CR>:lclose<CR>")
