return {
  "nvim-telescope/telescope.nvim",
  version = false,
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live Grep",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "Grep String",
    },
  },

  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = " > ",
        layout_config = {
          horizontal = {
            preview_width = 0.50,
            -- results_width = 0.8,
          },
        },
        border = {},
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        path_display = { "truncate" },
        mappings = {
          n = {
            ["q"] = "close",
          },
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    })
  end,
}
