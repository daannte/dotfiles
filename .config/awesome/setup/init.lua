local awful = require("awful")
local json = require("mods.json")
local helpers = require("helpers")
local gears = require("gears")

local M = {}

M.defaultData = {
	theme = "kizu",
}

M.path = gears.filesystem.get_cache_dir() .. "settings.json"

function M:generate()
	if not helpers.file_exists(self.path) then
		local w = assert(io.open(self.path, "w"))
		w:write(json.encode(self.defaultData))
		w:close()
		M.settings = self.defaultData
	else
		local r = assert(io.open(self.path, "rb"))
		local t = r:read("*all")
		r:close()
		local settings = json.decode(t)
		M.settings = settings
	end
	awful.spawn.with_shell("xrdb -merge ~/.themes/" .. M.settings.theme .. " && kill -USR1 $(pidof st)")
end

return M
