vim.api.nvim_create_autocmd({ "CursorHold", "UIEnter" }, {
  callback = function()
    vim.opt.laststatus = 3
    require("ui.statusline").setup()
  end
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  pattern = "*",
  callback = function()
    require("ui.bufferline").setup()
  end,
})
