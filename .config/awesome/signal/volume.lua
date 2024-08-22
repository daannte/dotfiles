local awful = require("awful")
local gears = require("gears")

local function emit()
	awful.spawn.easy_async_with_shell("pamixer --get-volume", function(stdout)
		local value = tonumber(stdout)
		awesome.emit_signal("signal::volume", value)
	end)
end

gears.timer({
	timeout = 1,
	call_now = true,
	autostart = true,
	callback = function()
		emit()
	end,
})