local awful = require("awful")

client.connect_signal("request::titlebars", function(c)
	awful.titlebar(c, {
		size = 40,
		position = "left",
	})
end)
