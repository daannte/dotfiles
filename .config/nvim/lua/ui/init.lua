vim.api.nvim_create_autocmd({ "CursorHold", "UIEnter" }, {
  callback = function()
    vim.opt.laststatus = 3 -- Global Status
    require("ui.statusline").setup()
  end
})

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   pattern = "*",
--   callback = function()
--     require("ui.buf").setup()
--   end,
-- })
