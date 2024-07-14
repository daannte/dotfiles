local awful = require("awful")
local gears = require("gears")

local function emit()
	awful.spawn.easy_async_with_shell(
		"brightnessctl -m | awk -F, '{print substr($4, 0, length($4)-1)}'",
		function(stdout)
			local value = tonumber(stdout)
			awesome.emit_signal("signal::brightness", value)
		end
	)
end

gears.timer({
	timeout = 1,
	call_now = true,
	autostart = true,
	callback = function()
		emit()
	end,
})
