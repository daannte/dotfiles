local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local slider = wibox.widget({
	bar_height = dpi(25),
	forced_height = dpi(25),
	handle_width = dpi(10),
	bar_color = "#00000000",
	bar_active_color = beautiful.slider_active_color,
	handle_color = beautiful.slider_handle_color,
	widget = wibox.widget.slider,
})

local vol_slider = wibox.widget({
	{
		max_value = 100,
		value = slider.value,
		forced_height = dpi(25),
		background_color = beautiful.bg_focus,
		widget = wibox.widget.progressbar,
	},
	slider,
	layout = wibox.layout.stack,
})

awesome.connect_signal("signal::volume", function(value)
	slider.value = value
end)

slider:connect_signal("property::value", function(_, value)
	awful.spawn.with_shell("pamixer --set-volume " .. value)
end)

return vol_slider
