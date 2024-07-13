local naughty = require("naughty")
local awful = require("awful")

local function screenshot()
	local file = os.getenv("HOME") .. "/Pictures/Screenshots/" .. os.date("%F-%H%M%S") .. ".png"

	awful.spawn.easy_async_with_shell(
		"maim -u -f png -s -b 2 " .. file .. "| xclip -selection clipboard -t image/png",
		function()
			naughty.notification({
				title = "Screenshot",
				text = "Saved and Copied",
			})
		end
	)
end

awesome.connect_signal("util::screenshot", function()
	screenshot()
end)
