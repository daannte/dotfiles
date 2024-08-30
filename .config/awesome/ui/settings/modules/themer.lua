local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local helpers = require("helpers")
local dpi = beautiful.xresources.apply_dpi

local themes = helpers.read_themes(gears.filesystem.get_configuration_dir() .. "themes/colors/")
local index = helpers.findIndex(themes, beautiful.scheme)
local naughty = require("naughty")

local M = {
	current = beautiful.scheme,
	colors = {
		red = beautiful.red,
		green = beautiful.green,
		yellow = beautiful.yellow,
		blue = beautiful.blue,
		bg = beautiful.bg_normal,
		fg = beautiful.fg_normal,
	},
}

local next = wibox.widget({
	widget = wibox.widget.imagebox,
	image = beautiful.next_icon,
	stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
	valign = "center",
	halign = "center",
	forced_height = dpi(24),
	forced_width = dpi(24),
	buttons = {
		awful.button({}, 1, function()
			M:next()
		end),
	},
})

local back = wibox.widget({
	widget = wibox.widget.imagebox,
	image = beautiful.back_icon,
	stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
	valign = "center",
	halign = "center",
	forced_height = dpi(24),
	forced_width = dpi(24),
	buttons = {
		awful.button({}, 1, function()
			M:prev()
		end),
	},
})

function M:next()
	index = index + 1
	if index > #themes then
		index = 1
	end
	M:getColors(themes[index])
	M:setColors()
end

function M:prev()
	index = index - 1
	if index < 1 then
		index = #themes
	end
	M:getColors(themes[index])
	M:setColors()
end

function M:getColors(scheme)
	scheme = scheme or self.current
	self.colors = require("themes.colors." .. scheme)
	self.current = scheme
end

function M:setColors()
	self.widget:get_children_by_id("name")[1].markup = self.current
	self.widget:get_children_by_id("fg")[1].bg = self.colors.fg
	self.widget:get_children_by_id("bg")[1].bg = self.colors.bg
	self.widget:get_children_by_id("blue")[1].bg = self.colors.pri
	self.widget:get_children_by_id("red")[1].bg = self.colors.err
	self.widget:get_children_by_id("yellow")[1].bg = self.colors.warn
	self.widget:get_children_by_id("green")[1].bg = self.colors.ok
end

M.widget = wibox.widget({
	{
		{
			{
				{
					id = "name",
					markup = M.current,
					font = beautiful.mono .. " 14",
					widget = wibox.widget.textbox,
				},
				nil,
				{
					back,
					next,
					layout = wibox.layout.fixed.horizontal,
				},
				layout = wibox.layout.align.horizontal,
			},
			{
				{

					{
						id = "red",
						widget = wibox.container.background,
						forced_height = dpi(80),
						forced_width = dpi(80),
						bg = M.colors.red,
					},
					{
						id = "green",
						widget = wibox.container.background,
						forced_height = dpi(80),
						forced_width = dpi(80),
						bg = M.colors.green,
					},
					{
						id = "yellow",
						widget = wibox.container.background,
						forced_height = dpi(80),
						forced_width = dpi(80),
						bg = M.colors.yellow,
					},
					{
						id = "blue",
						widget = wibox.container.background,
						forced_height = dpi(80),
						forced_width = dpi(80),
						bg = M.colors.blue,
					},
					{
						id = "fg",
						widget = wibox.container.background,
						forced_height = dpi(80),
						forced_width = dpi(80),
						bg = M.colors.fg,
					},
					spacing = dpi(20),
					layout = wibox.layout.flex.horizontal,
				},
				widget = wibox.container.place,
				halign = "center",
				valign = "center",
			},
			nil,
			layout = wibox.layout.align.vertical,
		},
		widget = wibox.container.margin,
		margins = dpi(16),
	},
	id = "bg",
	widget = wibox.container.background,
	forced_height = dpi(200),
	shape = helpers.rrect(12),
	bg = M.colors.bg,
})

return M
