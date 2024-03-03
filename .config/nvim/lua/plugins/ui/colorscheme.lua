return {
  {
    "daannte/mountain.nvim",
    lazy = false,
    priority = 999,
    config = function()
      require("mountain").setup({})
      vim.cmd.colorscheme("mountain")
    end,
  },
}
