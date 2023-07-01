local diagnostic = vim.diagnostic
local M = function()
  local errors = #diagnostic.get(0, { severity = diagnostic.severity.ERROR })
  local warnings = #diagnostic.get(0, { severity = diagnostic.severity.WARN })
  local hints = #diagnostic.get(0, { severity = diagnostic.severity.HINT })
  local info = #diagnostic.get(0, { severity = diagnostic.severity.INFO })

  ERROR = (errors and errors > 0) and
      ("%#StatuslineLspErrorIcon#" .. " " .. errors) or ""

  WARNING = (warnings and warnings > 0) and
      ("%#StatuslineLspWarningIcon#" .. " " .. warnings) or ""

  HINT = (hints and hints > 0) and
      ("%#StatuslineLspHintsIcon#" .. " " .. hints) or ""

  INFO = (info and info > 0) and ("%#StatuslineLspInfoIcon#" .. " " .. info)
      or ""

  return ERROR .. " " .. WARNING .. " " .. HINT .. " " .. INFO .. " "
end

return M
