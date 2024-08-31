local gears = require("gears")
local beautiful = require("beautiful")

screen.connect_signal("request::wallpaper", function(s)
	gears.wallpaper.maximized(beautiful.wallpaper, s, true)

	awesome.connect_signal("theme::reload", function()
		gears.wallpaper.maximized(beautiful.wallpaper, s, true)
	end)
end)
