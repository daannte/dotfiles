local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local wifi_on = gears.filesystem.get_configuration_dir() .. "themes/icons/wifi.svg"
local wifi_off = gears.filesystem.get_configuration_dir() .. "themes/icons/wifi-off.svg"

local wifi = wibox.widget({
	widget = wibox.widget.imagebox,
	image = wifi_on,
	stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
	valign = "center",
	halign = "center",
})

awesome.connect_signal("signal::network", function(value)
	if value then
		wifi.image = wifi_on
		wifi.stylesheet = " * { fill: " .. beautiful.fg_normal .. " }"
	else
		wifi.image = wifi_off
		wifi.stylesheet = " * { fill: " .. beautiful.fg_minimize .. "99" .. " }"
	end
end)

return wifi
