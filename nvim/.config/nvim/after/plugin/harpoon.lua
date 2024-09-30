local harpoon = require("harpoon")
local utils = require("stable.utils")
local nnoremap = utils.nnoremap

-- REQUIRED
harpoon:setup()
-- REQUIRED

nnoremap("<leader>h", function()
	harpoon:list():add()
end)
nnoremap("<C-S-M>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

nnoremap("<Leader>1", function()
	harpoon:list():select(1)
end)
nnoremap("<Leader>2", function()
	harpoon:list():select(2)
end)
nnoremap("<Leader>3", function()
	harpoon:list():select(3)
end)
nnoremap("<Leader>4", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
nnoremap("<C-S-H>", function()
	harpoon:list():prev()
end)
nnoremap("<C-S-L>", function()
	harpoon:list():next()
end)
