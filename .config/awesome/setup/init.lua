local json = require("mods.json")
local helpers = require("helpers")
local gears = require("gears")

local M = {}

M.defaultData = {
	theme = "rose",
}

M.path = gears.filesystem.get_cache_dir() .. "settings.json"

function M:generate()
	if not helpers.file_exists(self.path) then
		local w = assert(io.open(self.path, "w"))
		w:write(
			json.encode(
				self.defaultData,
				nil,
				{ pretty = true, indent = "	", align_keys = false, array_newline = true }
			)
		)
		w:close()
		M.settings = self.defaultData
	else
		local r = assert(io.open(self.path, "rb"))
		local t = r:read("*all")
		r:close()
		local settings = json.decode(t)
		M.settings = settings
	end
end

return M
