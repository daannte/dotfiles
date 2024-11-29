local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local modules = require("ui.control.modules")
local helpers = require("helpers")
local dpi = beautiful.xresources.apply_dpi

local sliders = wibox.widget({
	modules.brightness_slider,
	modules.volume_slider,
	layout = wibox.layout.fixed.vertical,
	spacing = dpi(25),
})

local buttons = wibox.widget({
	modules.wifi,
	modules.bluetooth,
	layout = wibox.layout.flex.horizontal,
	spacing = dpi(20),
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
		{
			{
				modules.header,
				widget = wibox.container.margin,
				top = dpi(10),
			},
			sliders,
			buttons,
			layout = wibox.layout.fixed.vertical,
			spacing = dpi(25),
		},
		widget = wibox.container.margin,
		left = dpi(20),
		right = dpi(20),
	},
	widget = wibox.container.background,
	shape = helpers.rrect(12),
	bg = beautiful.bg_normal,
})

awful.placement.bottom_right(control, { honor_workarea = true, margins = 20 })

awesome.connect_signal("toggle::control", function()
	control.visible = not control.visible
end)
