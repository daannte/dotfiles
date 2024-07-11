local naughty = require("naughty")

-- Error handling
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
		message = message,
	})
end)

require("awful.autofocus")
require("config")
require("ui")
-- require("signal")

local autostart = {
	"pipewire",
}

for _, command in ipairs(autostart) do
	require("awful").spawn.easy_async_with_shell(command)
end
