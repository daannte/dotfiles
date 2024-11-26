local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local helpers = require("helpers")

local textclock = wibox.widget({
	widget = wibox.widget.textclock,
	align = "center",
	valign = "center",
	format = "%H:%M",
})

local date = wibox.widget({
	widget = wibox.widget.textclock,
	align = "center",
	valign = "center",
	format = "%B %d",
})

local clock = wibox.widget({
	{
		{
			{
				textclock,
				widget = wibox.container.place,
				valign = "center",
			},
			{
				date,
				widget = wibox.container.place,
				valign = "center",
			},
			layout = wibox.layout.fixed.horizontal,
			spacing = dpi(10),
		},
		widget = wibox.container.margin,
		margins = { left = dpi(10), right = dpi(10) },
	},
	widget = wibox.container.background,
	bg = beautiful.bg_focus,
	shape = helpers.rrect(2),
})

return clock
