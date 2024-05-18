return {
  {
    -- "daannte/mountain.nvim",
    lazy = false,
    priority = 999,
    dir = "~/Documents/projects/mountain/",
    config = function()
      require("mountain").setup({})
      vim.cmd.colorscheme("mountain")
    end,
  },
}
