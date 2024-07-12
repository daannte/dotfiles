local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local create_taglist = function(s)
	local taglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		layout = wibox.layout.fixed.vertical,
		buttons = {
			awful.button({}, 1, function(t)
				t:view_only()
			end),
		},
		widget_template = {
			{
				{
					id = "text_role",
					widget = wibox.widget.textbox,
					align = "center",
					valign = "center",
				},
				margins = dpi(4),
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
		},
	})

	return taglist
end

return create_taglist
