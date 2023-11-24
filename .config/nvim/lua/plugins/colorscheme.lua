return {
  {
    "Everblush/nvim",
    name = "everblush",
    lazy = true,
    priority = 999,
    keys = {
      { "<leader>cl", ":Telescope colorscheme<CR>", desc = "Select Colourscheme" },
    },
    config = function()
      vim.cmd.colorscheme("everblush")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
    lazy = true,
    priority = 999,
    keys = {
      { "<leader>cl", ":Telescope colorscheme<CR>", desc = "Select Colourscheme" },
    },
    config = function()
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    priority = 999,
    keys = {
      { "<leader>cl", ":Telescope colorscheme<CR>", desc = "Select Colourscheme" },
    },
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        disable_italics = true,
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 999,
    keys = {
      { "<leader>cl", ":Telescope colorscheme<CR>", desc = "Select Colourscheme" },
    },
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
