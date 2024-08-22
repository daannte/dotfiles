local beautiful = require("beautiful")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local themes_path = gears.filesystem.get_configuration_dir() .. "themes/"
local theme = {}

----- Font & Wallpaper -----
theme.wallpaper = themes_path .. "walls/" .. Config.theme .. ".png"
theme.mono = "Maple Mono NF"
theme.font = theme.mono .. " 12"

----- General Settings -----
local colors = loadfile(themes_path .. "colors/" .. Config.theme .. ".lua")()

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
theme.taglist_bg_focus = theme.bg_normal
theme.taglist_fg_focus = theme.blue
theme.taglist_fg_empty = colors.comm

theme.titlebar_bg_focus = colors.mbg
theme.titlebar_bg_normal = colors.mab

theme.slider = theme.fg_minimize

beautiful.init(theme)
