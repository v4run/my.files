" ~/.config/nvim/plugin
" Basic Settings
set showmatch " show matching bracket for a brief moment
set autowrite " auto write buffer to file on some commands
set ignorecase " ignore case by default when searching
set nohlsearch " dont highlight all matches
set incsearch " highlight during search
set tabstop=4 " number of spaces for a tab
set softtabstop=0 " disable soft tab
set autoindent	" use previous line's indent
set shiftwidth=4 " number of spaces for autoindent
set number " add line number
set relativenumber " enable relative numbering
set wildmenu
set wildmode=longest:full,full " on first tab complete till longest common pattern, on next show a full menu
set cursorline " highlight the current line
set ttyfast " indicates a fast terminal connection [removed in neovim]
set scrolloff=1 " keep N lines above or below when scrolling
set showcmd " show the partial command in last line. eg. for diw show di till w is pressed
set showmode " show the current mode
set splitright " put new window on right side on vsplit
set splitbelow " put new window below on split
set noerrorbells " disable bell on error
set termguicolors " enable 24-bit color
set noshowmode " don't show current mode [will be displayed in the status line]
set nowrap " don't wrap the line
set completeopt=menu,menuone,noselect " insert mode completion menu
set list listchars=tab:\│\  " adding set indent guide lines (there is a space after second \)
" set cursorcolumn " highlight the current col
" set colorcolumn=120 " add a vertical line at column
set cmdheight=1
set updatetime=100
set undodir=~/.vim/undodir " directory to store undo files
set undofile " enable undo files. allow undo across restarts
set noswapfile " disable creating swap file

filetype plugin on " enable loading plugin files for the file type
filetype indent on " enable loading indent files for the file type

let mapleader = ' '

" Function removes all trailing white spaces
function! RemoveTrailingWhiteSpaces()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfunction

" Autoformat on write
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

au BufWritePre * call RemoveTrailingWhiteSpaces() " Automatically remove trailing white spaces on save
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mhinz/vim-signify'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'APZelos/blamer.nvim'
Plug 'sbdchd/neoformat'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'joshdick/onedark.vim'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'tpope/vim-commentary'
Plug 'mfussenegger/nvim-dap'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'rafamadriz/friendly-snippets'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
call plug#end()

