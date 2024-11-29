local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local helpers = require("helpers")
local dpi = beautiful.xresources.apply_dpi

local bluetooth_on = gears.filesystem.get_configuration_dir() .. "themes/icons/bluetooth.svg"
local bluetooth_off = gears.filesystem.get_configuration_dir() .. "themes/icons/bluetooth-off.svg"

local icon = wibox.widget({
	widget = wibox.widget.imagebox,
	image = bluetooth_on,
	stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
	valign = "center",
	halign = "center",
	forced_height = dpi(32),
	forced_width = dpi(32),
})

local bluetooth = wibox.widget({
	{
		{
			{
				icon,
				widget = wibox.container.margin,
				margins = dpi(16),
			},
			{
				markup = "Bluetooth",
				id = "name",
				widget = wibox.widget.textbox,
				valign = "center",
				align = "center",
			},
			layout = wibox.layout.fixed.vertical,
		},
		widget = wibox.container.margin,
		bottom = dpi(16),
	},
	widget = wibox.container.background,
	id = "back",
	bg = beautiful.bg_focus,
	shape = helpers.rrect(8),
})

awesome.connect_signal("signal::bluetooth", function(status)
	if status then
		icon.image = bluetooth_on
		bluetooth:get_children_by_id("back")[1].bg = beautiful.blue
		bluetooth:get_children_by_id("name")[1].markup = helpers.colorizeText("Bluetooth", beautiful.bg_normal)
		icon.stylesheet = " * { fill: " .. beautiful.bg_normal .. " }"
		bluetooth:buttons(gears.table.join(awful.button({}, 1, function()
			awful.spawn.with_shell("bluetoothctl power off")
		end)))
	else
		icon.image = bluetooth_off
		bluetooth:get_children_by_id("back")[1].bg = beautiful.bg_focus
		bluetooth:get_children_by_id("name")[1].markup = helpers.colorizeText("Bluetooth", beautiful.fg_normal .. "cc")
		icon.stylesheet = " * { fill: " .. beautiful.fg_normal .. "cc" .. " }"
		bluetooth:buttons(gears.table.join(awful.button({}, 1, function()
			awful.spawn.with_shell("bluetoothctl power on")
		end)))
	end
end)

return bluetooth
