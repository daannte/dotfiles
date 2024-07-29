local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local slider = wibox.widget({
	bar_height = dpi(25),
	forced_height = dpi(25),
	handle_width = dpi(8),
	bar_color = beautiful.slider .. "22",
	bar_active_color = beautiful.slider .. "77",
	handle_color = beautiful.slider,
	widget = wibox.widget.slider,
})

local brightness_slider = wibox.widget({
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

awesome.connect_signal("signal::brightness", function(value)
	slider.value = value
end)

slider:connect_signal("property::value", function(_, value)
	awful.spawn.with_shell("brightnessctl s " .. value .. "%")
end)

return brightness_slider
