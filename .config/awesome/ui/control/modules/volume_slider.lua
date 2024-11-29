local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")
local helpers = require("helpers")

local volume_on = gears.filesystem.get_configuration_dir() .. "themes/icons/volume.svg"
local volume_off = gears.filesystem.get_configuration_dir() .. "themes/icons/volume-off.svg"

local createHandle = function()
	return function(cr)
		gears.shape.rounded_rect(cr, 16, 16, 15)
	end
end

local slider = wibox.widget({
	bar_shape = helpers.rrect(15),
	bar_height = dpi(3),
	handle_color = beautiful.bg_normal,
	bar_color = beautiful.bg_normal .. "00",
	bar_active_color = beautiful.fg_normal,
	handle_shape = createHandle(),
	handle_border_width = dpi(2),
	handle_margins = { top = dpi(9) },
	handle_border_color = beautiful.fg_normal,
	value = 25,
	forced_height = dpi(35),
	maximum = 100,
	widget = wibox.widget.slider,
})

local label = wibox.widget({
	font = beautiful.mono .. " Bold 12",
	markup = "86" .. "%",
	valign = "center",
	widget = wibox.widget.textbox,
})

local labelBox = wibox.widget({
	label,
	widget = wibox.container.margin,
	margins = { left = dpi(16) },
})

local icon = wibox.widget({
	{
		id = "icon",
		widget = wibox.widget.imagebox,
		image = volume_on,
		stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
		valign = "center",
		halign = "center",
		forced_height = dpi(24),
		forced_width = dpi(24),
	},
	widget = wibox.container.margin,
})

local vol_slider = wibox.widget({
	nil,
	{
		{
			icon,
			widget = wibox.container.place,
			valign = "center",
			halign = "left",
		},
		{
			{
				{
					widget = wibox.container.background,
					forced_height = dpi(2),
					shape = helpers.rrect(10),
					bg = beautiful.bg_focus,
				},
				widget = wibox.container.place,
				content_fill_horizontal = true,
				valign = "center",
			},
			slider,
			layout = wibox.layout.stack,
		},
		layout = wibox.layout.fixed.horizontal,
		spacing = dpi(20),
	},
	labelBox,
	layout = wibox.layout.align.horizontal,
})

awesome.connect_signal("signal::volume", function(value)
	local i = icon:get_children_by_id("icon")[1]
	if value > 0 then
		i.image = volume_on
		i.stylesheet = " * { fill: " .. beautiful.fg_normal .. " }"
	else
		i.image = volume_off
		i.stylesheet = " * { fill: " .. beautiful.fg_minimize .. "99" .. " }"
	end
	slider.value = value
	label.markup = value .. "%"
end)

slider:connect_signal("property::value", function(_, value)
	awful.spawn.with_shell("pamixer --set-volume " .. value)
end)

return vol_slider
