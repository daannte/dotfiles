local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi
local helpers = require("helpers")

local modules = require("ui.control.modules")

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
				format = "%a, %B %d",
				widget = wibox.widget.textclock,
			},
			spacing = dpi(5),
			layout = wibox.layout.fixed.vertical,
		},
		widget = wibox.container.margin,
		margins = dpi(20),
	},
	shape = helpers.rrect(8),
	bg = beautiful.blue .. "11",
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
				modules.volume_slider,
				layout = wibox.layout.fixed.horizontal,
				spacing = dpi(10),
			},
			{
				{
					image = gears.filesystem.get_configuration_dir() .. "themes/icons/sun.svg",
					stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
					widget = wibox.widget.imagebox,
				},
				modules.brightness_slider,
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
			modules.wifi,
			modules.bluetooth,
			modules.volume,
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

local control = wibox({
	shape = helpers.rrect(8),
	width = dpi(270),
	height = dpi(340),
	bg = beautiful.bg_normal,
	ontop = true,
	visible = false,
})

control:setup({
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
})

awful.placement.bottom_left(control, { honor_workarea = true, margins = { bottom = dpi(30), left = dpi(10) } })

awesome.connect_signal("toggle::control", function()
	control.visible = not control.visible
end)
