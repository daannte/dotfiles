return {
  {
    "Everblush/nvim",
    name = "everblush",
    lazy = true,
    priority = 999,
    config = function()
      vim.cmd.colorscheme("everblush")
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 999,
    config = function()
      require("everforest").setup({
        background = "hard",
      })
      require("everforest").load()
    end,
  },
}
