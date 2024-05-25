return {
  "folke/trouble.nvim",
  branch = "dev",
  cmd = { "Trouble" },
  opts = { use_diagnostic_signs = true },
  keys = {
    { "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>tD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
  },
}
