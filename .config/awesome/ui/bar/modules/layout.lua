local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local layouts = awful.widget.layoutbox({
	buttons = {
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
	},
})

local widget = {
	{
		{
			layouts,
			widget = wibox.container.place,
			align = "center",
			valign = "center",
		},
		widget = wibox.container.margin,
		margins = dpi(6),
	},
	bg = beautiful.bg_focus,
	forced_height = dpi(30),
	widget = wibox.container.background,
}

return widget
