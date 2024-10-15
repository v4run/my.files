local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Iosevka")
config.color_scheme = "Gruvbox Material (Gogh)"
config.font_size = 17
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.window_padding = {
	left = "5px",
	right = "0px",
	top = "5px",
	bottom = "0px",
}

return config
