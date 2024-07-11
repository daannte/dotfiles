local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local textclock = wibox.widget({
	widget = wibox.widget.textclock,
	refresh = 20,
	align = "center",
	format = "<span>%H:%M</span>",
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

-- Show date on hover
awful.tooltip({
	objects = { clock },
	timer_function = function()
		return os.date("%B %d, %Y")
	end,
})

return clock
