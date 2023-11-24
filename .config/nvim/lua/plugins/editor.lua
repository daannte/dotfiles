return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle Nvim-Tree" },
    },
    config = function()
      -- vim.cmd([[hi NvimTreeIndentMarker guibg=NONE guifg=#ffffff]])
      require("nvim-tree").setup({
        renderer = {
          icons = {
            glyphs = {
              folder = {
                arrow_closed = " ",
                arrow_open = " ",
              },
            },
          },
        },
        filters = {
          dotfiles = false,
        },
      })
    end,
  },
  {
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
              results_width = 0.8,
            },
          },
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
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
        },
      })
    end,
  },
  {
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
  },
  {
    {
      "folke/trouble.nvim",
      cmd = { "TroubleToggle", "Trouble" },
      opts = { use_diagnostic_signs = true },
      keys = {
        { "<leader>td", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
        {
          "<leader>D",
          function()
            if require("trouble").is_open() then
              require("trouble").previous({ skip_groups = true, jump = true })
            else
              local ok, err = pcall(vim.cmd.cprev)
              if not ok then
                vim.notify(err, vim.log.levels.ERROR)
              end
            end
          end,
          desc = "Previous trouble/quickfix item",
        },
        {
          "<leader>d",
          function()
            if require("trouble").is_open() then
              require("trouble").next({ skip_groups = true, jump = true })
            else
              local ok, err = pcall(vim.cmd.cnext)
              if not ok then
                vim.notify(err, vim.log.levels.ERROR)
              end
            end
          end,
          desc = "Next trouble/quickfix item",
        },
      },
    },
  },
}
