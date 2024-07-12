local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local battery_bar = wibox.widget({
	{
		id = "prog",
		value = 10,
		max_value = 100,
		min_value = 0,
		widget = wibox.widget.progressbar,
		background_color = beautiful.bg_focus,
	},
	forced_width = dpi(10),
	direction = "east",
	layout = wibox.container.rotate,
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
	local b = battery_bar:get_children_by_id("prog")[1]
	local fill_color = beautiful.green

	if capacity >= 11 and capacity <= 20 then
		fill_color = beautiful.warn
	elseif capacity <= 10 then
		fill_color = beautiful.critical
	end

	b.value = capacity
	b.color = fill_color
end)

return battery
