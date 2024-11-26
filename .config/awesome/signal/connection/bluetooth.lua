local awful = require("awful")
local gears = require("gears")

local function emit()
	awful.spawn.easy_async_with_shell("bluetoothctl show | grep -i 'powered:'", function(stdout)
		local status = stdout:match("yes")
		awesome.emit_signal("signal::bluetooth", status)
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
