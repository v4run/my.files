-- slightly modified version of TJ DeVries's execute anything script

local split_types = { v = "vsplit", h = "split" }

-- splits the window horizontally or vertically depending on type
-- if parent is specified, that window is set as the current window
local function split_window(type, parent)
	if parent then
		vim.api.nvim_set_current_win(parent)
	end
	vim.cmd(split_types[type])
	-- vim.api.nvim_win_set_cursor
	return vim.api.nvim_get_current_win()
end

-- format the output window
local function prepare_output_window(win_id)
	vim.api.nvim_win_set_option(win_id, "number", false)
	vim.api.nvim_win_set_option(win_id, "relativenumber", false)
	vim.api.nvim_win_set_option(win_id, "cursorline", false)
	vim.api.nvim_win_set_option(win_id, "list", false)
	vim.api.nvim_win_set_option(win_id, "cursorcolumn", false)
end

local function start(target_bufnr, command)
	-- find the current window to set active later
	local cur_win = vim.api.nvim_get_current_win()
	--
	-- Create a new unlisted scratch buffer for output
	local output_bufnr = vim.api.nvim_create_buf(false, true)

	-- create a new window for the output buffer
	local output_win = split_window("v")
	prepare_output_window(output_win)
	-- set the initial window as active
	vim.api.nvim_set_current_win(cur_win)
	vim.api.nvim_win_set_buf(output_win, output_bufnr)

	local function clear_buffer(bufnr)
		vim.api.nvim_buf_set_text(bufnr, 0, 0, -1, 0, {})
	end

	-- replaces the content in buffer bufnr with data
	local function write_data(bufnr, data)
		if data then
			vim.api.nvim_buf_set_text(bufnr, -1, 0, -1, 0, data)
		end
	end

	-- for storing job.
	-- only one job is run at a time
	-- if another job is triggered, the previous job will be stopped
	local job = nil

	local group = vim.api.nvim_create_augroup("liveoutput_buffer", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = group,
		-- pattern = pattern,
		buffer = target_bufnr,
		callback = function()
			if job ~= nil then
				-- stop any running job
				vim.fn.jobstop(job)
			end
			clear_buffer(output_bufnr)
			job = vim.fn.jobstart(command, {
				stderr_buffered = true,
				on_stdout = function(_, data)
					write_data(output_bufnr, data)
				end,
				on_stderr = function(_, data)
					write_data(output_bufnr, data)
				end,
			})
		end,
	})
end

local function start_live_output()
	local cur_bufnr = vim.api.nvim_get_current_buf()
	vim.ui.input({ prompt = "Enter the command to run: " }, function(input)
		local command = vim.split(input, " ")
		for k, v in ipairs(command) do
			-- expand the items to parse the values like %, :p, etc.
			command[k] = vim.fn.expand(v)
		end
		start(cur_bufnr, command)
	end)
end

vim.api.nvim_create_user_command("SLO", start_live_output, {})
