local fn = vim.fn
local M = function()
  local filename = fn.expand("%:t")
  if filename == "" then
    return ""
  end
  return filename .. " "
end
return M
