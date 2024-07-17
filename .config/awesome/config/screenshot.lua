local naughty = require("naughty")
local awful = require("awful")

local function screenshot()
	local file = os.getenv("HOME") .. "/Pictures/Screenshots/" .. os.date("%F-%H%M%S") .. ".png"

	awful.spawn.easy_async_with_shell("maim -u -f png -s -b 2 " .. file, function()
		awful.spawn.easy_async_with_shell("[ -e '" .. file .. "' ] && echo exists", function(output)
			if output:match("%w+") then
				awful.spawn.with_shell("cat " .. file .. " | xclip -selection clipboard -t image/png")
				naughty.notification({
					title = "Screenshot",
					text = "Saved and Copied",
				})
			else
				naughty.notification({
					title = "Screenshot",
					text = "Cancelled",
				})
			end
		end)
	end)
end

awesome.connect_signal("util::screenshot", function()
	screenshot()
end)
