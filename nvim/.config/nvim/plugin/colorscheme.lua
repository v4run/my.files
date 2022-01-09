local nightfox = require('nightfox')
vim.o.background = "dark"

nightfox.setup({
  fox = "nordfox", -- Which fox style should be applied
  transparent = true, -- Disable setting the background color
  alt_nc = false, -- Non current window bg to alt color see `hl-NormalNC`
  terminal_colors = true, -- Configure the colors used when opening :terminal
  styles = {
    comments = "italic", -- Style that is applied to comments: see `highlight-args` for options
    functions = "italic", -- Style that is applied to functions: see `highlight-args` for options
    keywords = "bold", -- Style that is applied to keywords: see `highlight-args` for options
    -- strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
    -- variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
  },
  inverse = {
    match_paren = true, -- Enable/Disable inverse highlighting for match parens
    visual = false, -- Enable/Disable inverse highlighting for visual selection
    search = false, -- Enable/Disable inverse highlights for search highlights
  },
  -- colors = {}, -- Override default colors
  hlgroups = {
	  Pmenu = { bg = "#3e4655" },
	  PmenuSel = { bg = "#353B49" },
	  WildMenu = { bg = "#353B49" },
	  NormalFloat = { bg = "#353B49" },
	  TelescopeNormal = { bg = "#3e4655" },
	  TelescopeBorder = { bg = "#3e4655" },
	  NvimTreeNormal = { bg = "NONE" },
  }, -- Override highlight groups
})
nightfox.load()

