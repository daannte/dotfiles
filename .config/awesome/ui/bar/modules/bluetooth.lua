local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local bluetooth_on = gears.filesystem.get_configuration_dir() .. "themes/icons/bluetooth.svg"
local bluetooth_off = gears.filesystem.get_configuration_dir() .. "themes/icons/bluetooth-off.svg"

local bluetooth = wibox.widget({
	widget = wibox.widget.imagebox,
	image = bluetooth_on,
	stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
	valign = "center",
	halign = "center",
})

awesome.connect_signal("signal::bluetooth", function(value)
	if value then
		bluetooth.image = bluetooth_on
		bluetooth.stylesheet = " * { fill: " .. beautiful.blue .. " }"
	else
		bluetooth.image = bluetooth_off
		bluetooth.stylesheet = " * { fill: " .. beautiful.fg_minimize .. "99" .. " }"
	end
end)

return bluetooth
