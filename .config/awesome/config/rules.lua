local awful = require("awful")
local ruled = require("ruled")
local beautiful = require("beautiful")

ruled.client.connect_signal("request::rules", function()
	-- New clients
	ruled.client.append_rule({
		id = "global",
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_color,
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.no_offscreen,
		},
	})

	-- Floating clients.
	ruled.client.append_rule({
		id = "floating",
		rule_any = {
			instance = { "copyq", "pinentry" },
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"Sxiv",
				"Tor Browser",
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},
			name = {
				"Event Tester", -- xev.
			},
		},
		properties = { floating = true },
	})

	-- Titlebars
	ruled.client.append_rule({
		id = "titlebars",
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = true },
	})

	-- Set Firefox to always map on the tag named '2' on screen 1.
	ruled.client.append_rule({
		rule = { class = "Firefox" },
		properties = { tag = "2" },
	})

	-- Set Discord to always map on the tag named '3' on screen 1.
	ruled.client.append_rule({
		rule = { class = "vesktop" },
		properties = { screen = 1, tag = "3" },
	})
end)
