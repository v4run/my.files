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
return config
