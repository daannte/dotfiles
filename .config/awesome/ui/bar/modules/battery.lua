local wibox = require("wibox")
local awful = require("awful")
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
	{
		battery_bar,
		widget = wibox.container.margin,
		margins = dpi(8),
	},
	bg = beautiful.bg_normal,
	widget = wibox.container.background,
	buttons = {
		awful.button({}, 1, function()
			awesome.emit_signal("toggle::control")
		end),
	},
})

awesome.connect_signal("theme::reload", function()
	battery.bg = beautiful.bg_normal
	awful.spawn.easy_async_with_shell("cat /sys/class/power_supply/BAT1/capacity", function(stdout)
		local capacity = tonumber(stdout)
		awesome.emit_signal("signal::battery", capacity)
	end)
end)

awesome.connect_signal("signal::battery", function(capacity)
	local fill_color = beautiful.green

	if capacity >= 11 and capacity <= 20 then
		fill_color = beautiful.yellow
	elseif capacity <= 10 then
		fill_color = beautiful.red
	end

	battery_bar.value = capacity
	battery_bar.color = fill_color
end)

return battery
