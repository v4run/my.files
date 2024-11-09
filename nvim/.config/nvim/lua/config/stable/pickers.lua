--- @diagnostic disable-next-line
MiniPick.registry.filetypes = function()
	local items = vim.fn.getcompletion("", "filetype")
	table.sort(items)
	local source = { items = items, name = "File Types", choose = function() end }
	local chosen_picker_name = MiniPick.start({ source = source })
	if chosen_picker_name == nil then
		return
	end
	vim.cmd("setlocal filetype=" .. chosen_picker_name)
end
