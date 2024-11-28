local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local modules = require("ui.control.modules")
local helpers = require("helpers")
local dpi = beautiful.xresources.apply_dpi

local buttons = wibox.widget({
	{
		{
			modules.wifi,
			modules.bluetooth,
			spacing = dpi(20),
			layout = wibox.layout.flex.horizontal,
		},
		widget = wibox.container.margin,
		top = dpi(20),
		bottom = dpi(20),
		right = dpi(15),
		left = dpi(15),
	},
	shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
	bg = beautiful.blue .. "11",
})

local control = wibox({
	shape = helpers.rrect(8),
	width = dpi(520),
	height = dpi(760),
	bg = beautiful.bg_normal .. "00",
	ontop = true,
	visible = false,
})

control:setup({
	{
		buttons,
		layout = wibox.layout.flex.vertical,
		spacing = dpi(20),
	},
	widget = wibox.container.margin,
	margins = dpi(20),
})

awful.placement.bottom_right(control, { honor_workarea = true, margins = 20 })

awesome.connect_signal("toggle::control", function()
	control.visible = not control.visible
end)
