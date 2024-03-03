return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>gp",
        "<cmd>Gitsigns preview_hunk<cr>",
        desc = "Preview Hunk",
      },
      {
        "<leader>gt",
        "<cmd>Gitsigns toggle_current_line_blame<cr>",
        desc = "Toggle Line Blame",
      },
    },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "++" },
          change = { text = "::" },
          delete = { text = "--" },
          changedelete = { text = "~~" },
          topdelete = { text = "xx" },
          untracked = { text = ".." },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
      })
    end,
  },
}
