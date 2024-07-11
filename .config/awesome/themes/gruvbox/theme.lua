local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local iconpath = gears.filesystem.get_configuration_dir() .. "themes/icons/"

local theme = {}

theme.font = "Maple Mono NF 12"
theme.font_name = "Maple Mono NF "

theme.bg_normal = "#282828"
theme.bg_focus = "#323232"
theme.bg_subtle = "#e3e5ea"
theme.bg_urgent = "#323232"
theme.bg_minimize = "#323232"
theme.bg_dark = "#323232"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#d4be98"
theme.fg_focus = "#d4be98"
theme.fg_urgent = "#d4be98"
theme.fg_minimize = "#727269"

theme.useless_gap = dpi(15)
theme.border_width = dpi(0)
theme.border_color_normal = theme.bg_normal
theme.border_color_active = theme.bg_normal
theme.border_color_marked = theme.bg_normal

theme.blue = "#82a9a0"

theme.green = "#a3ae6d"
theme.warn = "#cba364"
theme.critical = "#d67b76"

theme.titlebar_bg_focus = theme.bg_focus
theme.titlebar_bg_normal = theme.bg_subtle

theme.taglist_fg_empty = theme.fg_minimize

theme.slider_active_color = theme.fg_minimize
theme.slider_handle_color = theme.fg_minimize

theme.control_button_active_bg = theme.bg_focus
theme.control_button_active_fg = theme.fg_normal
theme.control_button_normal_bg = theme.bg_normal
theme.control_button_normal_fg = theme.fg_normal

theme.wallpaper = gears.filesystem.get_configuration_dir() .. "themes/gruvbox/street_london.jpg"
gears.wallpaper.maximized(theme.wallpaper)

theme.layout_floating = iconpath .. "floating.png"
theme.layout_tile = iconpath .. "tile.png"

return theme
