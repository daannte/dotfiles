local awful = require("awful")
local gears = require("gears")

local function emit()
	awful.spawn.easy_async_with_shell("nmcli networking connectivity check", function(stdout)
		local status = true
		if not stdout:match("full") then
			status = false
		end
		awesome.emit_signal("signal::network", status)
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