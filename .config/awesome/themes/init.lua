local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local themes_path = gears.filesystem.get_configuration_dir() .. "themes/"
local settings = require("setup").settings
local theme = {}

----- User Sutff -----
theme.pfp = themes_path .. "images/pfp.png"

----- Font & Wallpaper -----
theme.wallpaper = themes_path .. "walls/" .. settings.theme .. ".png"
theme.scheme = settings.theme
theme.mono = "Iosevka"
theme.font = theme.mono .. " 12"

----- General Settings -----
local colors = loadfile(themes_path .. "colors/" .. settings.theme .. ".lua")()

theme.bg_normal = colors.bg
theme.bg_focus = colors.mbg
theme.bg_urgent = colors.bg
theme.bg_minimize = colors.bg
theme.mab = colors.mab

theme.fg_normal = colors.fg
theme.fg_focus = colors.fg
theme.fg_urgent = colors.fg
theme.fg_minimize = colors.fg3

theme.blue = colors.pri
theme.yellow = colors.warn
theme.green = colors.ok
theme.red = colors.err
theme.transparent = "#00000000"

theme.useless_gap = dpi(15)
theme.border_width = dpi(0)
theme.border_color = colors.border

theme.taglist_bg = theme.bg_normal .. "00"
theme.taglist_bg_focus = theme.blue
theme.taglist_fg_focus = theme.fg_normal
theme.taglist_bg_empty = theme.fg_minimize .. "33"
theme.taglist_fg_empty = theme.fg_normal
theme.taglist_bg_occupied = theme.fg_minimize .. "33"
theme.taglist_fg_occupied = theme.fg_normal

theme.titlebar_bg_focus = theme.bg_focus
theme.titlebar_bg_normal = theme.mab

-- theme.slider = theme.fg_minimize

theme.back_icon = gears.filesystem.get_configuration_dir() .. "themes/icons/back.svg"
theme.next_icon = gears.filesystem.get_configuration_dir() .. "themes/icons/next.svg"
theme.close_icon = gears.filesystem.get_configuration_dir() .. "themes/icons/x.svg"
theme.check_icon = gears.filesystem.get_configuration_dir() .. "themes/icons/check.svg"

return theme
