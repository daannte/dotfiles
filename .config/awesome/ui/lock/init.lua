local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local helpers = require("helpers")
local pam = require("liblua_pam")
local auth = function(password)
	return pam.auth_current_user(password)
end

local textclock = wibox.widget({
	widget = wibox.widget.textclock,
	refresh = 20,
	align = "center",
	valign = "center",
	format = "<span>%H:%M</span>",
	font = beautiful.mono .. " Bold 48",
})

local clock = wibox.widget({
	textclock,
	widget = wibox.container.margin,
	margins = dpi(8),
})

local background = wibox({
	width = dpi(1920),
	height = dpi(1080),
	ontop = true,
	visible = false,
	type = "splash",
})

awful.placement.centered(background)

local box = wibox({
	width = dpi(320),
	height = dpi(180),
	ontop = true,
	visible = false,
	shape = helpers.rrect(8),
})

awful.placement.centered(box)

local prompt = wibox.widget({
	font = beautiful.font,
	align = "center",
	markup = "Password...",
	widget = wibox.widget.textbox,
})

local visible = function(v)
	background.visible = v
	box.visible = v
end

local chars = 0

local reset = function()
	chars = 0
	prompt.markup = "Password..."
end

local fail = function()
	chars = 0
	prompt.markup = "Try Again"
end

local function grab()
	awful.prompt.run({
		hooks = {
			{
				{},
				"Escape",
				function(_)
					reset()
					grab()
				end,
			},
		},
		keypressed_callback = function(_, key, _)
			if #key == 1 then
				chars = chars + 1
				prompt.markup = string.rep("*", chars)
			elseif key == "BackSpace" then
				if chars > 1 then
					chars = chars - 1
					prompt.markup = string.rep("*", chars)
				else
					chars = 0
					prompt.markup = "Password..."
				end
			end
		end,
		exe_callback = function(input)
			if auth(input) then
				reset()
				visible(false)
			else
				grab()
				fail()
			end
		end,
		textbox = wibox.widget.textbox(),
	})
end

awesome.connect_signal("toggle::lock", function()
	visible(true)
	grab()
end)

local wall = wibox.widget({
	id = "wall",
	image = beautiful.wallpaper,
	widget = wibox.widget.imagebox,
	forced_height = dpi(1080),
	forced_width = dpi(1920),
	horizontal_fit_policy = "fit",
	vertical_fit_policy = "fit",
})

local overlay = wibox.widget({
	widget = wibox.container.background,
	forced_height = dpi(1080),
	forced_width = dpi(1920),
	bg = beautiful.bg_normal,
	opacity = 0.8,
})

box:setup({
	{
		{
			{
				clock,
				layout = wibox.layout.fixed.horizontal,
			},
			widget = wibox.container.margin,
			margins = dpi(5),
		},
		{
			{
				{
					{
						prompt,
						layout = wibox.layout.align.horizontal,
					},
					widget = wibox.container.margin,
					left = dpi(15),
					forced_width = dpi(160),
					forced_height = dpi(40),
				},
				widget = wibox.container.background,
				bg = beautiful.bg_focus,
				shape = helpers.rrect(8),
			},
			widget = wibox.container.margin,
			margin = dpi(5),
		},
		layout = wibox.layout.align.vertical,
	},
	widget = wibox.container.place,
	valign = "top",
	halign = "center",
})

background:setup({
	wall,
	overlay,
	layout = wibox.layout.stack,
})
