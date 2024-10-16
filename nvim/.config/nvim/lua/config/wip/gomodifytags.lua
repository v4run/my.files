local function debug(t)
	print(vim.inspect(t))
end

-- get_command generates the gomodifytags command to be executed
-- @param file_details - Details of buffer like number, filename, content, file size etc.
-- @param cmd - -add-tags / -remove-tags
-- @param tag - the tag to add or remove
local function get_command(file_details, cmd, tag)
	local command = {
		"gomodifytags",
		"-file",
		file_details.file,
		"-line",
		string.format("%d,%d", file_details.line_start, file_details.line_end),
		"-format",
		"json",
		cmd,
		tag,
	}
	if file_details.modified then
		-- if the buffer is not saved, use stdin to add/remove tags
		table.insert(command, "-modified")
	end
	return command
end

-- get the details of the buffer
local function get_buf_details(args)
	local bufnr = 0 -- Current buffer
	local file = vim.api.nvim_buf_get_name(bufnr)
	local line_start, line_end = args.line1, args.line2
	local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local file_size = vim.fn.getfsize(file)
	local modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })
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

-- Execute the command and update the buffer
local function do_cmd(details, cmd)
	local job = vim.fn.jobstart(cmd, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			local resp = vim.json.decode(table.concat(data, ""))
			vim.api.nvim_buf_set_lines(details.bufnr, resp["start"] - 1, resp["end"], false, resp["lines"])
		end,
		on_stderr = function(_, data)
			if not vim.fn.empty(data) then
				debug(data)
			end
		end,
	})
	if details.modified then
		-- buffer contents
		local content = table.concat(details.content, "\n")
		local data = details.file .. "\n" .. #content .. "\n" .. content
		-- Send formatted data to gomodifytags stdin
		vim.fn.chansend(job, data)
		-- Closing stdin
		vim.fn.chanclose(job, "stdin")
	end
end

-- add struct tags
local function add_tags(args)
	local details = get_buf_details(args)
	local tag = args.args
	local cmd = get_command(details, "-add-tags", tag)
	do_cmd(details, cmd)
end

-- remove struct tags
local function remove_tags(args)
	local details = get_buf_details(args)
	local tag = args.args
	local cmd = get_command(details, "-remove-tags", tag)
	do_cmd(details, cmd)
end

vim.api.nvim_create_user_command("GoAddTags", add_tags, { nargs = 1, range = 0 })
vim.api.nvim_create_user_command("GoRemoveTags", remove_tags, { nargs = 1, range = 0 })
