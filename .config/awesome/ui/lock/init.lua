local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local pam = require("liblua_pam")
local auth = function(password)
	return pam.auth_current_user(password)
end

local clock = wibox.widget({
	widget = wibox.widget.textclock,
	align = "center",
	valign = "center",
	format = "%H:%M",
	font = beautiful.mono .. " Bold 110",
})

local date = wibox.widget({
	widget = wibox.widget.textclock,
	align = "center",
	valign = "center",
	format = "%a, %B %d",
	font = beautiful.mono .. " Light 32",
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
	width = dpi(1000),
	height = dpi(900),
	ontop = true,
	visible = false,
	bg = beautiful.transparent,
})

local prompt = wibox.widget({
	font = beautiful.mono .. " 16",
	align = "center",
	valign = "center",
	markup = "Password Here",
	widget = wibox.widget.textbox,
})

local visible = function(v)
	background.visible = v
	box.visible = v
end

local chars = 0

local reset = function()
	chars = 0
	prompt.markup = "Password Here"
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
					prompt.markup = "Password Here"
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

background:setup({
	wall,
	overlay,
	layout = wibox.layout.stack,
})

box:setup({
	{
		{
			clock,
			date,
			{
				prompt,
				layout = wibox.container.margin,
				top = dpi(50),
			},
			layout = wibox.layout.fixed.vertical,
			spacing = dpi(10),
		},
		widget = wibox.container.margin,
		margins = dpi(5),
	},
	widget = wibox.container.place,
	valign = "center",
})

awful.placement.centered(box)
