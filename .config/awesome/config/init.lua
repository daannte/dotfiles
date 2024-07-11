Config = {}

Config.terminal = "st -e tmux"
Config.browser = "firefox"
Config.editor = "nvim"
Config.modkey = "Mod4"

require("config.client")
require("config.binds")
require("config.rules")
