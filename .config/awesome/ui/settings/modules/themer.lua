local beautiful = require("beautiful")
local gears = require("gears")
local helpers = require("helpers")

local themes = helpers.read_dir(gears.filesystem.get_configuration_dir() .. "themes/colors/")
local index = helpers.findIndex(themes, beautiful.scheme)

local M = {
	current = beautiful.scheme,
}

function M:next()
	index = index + 1
	if index > #themes then
		index = 1
	end
end

function M:prev()
	index = index - 1
	if index < 1 then
		index = #themes
	end
end

return M
