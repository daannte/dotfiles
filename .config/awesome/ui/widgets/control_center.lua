local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi
local helpers = require("helpers")

local controls = require("ui.controls")

local cal = wibox.widget({
	{
		{
			{
				align = "center",
				markup = "<span foreground='" .. beautiful.fg_normal .. "'><b>Welcome, " .. os.getenv("USER")
					:gsub("^%l", string.upper) .. "</b></span>",
				widget = wibox.widget.textbox,
			},
			{
				align = "center",
				format = "%A, %B %e",
				refresh = 1,
				widget = wibox.widget.textclock,
			},
			spacing = dpi(5),
			layout = wibox.layout.fixed.vertical,
		},
		widget = wibox.container.margin,
		margins = dpi(20),
	},
	shape = helpers.rrect(8),
	bg = beautiful.blue .. "10",
	fg = beautiful.fg_minimize,
	widget = wibox.container.background,
})

local sliders = wibox.widget({
	{
		{
			{
				{
					image = gears.filesystem.get_configuration_dir() .. "themes/icons/volume-2.svg",
					stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
					widget = wibox.widget.imagebox,
				},
				controls.volume_slider,
				layout = wibox.layout.fixed.horizontal,
				spacing = dpi(10),
			},
			{
				{
					image = gears.filesystem.get_configuration_dir() .. "themes/icons/sun.svg",
					stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
					widget = wibox.widget.imagebox,
				},
				controls.brightness_slider,
				layout = wibox.layout.fixed.horizontal,
				spacing = dpi(10),
			},
			layout = wibox.layout.flex.vertical,
			spacing = dpi(10),
		},
		widget = wibox.container.margin,
		margins = dpi(20),
	},
	shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
	bg = beautiful.blue .. "11",
})

local buttons = wibox.widget({
	{
		{
			controls.wifi,
			controls.bluetooth,
			controls.volume,
			spacing = dpi(10),
			layout = wibox.layout.flex.horizontal,
		},
		widget = wibox.container.margin,
		top = dpi(20),
		bottom = dpi(20),
		right = dpi(15),
		left = dpi(15),
	},
	shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
	bg = beautiful.blue .. "11",
})

local control_center = awful.popup({
	widget = {
		{
			{
				cal,
				layout = wibox.layout.flex.vertical,
				spacing = dpi(20),
			},
			sliders,
			buttons,
			layout = wibox.layout.flex.vertical,
			spacing = dpi(20),
		},
		widget = wibox.container.margin,
		margins = dpi(20),
		forced_width = dpi(270),
		forced_height = dpi(340),
	},
	shape = gears.shape.rounded_rect,
	visible = false,
	ontop = true,
	bg = beautiful.bg_normal,
	placement = function(c)
		(awful.placement.bottom_left)(c, { margins = { bottom = dpi(20), left = dpi(80) } })
	end,
})

control_center.toggle = function()
	control_center.visible = not control_center.visible
end

return control_center
