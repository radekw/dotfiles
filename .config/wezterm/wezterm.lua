local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 12
config.window_close_confirmation = "NeverPrompt"
return config

