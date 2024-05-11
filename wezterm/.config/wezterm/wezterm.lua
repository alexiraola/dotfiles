local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("Fira Code")
config.font_size = 12
config.color_scheme = "Catppuccin Mocha"

config.enable_tab_bar = false

-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 8
config.window_padding = {
	left = "2cell",
	right = "2cell",
	top = "1cell",
	bottom = "1cell",
}

return config
