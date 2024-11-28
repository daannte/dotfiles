local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local helpers = require("helpers")
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
		{
			icon,
			widget = wibox.container.margin,
			margins = dpi(16),
		},
		{
			markup = "Network",
			id = "name",
			widget = wibox.widget.textbox,
			valign = "center",
			align = "center",
		},
		layout = wibox.layout.fixed.vertical,
	},
	widget = wibox.container.background,
	id = "back",
	bg = beautiful.bg_focus,
	shape = helpers.rrect(8),
})

awesome.connect_signal("signal::network", function(status)
	if status then
		icon.image = wifi_on
		wifi:get_children_by_id("back")[1].bg = beautiful.blue
		wifi:get_children_by_id("name")[1].markup = helpers.colorizeText("Network", beautiful.bg_normal)
		icon.stylesheet = " * { fill: " .. beautiful.bg_normal .. " }"
		wifi:buttons(gears.table.join(awful.button({}, 1, function()
			awful.spawn.with_shell("nmcli radio wifi off")
		end)))
	else
		icon.image = wifi_off
		wifi:get_children_by_id("back")[1].bg = beautiful.bg_focus
		wifi:get_children_by_id("name")[1].markup = helpers.colorizeText("Network", beautiful.fg_normal .. "cc")
		icon.stylesheet = " * { fill: " .. beautiful.fg_normal .. "cc" .. " }"
		wifi:buttons(gears.table.join(awful.button({}, 1, function()
			awful.spawn.with_shell("nmcli radio wifi on")
		end)))
	end
end)

return wifi
