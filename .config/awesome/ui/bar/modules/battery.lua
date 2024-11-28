local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local dpi = beautiful.xresources.apply_dpi

local battery = wibox.widget({
	{
		max_value = 100,
		value = 69,
		id = "prog",
		forced_height = dpi(22),
		forced_width = dpi(45),
		paddings = 3,
		border_color = beautiful.fg_normal .. "99",
		background_color = beautiful.bg_focus,
		bar_shape = helpers.rrect(3),
		color = beautiful.blue,
		border_width = 1.25,
		shape = helpers.rrect(5),
		widget = wibox.widget.progressbar,
	},
	{
		{
			bg = beautiful.fg_focus .. "99",
			forced_height = dpi(10),
			forced_width = dpi(2),
			shape = helpers.rrect(10),
			widget = wibox.container.background,
		},
		widget = wibox.container.place,
		valign = "center",
	},
	spacing = dpi(3),
	layout = wibox.layout.fixed.horizontal,
})

awesome.connect_signal("signal::battery", function(capacity)
	local b = battery:get_children_by_id("prog")[1]
	local fill_color = beautiful.green

	if capacity <= 60 then
		fill_color = beautiful.blue
	elseif capacity >= 11 and capacity <= 30 then
		fill_color = beautiful.yellow
	elseif capacity <= 10 then
		fill_color = beautiful.red
	end

	b.value = capacity
	b.color = fill_color
end)

return battery
