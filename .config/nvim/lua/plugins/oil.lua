return {
  "stevearc/oil.nvim",
  keys = {
    {
      "<leader>o",
      ":Oil<cr>",
      desc = "Open Oil",
      silent = true,
    },
  },
  opts = {
    keymaps = {
      ["<CR>"] = "actions.select",
      ["h"] = "actions.parent",
    },
    use_default_keymaps = false,
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
