return {
  "folke/zen-mode.nvim",
  keys = {
    {
      "<leader>zm",
      "<cmd>ZenMode<cr>",
      desc = "Toggle Zen Mode",
    },
  },
  opts = {
    window = {
      backdrop = 1,
      options = {
        number = false,
        relativenumber = false,
      },
    },
    plugins = {
      tmux = { enabled = true },
    },
  },
}
