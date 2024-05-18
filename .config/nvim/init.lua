vim.loader.enable()
require("config")

-- Remove annoying deprecated message for now, since plugins havent updated yet
vim.deprecate = function() end
