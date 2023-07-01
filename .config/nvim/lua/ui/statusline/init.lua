local run = function()
  local mode = require("ui.statusline.modules.mode")
  local filename = require("ui.statusline.modules.filename")
  local branch = require("ui.statusline.modules.gitbranch")
  local diagnostics = require("ui.statusline.modules.diagnostics")
  return table.concat {
    '%#Statusline#',
    mode(),
    filename(),
    branch(),
    diagnostics(),
    "%=",
  };
end

local setup = function()
  vim.opt.statusline = run()
  vim.api.nvim_create_autocmd({ "ModeChanged", "LspAttach" }, {
    callback = function()
      vim.opt.statusline = run()
    end
  })
end

return { run = run, setup = setup }
