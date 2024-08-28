local gears = require("gears")
local helpers = require("helpers")

local themes = helpers.read_dir(gears.filesystem.get_configuration_dir() .. "themes/colors/")
