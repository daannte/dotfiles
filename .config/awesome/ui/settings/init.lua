local awful = require("awful")
local wibox = require("wibox")
local helpers = require("helpers")
local beautiful = require("beautiful")
local gears = require("gears")
local json = require("mods.json")
local dpi = beautiful.xresources.apply_dpi

local modules = require("ui.settings.modules")

local function setTheme()
	awful.spawn.with_shell("xrdb -merge ~/.themes/" .. modules.themer.current .. " && kill -USR1 $(pidof st)")
	awful.spawn.with_shell(
		"cp ~/.config/rofi/colors/" .. modules.themer.current .. ".rasi  ~/.config/rofi/colors/colors.rasi"
	)
	awful.spawn.with_shell(
		'sed -i \'/theme =/s/"[^"]*"/"' .. modules.themer.current .. "\"/' ~/.config/nvim/lua/plugins/colorscheme.lua"
	)
end

local function writeData()
	local data = {
		theme = modules.themer.current,
	}
	local w = assert(io.open(gears.filesystem.get_cache_dir() .. "settings.json", "w"))
	w:write(json.encode(data))
	w:close()
	setTheme()
	awesome.restart()
end

local close_icon = wibox.widget({
	widget = wibox.widget.imagebox,
	image = beautiful.close_icon,
	stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
	valign = "center",
	halign = "center",
	forced_height = dpi(24),
	forced_width = dpi(24),
})

local close = wibox.widget({
	{
		close_icon,
		widget = wibox.container.margin,
		margins = dpi(2),
	},
	widget = wibox.container.background,
	bg = beautiful.red .. "11",
	shape = helpers.rrect(8),
	buttons = {
		awful.button({}, 1, function()
			awesome.emit_signal("toggle::settings")
		end),
	},
})

local check_icon = wibox.widget({
	widget = wibox.widget.imagebox,
	image = beautiful.check_icon,
	stylesheet = " * { fill: " .. beautiful.fg_normal .. " }",
	valign = "center",
	halign = "center",
	forced_height = dpi(24),
	forced_width = dpi(24),
})

local check = wibox.widget({
	{
		check_icon,
		widget = wibox.container.margin,
		margins = dpi(2),
	},
	widget = wibox.container.background,
	bg = beautiful.green .. "11",
	shape = helpers.rrect(8),
	buttons = {
		awful.button({}, 1, function()
			writeData()
			awesome.emit_signal("toggle::settings")
		end),
	},
})

local settings = wibox({
	shape = helpers.rrect(12),
	width = dpi(520),
	height = dpi(680),
	bg = beautiful.bg_focus,
	ontop = true,
	visible = false,
})

settings:setup({
	{
		{
			{
				font = beautiful.mono .. " 14",
				align = "center",
				valign = "center",
				markup = "Settings",
				widget = wibox.widget.textbox,
			},
			nil,
			{
				check,
				close,
				layout = wibox.layout.fixed.horizontal,
				spacing = dpi(10),
			},
			layout = wibox.layout.align.horizontal,
		},
		modules.themer.widget,
		layout = wibox.layout.fixed.vertical,
		spacing = dpi(20),
	},
	widget = wibox.container.margin,
	margins = dpi(20),
})

awful.placement.centered(settings, { honor_workarea = true })

awesome.connect_signal("toggle::settings", function()
	settings.visible = not settings.visible
end)
