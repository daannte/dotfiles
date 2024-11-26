local awful = require("awful")
local wibox = require("wibox")
local helpers = require("helpers")
local animation = require("mods.animation")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

return function(s)
	local taglist = awful.widget.taglist({
		layout = {
			spacing = dpi(8),
			layout = wibox.layout.fixed.horizontal,
		},
		style = {
			shape = helpers.rrect(9),
		},
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = {
			awful.button({}, 1, function(t)
				t:view_only()
			end),
		},
		widget_template = {
			{
				valign = "center",
				id = "background_role",
				shape = helpers.rrect(1),
				widget = wibox.container.background,
				forced_width = dpi(30),
				forced_height = dpi(14),
			},
			widget = wibox.container.place,
			create_callback = function(self, tag)
				self.taganim = animation:new({
					duration = 0.25,
					easing = animation.easing.linear,
					update = function(_, pos)
						self:get_children_by_id("background_role")[1].forced_width = pos
					end,
				})
				self.update = function()
					if tag.selected then
						self.taganim:set(40)
					elseif #tag:clients() > 0 then
						self.taganim:set(30)
					else
						self.taganim:set(20)
					end
				end

				self.update()
			end,
			update_callback = function(self)
				self.update()
			end,
		},
	})
	local widget = {
		{
			taglist,
			widget = wibox.container.margin,
			left = dpi(15),
			right = dpi(15),
		},
		shape = helpers.rrect(5),
		widget = wibox.container.background,
		bg = beautiful.bg_focus,
	}

	return widget
end
