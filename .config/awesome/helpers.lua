local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi

local helpers = {}

helpers.rrect = function(radius)
	radius = radius or dpi(4)
	return function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, radius)
	end
end

helpers.file_exists = function(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

helpers.read_themes = function(path)
	local items = {}
	local pdir = io.popen("ls " .. path .. " | cut -d '.' -f 1")
	if pdir then
		for file in pdir:lines() do
			table.insert(items, file)
		end
		pdir:close()
	end
	return items
end

helpers.findIndex = function(t, value)
	for i, v in ipairs(t) do
		if v == value then
			return i
		end
	end
	return nil
end

return helpers
