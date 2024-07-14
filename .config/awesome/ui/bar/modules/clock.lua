local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local textclock = wibox.widget({
	widget = wibox.widget.textclock,
	refresh = 20,
	align = "center",
	format = "<span>%H\n%M</span>",
	font = beautiful.font_name .. "Bold",
})

local clock = wibox.widget({
	{
		textclock,
		widget = wibox.container.margin,
		margins = dpi(8),
	},
	widget = wibox.container.background,
	bg = beautiful.bg_normal,
})

return clock
