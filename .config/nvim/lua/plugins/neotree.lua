return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", ":Neotree toggle<CR>", desc = "Open Neotree", silent = true },
  },
  config = function()
    vim.fn.sign_define("DiagnosticSignError", { text = "x ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "! ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "i ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "#", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "solid",
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = "+",
            modified = "::",
            deleted = "-",
            renamed = "󰁕",

            untracked = " ",
            ignored = " ",
            unstaged = " ",
            staged = " ",
            conflict = " ",
          },
        },
        file_size = {
          enabled = false,
        },
        type = {
          enabled = false,
        },
        last_modified = {
          enabled = false,
        },
        created = {
          enabled = false,
        },
      },
      window = {
        position = "float",
        width = 35,
      },
    })
  end,
}
