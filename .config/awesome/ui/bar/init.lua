local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local modules = require("ui.bar.modules")

screen.connect_signal("request::desktop_decoration", function(s)
	-- Create bar
	s.wibar = awful.wibar({
		screen = s,
		position = "left",
		width = dpi(50),
		height = s.geometry.height - beautiful.useless_gap * 4,
		margins = {
			top = beautiful.useless_gap,
			left = beautiful.useless_gap,
			right = 0,
			bottom = beautiful.useless_gap,
		},
		bg = beautiful.bg_normal .. "00",
	})

	-- Setup the bar
	s.wibar:setup({
		{
			{
				{ modules.taglist(s), modules.layout, spacing = dpi(4), layout = wibox.layout.fixed.vertical },
				widget = wibox.container.margin,
				margins = dpi(8),
			},
			widget = wibox.container.background,
			bg = beautiful.bg_normal,
		},
		nil,
		{
			{
				modules.battery,
				modules.clock,
				spacing = dpi(10),
				layout = wibox.layout.fixed.vertical,
			},
			layout = wibox.layout.align.vertical,
		},
		layout = wibox.layout.align.vertical,
	})
end)
