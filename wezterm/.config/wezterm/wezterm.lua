local wezterm = require("wezterm")
local config = {}
config.font = wezterm.font("Iosevka")
config.color_scheme = "Monokai Remastered"
config.font_size = 16
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.window_padding = {
	left = "0px",
	right = "0px",
	top = "0px",
	bottom = "0px",
}
config.max_fps = 144
config.colors = {
	background = "#040001",
	cursor_bg = "#ffd866",
	cursor_border = "#ffd866",
}
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
		else
			overrides.font_size = number_value
		end
	end
	window:set_config_overrides(overrides)
end)
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.window_decorations = "RESIZE"
	config.default_prog = { "powershell.exe" }
	config.wsl_domains = {
		{
			name = "Ubuntu",
			distribution = "Ubuntu",
			username = "varun",
			default_cwd = "/home/varun",
		},
	}
	config.default_domain = "Ubuntu"
end
return config
