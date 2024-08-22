local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local pam = gears.filesystem.get_configuration_dir() .. "liblua_pam.so"
local auth = function(password)
	return pam.auth_current_user(password)
end
