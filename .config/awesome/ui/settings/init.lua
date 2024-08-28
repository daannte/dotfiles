local awful = require("awful")
local wibox = require("wibox")
local helpers = require("helpers")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local settings = wibox({
	shape = helpers.rrect(12),
	width = dpi(520),
	height = dpi(680),
	bg = beautiful.bg_normal,
	ontop = true,
	visible = false,
})

awful.placement.centered(settings, { honor_workarea = true })

awesome.connect_signal("toggle::settings", function()
	settings.visible = not settings.visible
end)
