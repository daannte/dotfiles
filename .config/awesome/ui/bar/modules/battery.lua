local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local battery_bar = wibox.widget({
	value = 10,
	max_value = 100,
	min_value = 0,
	widget = wibox.widget.progressbar,
	background_color = beautiful.bg_focus,
	forced_height = dpi(10),
})

local battery = wibox.widget({
	bg = beautiful.bg_normal,
	widget = wibox.container.background,
	{
		battery_bar,
		widget = wibox.container.margin,
		margins = dpi(8),
	},
})

awesome.connect_signal("signal::battery", function(capacity)
	local fill_color = beautiful.green

	if capacity >= 11 and capacity <= 20 then
		fill_color = beautiful.warn
	elseif capacity <= 10 then
		fill_color = beautiful.critical
	end

	battery_bar.value = capacity
	battery_bar.color = fill_color
end)

return battery
