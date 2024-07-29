Config = {}

Config.terminal = "st"
Config.browser = "firefox"
Config.editor = "nvim"
Config.modkey = "Mod4"
Config.theme = "serenity"

require("config.client")
require("config.binds")
require("config.rules")
require("config.screenshot")
require("config.autostart")
