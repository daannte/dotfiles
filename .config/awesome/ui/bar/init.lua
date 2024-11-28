local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local helpers = require("helpers")
local modules = require("ui.bar.modules")

screen.connect_signal("request::desktop_decoration", function(s)
	-- Create bar
	s.wibar = awful.wibar({
		screen = s,
		position = "bottom",
		width = dpi(1920),
		height = dpi(40),
		bg = beautiful.bg_normal,
		fg = beautiful.fg_normal,
	})

	-- Setup the bar
	s.wibar:setup({
		{
			{
				{
					modules.dash,
					{
						modules.taglist(s),
						layout = wibox.layout.align.horizontal,
					},
					spacing = dpi(15),
					layout = wibox.layout.fixed.horizontal,
				},
				widget = wibox.container.place,
				valign = "center",
			},
			widget = wibox.container.margin,
			left = dpi(15),
		},
		nil,
		{
			{
				{
					{
						{
							modules.battery,
							modules.wifi,
							modules.bluetooth,
							spacing = dpi(15),
							layout = wibox.layout.fixed.horizontal,
						},
						widget = wibox.container.margin,
						top = dpi(10),
						bottom = dpi(10),
						left = dpi(10),
						right = dpi(10),
					},
					widget = wibox.container.background,
					shape = helpers.rrect(5),
					bg = beautiful.bg_focus,
					buttons = {
						awful.button({}, 1, function()
							awesome.emit_signal("toggle::control")
						end),
					},
				},
				modules.clock,
				layout = wibox.layout.align.horizontal,
				spacing = dpi(10),
			},
			widget = wibox.container.place,
			valign = "center",
		},
		layout = wibox.layout.align.horizontal,
	})
end)
