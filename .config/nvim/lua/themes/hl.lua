local M = {}
local hi = vim.api.nvim_set_hl
local hl_files = vim.fn.stdpath "config" .. "/lua/themes/highlights"

local highlights = {}

function M.highlight_all(colors)
  for _, file in ipairs(vim.fn.readdir(hl_files)) do
    local integration = require("themes.highlights." .. vim.fn.fnamemodify(file, ":r"))
    highlights = vim.tbl_deep_extend("force", highlights, integration(colors))
  end
  for group, properties in pairs(highlights) do
    hi(0, group, properties)
  end
end

return M
