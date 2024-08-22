local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")
local pam = require("liblua_pam")
local auth = function(password)
	return pam.auth_current_user(password)
end

local background = wibox({
	width = dpi(1920),
	height = dpi(1080),
	visible = false,
	ontop = true,
	type = "splash",
})

awful.placement.centered(background)

local visible = function(v)
	background.visible = v
end

local header = wibox.widget({
	{
		{
			id = "image",
			image = beautiful.wallpaper,
			clip_shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height, 100)
			end,
			forced_height = 120,
			opacity = 0.6,
			forced_width = 120,
			halign = "center",
			widget = wibox.widget.imagebox,
		},
		id = "arc",
		widget = wibox.container.arcchart,
		max_value = 100,
		min_value = 0,
		value = 0,
		rounded_edge = false,
		thickness = dpi(4),
		start_angle = 4.71238898,
		bg = beautiful.fg_minimize .. "cc",
		colors = { beautiful.fg_minimize },
		forced_width = dpi(120),
		forced_height = dpi(120),
	},
	widget = wibox.container.place,
	halign = "center",
})

local reset = function(f)
	header:get_children_by_id("arc")[1].value = not f and 100 or 0
	header:get_children_by_id("arc")[1].colors = { not f and beautiful.red or beautiful.fg }
end

local getRandom = function()
	local r = math.random(0, 628)
	r = r / 100
	return r
end

local input = ""
local function grab()
	local grabber = awful.keygrabber({
		auto_start = true,
		stop_event = "release",
		mask_event_callback = true,
		keybindings = {
			awful.key({
				modifiers = { "Mod1", "Mod4", "Shift", "Control" },
				key = "Return",
				on_press = function(_)
					input = input
				end,
			}),
		},
		keypressed_callback = function(_, _, key, _)
			if key == "Escape" then
				input = ""
				return
			end
			-- Accept only the single charactered key
			-- Ignore 'Shift', 'Control', 'Return', 'F1', 'F2', etc., etc.
			if #key == 1 then
				header:get_children_by_id("arc")[1].colors = { beautiful.blue }
				header:get_children_by_id("arc")[1].value = 20
				header:get_children_by_id("arc")[1].start_angle = getRandom()
				if input == nil then
					input = key
					return
				end
				input = input .. key
			elseif key == "BackSpace" then
				header:get_children_by_id("arc")[1].colors = { beautiful.blue }
				header:get_children_by_id("arc")[1].value = 20
				header:get_children_by_id("arc")[1].start_angle = getRandom()
				input = input:sub(1, -2)
				if #input == 0 then
					header:get_children_by_id("arc")[1].colors = { beautiful.err }
					header:get_children_by_id("arc")[1].value = 100
				end
			end
		end,
		keyreleased_callback = function(self, _, key, _)
			-- Validation
			if key == "Return" then
				if auth(input) then
					self:stop()
					reset(true)
					visible(false)
					input = ""
				else
					grab()
					reset()
					input = ""
				end
			end
		end,
	})
	grabber:start()
end

awesome.connect_signal("toggle::lock", function()
	visible(true)
	grab()
end)

local back = wibox.widget({
	id = "bg",
	image = beautiful.wallpaper,
	widget = wibox.widget.imagebox,
	forced_height = 1080,
	forced_width = 1920,
	horizontal_fit_policy = "fit",
	vertical_fit_policy = "fit",
})

local overlay = wibox.widget({
	widget = wibox.container.background,
	forced_height = 1080,
	forced_width = 1920,
	bg = beautiful.bg_normal,
	opacity = 0.8,
})

background:setup({
	back,
	overlay,
	header,
	layout = wibox.layout.stack,
})
