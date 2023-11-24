local Util = require("util")

return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
        ██████╗  █████╗ ███╗   ██╗████████╗███████╗ █████╗ ███████╗██╗     ██╗███████╗███████╗
        ██╔══██╗██╔══██╗████╗  ██║╚══██╔══╝██╔════╝██╔══██╗██╔════╝██║     ██║██╔════╝██╔════╝
        ██║  ██║███████║██╔██╗ ██║   ██║   █████╗  ███████║███████╗██║     ██║█████╗  █████╗  
        ██║  ██║██╔══██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██║╚════██║██║     ██║██╔══╝  ██╔══╝  
        ██████╔╝██║  ██║██║ ╚████║   ██║   ███████╗██║  ██║███████║███████╗██║██║     ███████╗
        ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝     ╚══════╝
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      dashboard.section.header.val = vim.split(logo, "\n")

      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", "<cmd> Telescope find_files <cr>"),
        dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
        dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
      }

      dashboard.config.opts.noautocmd = true

      alpha.setup(dashboard.config)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = { "branch" },
          lualine_y = { "diagnostics" },
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          mode = "tabs", -- set to "tabs" to only show tabpages instead
          style_preset = bufferline.style_preset.minimal, -- or bufferline.style_preset.minimal,
          show_buffer_close_icons = false,
          show_close_icon = false,
          truncate_names = true,
        },
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>ncl",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      timeout = 100,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
      render = "minimal",
    },
    init = function()
      -- when noice is not enabled, install notify on VeryLazy
      if not Util.has("noice.nvim") then
        Util.on_very_lazy(function()
          vim.notify = require("notify")
        end)
      end
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        progress = {
          enabled = true,
          format = "lsp_progress",
          format_done = "lsp_progress_done",
          throttle = 1000 / 30,
          view = "mini",
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    },
  },
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}
