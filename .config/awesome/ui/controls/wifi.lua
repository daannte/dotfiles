local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

local wifi_on = gears.filesystem.get_configuration_dir() .. "themes/icons/wifi.svg"
local wifi_off = gears.filesystem.get_configuration_dir() .. "themes/icons/wifi-off.svg"

local icon = wibox.widget({
	widget = wibox.widget.imagebox,
	image = wifi_on,
	stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
	valign = "center",
	halign = "center",
})

local wifi = wibox.widget({
	{
		icon,
		widget = wibox.container.margin,
		margins = dpi(14),
	},
	widget = wibox.container.background,
	bg = beautiful.bg_focus,
	shape = gears.shape.rounded_rect,
})

local on = true
wifi:connect_signal("button::press", function()
	on = not on
	if on then
		icon.image = wifi_on
		icon.stylesheet = " * { fill: " .. beautiful.fg_normal .. " }"
		awful.spawn.with_shell("nmcli radio wifi on")
	else
		icon.image = wifi_off
		icon.stylesheet = " * { fill: " .. beautiful.fg_minimize .. " }"
		awful.spawn.with_shell("nmcli radio wifi off")
	end
end)

return wifi
