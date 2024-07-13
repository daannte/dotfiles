local awful = require("awful")
local modkey = Config.modkey

awful.keyboard.append_global_keybindings({
	-- General keybinds
	awful.key({ modkey, "Shift" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey }, "Tab", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "Tab", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "awesome" }),

	-- Layout
	awful.key({ modkey }, "z", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "z", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),

	-- Launcher
	awful.key({ modkey }, "Return", function()
		awful.spawn(Config.terminal)
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey }, "r", function()
		awful.spawn.with_shell("rofi -show drun")
	end, { description = "run prompt", group = "launcher" }),
	awful.key({ modkey }, "w", function()
		awful.spawn.with_shell("rofi -show window")
	end, { description = "show windows", group = "launcher" }),

	-- XF86
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn.with_shell("pamixer -d 5")
	end, { description = "lower volume", group = "volume" }),
	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn.with_shell("pamixer -i 5")
	end, { description = "raise volume", group = "volume" }),
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn.with_shell("brightnessctl s 5%+")
	end, { description = "raise brightness", group = "brightness" }),
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn.with_shell("brightnessctl s 5%-")
	end, { description = "lower brightness", group = "brightness" }),

	-- Screenshots
	awful.key({ modkey, "Shift" }, "s", function()
		awesome.emit_signal("util::screenshot")
	end),

	-- Tags
	awful.key({
		modifiers = { modkey },
		keygroup = "numrow",
		description = "only view tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Control" },
		keygroup = "numrow",
		description = "move focused client to tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Shift" },
		keygroup = "numrow",
		description = "move focused client to tag and follow",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
					tag:view_only()
				end
			end
		end,
	}),
})

-- Client keybinds
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		awful.key({ modkey }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "toggle fullscreen", group = "client" }),
		awful.key({ modkey }, "q", function(c)
			c:kill()
		end, { description = "close", group = "client" }),
		awful.key(
			{ modkey, "Control" },
			"space",
			awful.client.floating.toggle,
			{ description = "toggle floating", group = "client" }
		),
		awful.key({ modkey }, "m", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "maximize", group = "client" }),
		awful.key({ modkey }, "c", function(c)
			c.width = 1300
			c.height = 700
			awful.placement.centered(c, { honor_workarea = true })
		end, { description = "resize and center window", group = "client" }),
		awful.key({ modkey, "Shift" }, "c", function(c)
			awful.placement.centered(c, { honor_workarea = true })
		end, { description = "center window", group = "client" }),
	})
end)

-- Mouse
client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings({
		awful.button({ modkey }, 1, function(c)
			c:activate({ context = "mouse_click", action = "mouse_move" })
		end),
		awful.button({ modkey }, 3, function(c)
			c:activate({ context = "mouse_click", action = "mouse_resize" })
		end),
	})
end)
