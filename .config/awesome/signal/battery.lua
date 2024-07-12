local awful = require("awful")

local script = "cat /sys/class/power_supply/BAT1/capacity"

awful.widget.watch(script, 15, function(_, stdout)
	local capacity = tonumber(stdout)
	awesome.emit_signal("signal::battery", capacity)
end)
