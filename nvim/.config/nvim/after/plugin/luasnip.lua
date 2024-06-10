local ls = require("luasnip")
ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

-- Expand or jump forward
vim.keymap.set({ "i", "s", "v" }, "<C-l>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

-- Jump back
vim.keymap.set({ "i", "s", "v" }, "<C-h>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

-- Cycle between available choice nodes
-- vim.keymap.set("i", "<C-l>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load()
