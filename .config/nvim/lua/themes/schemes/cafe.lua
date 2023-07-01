local util = require("themes.util")

local M = {}

M.colours = {
  none = "NONE",
  bg = '#ECE2DC',
  bg_highlight = '#E2D9D4',
  fg = '#685C56',
  fg_faded = "#948985",
  white = '#FFFFFF',
  black = '#26363C',
  orange = '#BF7647',
  red = '#A8334C',
  cyan = '#3B8992',
}

M.colours.visual = util.darken(M.colours.bg, 0.9)

return M







-- #2C363C
-- local cmd = vim.cmd
--
-- function M.setup()
--   require("base16-colorscheme").setup {
--     base00 = "#F0EDEC",
--     base01 = "#e9e4e2",
--     base02 = "#cbd9e3",
--     base03 = "#948985",
--     base04 = "#8e817b",
--     base05 = "#685c56",
--     base06 = "#ffffff",
--     base07 = "#e9e4e2",
--     base08 = "#685c56",
--     base09 = "#88507d",
--     base0A = "#A8334C",
--     base0B = "#597a37",
--     base0C = "#685c56",
--     base0D = "#a8623e",
--     base0E = "#A8334C",
--     base0F = "#4f5e68",
--   }
-- end
--
-- M.colors = {
--   fg = "#685c56",
--   bg = "#F0EDEC",
--   accent = "#685c56",
--   lightbg = "#e9e4e2",
--   fgfaded = "#948985",
--   grey = "#948985",
--   light_grey = "#948985",
--   dark_grey = "#383432",
--   bright = "#ffffff",
--   red = "#A8334C",
--   green = "#597a37",
--   blue = "#286486",
--   yellow = "#a8623e",
--   magenta = "#88507D",
--   orange = "#944927",
--   cyan = "#3B8992",
--   ViMode = {
--     Normal = "#26363c",
--   },
-- }
--
-- function M.overrides()
--   vim.cmd [[
--     hi TabLineSel guibg=#e9e4e2 guifg=#26363c
--     hi TabLineNorm guibg=#F0EDEC guifg=#948985
--     hi TabLineFill guibg=#F0EDEC gui=none
--     hi TelescopeBorder guifg=#e9e4e2
--     hi TelescopeTitle guifg=#948985
--     hi TSPunctBracket guifg=#685c56
--     hi TSConstructor guifg=#685c56
--     hi MatchParen guibg=#e5d9d7
--     hi TSKeyword gui=italic
--     hi TSConditional gui=italic
--     hi TSString gui=italic
--   ]]
-- end
-- return M


-- color0 = '#232a2d',
--     color1 = '#e57474',
--     color2 = '#8dc080',
--     color3 = '#e5c76b',
--     color4 = '#67b0e8',
--     color5 = '#c47fd5',
--     color6 = '#6cbfbf',
--     color7 = '#b3b9b8',
--     color8 = '#2d3437',
--     color9 = '#ef7e7e',
--     color10 = '#90bc9b',
--     color11 = '#f4d67a',
--     color12 = '#71baf2',
--     color13 = '#ce89df',
--     color14 = '#67cbe7',
--     color15 = '#bdc3c2',
--     comment = '#404749',
--     contrast = '#161d1f',
--     background = '#141b1e',
--     black = '#141b1e',
--     darker = "#111619",
--     foreground = '#dadada',
--     cursorline = '#2c3333',
