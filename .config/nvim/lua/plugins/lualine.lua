return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local custom_theme = require("lualine.themes.everforest")
    custom_theme.normal.c.bg = nil
    custom_theme.insert.c.bg = nil
    custom_theme.command.c.bg = nil
    custom_theme.inactive.c.bg = nil
    custom_theme.visual.c.bg = nil
    custom_theme.replace.c.bg = nil

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = custom_theme,
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
        lualine_a = { { "mode", color = { bg = "", fg = "#7FBBB3" } } },
        lualine_b = { { "filename", color = { bg = "", fg = "#83C092" } } },
        lualine_c = {},
        lualine_x = { { "branch", icons_enabled = false, color = { bg = "", fg = "#D3C6AA" } } },
        lualine_y = { { "diagnostics", color = { bg = "" } } },
        lualine_z = { { "%l", color = { bg = "", fg = "#CE94B0" } } },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
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
}
