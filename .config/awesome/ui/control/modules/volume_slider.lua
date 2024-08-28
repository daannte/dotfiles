local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")
local helpers = require("helpers")

local createHandle = function()
	return function(cr)
		gears.shape.rounded_rect(cr, 16, 16, 15)
	end
end

local slider = wibox.widget({
	bar_height = dpi(12),
	forced_height = dpi(35),
	handle_width = dpi(16),
	bar_shape = helpers.rrect(25),
	handle_shape = createHandle(),
	handle_margins = { top = dpi(1) },
	bar_color = beautiful.slider .. "22",
	bar_active_color = beautiful.slider .. "77",
	handle_color = beautiful.slider,
	widget = wibox.widget.slider,
})

local vol_slider = wibox.widget({
	{
		max_value = 100,
		value = slider.value,
		forced_height = dpi(35),
		background_color = beautiful.transparent,
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
