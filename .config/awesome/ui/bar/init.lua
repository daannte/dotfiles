local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local modules = require("ui.bar.modules")

screen.connect_signal("request::desktop_decoration", function(s)
	-- Create bar
	s.wibar = awful.wibar({
		screen = s,
		position = "bottom",
		height = dpi(50),
		width = s.geometry.width - beautiful.useless_gap * 4,
		margins = {
			top = 0,
			left = beautiful.useless_gap,
			right = beautiful.useless_gap,
			bottom = beautiful.useless_gap,
		},
		bg = beautiful.bg_normal .. "00",
	})

	-- Setup the bar
	s.wibar:setup({
		{
			{
				{ modules.taglist(s), modules.layout, spacing = dpi(4), layout = wibox.layout.fixed.horizontal },
				widget = wibox.container.margin,
				margins = dpi(8),
			},
			widget = wibox.container.background,
			bg = beautiful.bg_normal,
		},
		nil,
		{
			{ modules.clock, layout = wibox.layout.fixed.horizontal },
			layout = wibox.layout.align.horizontal,
		},
		layout = wibox.layout.align.horizontal,
	})
end)
