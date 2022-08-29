local lspkind = require("lspkind")
local km = require("varun.keymap")
local snoremap = km.snoremap
local inoremap = km.inoremap
local cmp = require("cmp")
if cmp == nil then
	print("nvim-cmp not installed")
	return
end

local ls = require("luasnip")
ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

-- Jump between snippet positions.
-- TODO: Find a better way
local function jump_next()
	if ls.jumpable(1) then
		return "<Plug>luasnip-expand-or-jump"
	else
		return "<Tab>"
	end
end

local function jump_prev()
	if ls.jumpable(1) then
		return "<Plug>luasnip-jump-prev"
	else
		return "<S-Tab>"
	end
end

inoremap("<S-Tab>", jump_prev, { expr = true })
snoremap("<S-Tab>", jump_prev, { expr = true })
inoremap("<Tab>", jump_next, { expr = true })
snoremap("<Tab>", jump_next, { expr = true })

local cmp_config = {
	snippet = {
		expand = function(args)
			ls.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-n>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
	}, {
		{ name = "buffer" },
	}),
}
if lspkind ~= nil then
	cmp_config["formatting"] = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(--[[entry--]]_, vim_item)
				return vim_item
			end,
		}),
	}
end
cmp.setup(cmp_config)
