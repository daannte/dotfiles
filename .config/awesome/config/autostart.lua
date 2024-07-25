local autostart = {
	"pipewire",
	"kanata -c ~/.config/kanata/config.kbd",
	-- "mpd",
}

for _, command in ipairs(autostart) do
	require("awful").spawn.easy_async_with_shell(command)
end
