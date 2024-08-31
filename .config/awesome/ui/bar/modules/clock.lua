local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local textclock = wibox.widget({
	widget = wibox.widget.textclock,
	align = "center",
	format = "%H\n%M",
	font = beautiful.font .. " Bold",
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

awesome.connect_signal("theme::reload", function()
	clock.bg = beautiful.bg_normal
end)

return clock
