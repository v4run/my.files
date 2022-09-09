local arguments = {
	add = "-add-tags",
	remove = "-remove-tags",
}

local function get_command(file_details, cmd, tag)
	local command = {
		"gomodifytags",
		"-file",
		file_details.file,
		"-line",
		string.format("%d,%d", file_details.line_start, file_details.line_end),
		"-format",
		"json",
		arguments[cmd],
		tag,
	}
	if file_details.modified then
		table.insert(command, "-modified")
	end
	return command
end

local function get_buf_details(args)
	local bufnr = 0 -- Current buffer
	local file = vim.api.nvim_buf_get_name(bufnr)
	local line_start = args.line1
	local line_end = args.line2
	local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local file_size = vim.fn.getfsize(file)
	local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
	return {
		bufnr = bufnr,
		file = file,
		line_start = line_start,
		line_end = line_end,
		content = content,
		file_size = file_size,
		modified = modified,
	}
end

local function do_cmd(details, cmd)
	vim.api.nvim_command("write")
	local job = vim.fn.jobstart(cmd, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			local resp = vim.json.decode(table.concat(data, ""))
			vim.api.nvim_buf_set_lines(details.bufnr, details.line_start - 1, details.line_end, false, resp.lines)
			vim.api.nvim_command("write")
		end,
	})
	_ = job
	-- if details.modified then
	-- 	local data = { details.file, details.file_size }
	-- 	table.move(details.content, 1, #details.content, #data + 1, data)
	-- 	vim.fn.chansend(job, data)
	-- end
end

local function add_tags(args)
	local details = get_buf_details(args)
	local tag = args.args
	local cmd = get_command(details, "add", tag)
	do_cmd(details, cmd)
end

local function remove_tags(args)
	local details = get_buf_details(args)
	local tag = args.args
	local cmd = get_command(details, "remove", tag)
	do_cmd(details, cmd)
end

vim.api.nvim_create_user_command("GoAddTags", add_tags, { nargs = 1, range = 0 })
vim.api.nvim_create_user_command("GoRemoveTags", remove_tags, { nargs = 1, range = 0 })
