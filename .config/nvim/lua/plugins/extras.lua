-- Plugins that don't really need their own file
return {
  { "MunifTanjim/nui.nvim", lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      vim.ui.select = function(...)
        ---@diagnostic disable-next-line: different-requires
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      vim.ui.input = function(...)
        ---@diagnostic disable-next-line: different-requires
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
}
