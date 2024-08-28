local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

local volume_on = gears.filesystem.get_configuration_dir() .. "themes/icons/volume-2.svg"
local volume_off = gears.filesystem.get_configuration_dir() .. "themes/icons/volume-x.svg"

local icon = wibox.widget({
	widget = wibox.widget.imagebox,
	image = volume_on,
	stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
	valign = "center",
	halign = "center",
})

local volume = wibox.widget({
	{
		icon,
		widget = wibox.container.margin,
		margins = dpi(14),
	},
	widget = wibox.container.background,
	bg = beautiful.mab,
	shape = gears.shape.rounded_rect,
})

local on = true
volume:connect_signal("button::press", function()
	on = not on
	if on then
		icon.image = volume_on
		icon.stylesheet = " * { fill: " .. beautiful.fg_normal .. " }"
		awful.spawn.with_shell("pamixer -t")
	else
		icon.image = volume_off
		icon.stylesheet = " * { fill: " .. beautiful.fg_minimize .. " }"
		awful.spawn.with_shell("pamixer -t")
	end
end)

return volume
