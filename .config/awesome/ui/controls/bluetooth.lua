local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

local bluetooth_on = gears.filesystem.get_configuration_dir() .. "themes/icons/bluetooth.svg"
local bluetooth_off = gears.filesystem.get_configuration_dir() .. "themes/icons/bluetooth-off.svg"

local icon = wibox.widget({
	widget = wibox.widget.imagebox,
	image = bluetooth_on,
	stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
	valign = "center",
	halign = "center",
})

local bluetooth = wibox.widget({
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
bluetooth:connect_signal("button::press", function()
	on = not on
	if on then
		icon.image = bluetooth_on
		icon.stylesheet = " * { fill: " .. beautiful.fg_normal .. " }"
		awful.spawn.with_shell("bluetoothctl power on")
	else
		icon.image = bluetooth_off
		icon.stylesheet = " * { fill: " .. beautiful.fg_minimize .. " }"
		awful.spawn.with_shell("bluetoothctl power off")
	end
end)

return bluetooth
