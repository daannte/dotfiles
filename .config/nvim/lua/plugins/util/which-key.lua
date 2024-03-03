return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local wk = require("which-key")
    wk.register({
      s = {
        name = "Split",
      },
      z = {
        name = "Zen and Zathura",
      },
      f = {
        name = "Telescope",
      },
      t = {
        name = "Trouble, Tabs & Terminal",
      },
      c = {
        name = "Code Action",
      },
      r = {
        name = "Rename",
      },
      g = {
        name = "Git Stuff",
      },
    }, { prefix = "<leader>" })
  end,
  opts = {
    icons = {
      group = "+",
      breadcrumb = "=",
      separator = "->",
    },
  },
}
