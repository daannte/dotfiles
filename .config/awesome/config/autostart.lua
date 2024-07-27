local autostart = {
	"pipewire",
	"kanata -n -c ~/.config/kanata/config.kbd",
}

for _, command in ipairs(autostart) do
	require("awful").spawn.easy_async_with_shell(command)
end
