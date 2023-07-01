return function(colours)
  return {
    TelescopeBorder = {
      fg = colours.bg_float,
      bg = colours.bg_float,
    },
    TelescopePromptBorder = {
      fg = colours.bg_highlight,
      bg = colours.bg_highlight,
    },
    TelescopePromptNormal = {
      fg = colours.fg,
      bg = colours.bg_highlight,
    },
    TelescopePromptPrefix = {
      fg = colours.fg,
      bg = colours.bg_highlight,
    },
    TelescopePromptCounter = {
      fg = colours.fg,
      bg = colours.bg_highlight
    },
    TelescopeNormal = { bg = colours.bg_float },
    TelescopeResultsNormal = {
      fg = colours.fg_faded, bg = colours.bg_float
    },
    TelescopePreviewTitle = {
      fg = colours.fg,
      bg = colours.bg_float,
    },
    TelescopePromptTitle = {
      fg = colours.fg,
      bg = colours.bg_highlight,
    },
    TelescopeResultsTitle = {
      fg = colours.fg,
      bg = colours.bg_float,
    },
    TelescopeSelection = { bg = colours.bg_float, fg = colours.fg },
    TelescopeResultsDiffAdd = {
      fg = colours.diff.add,
    },
    TelescopeResultsDiffChange = {
      fg = colours.diff.change,
    },
    TelescopeResultsDiffDelete = {
      fg = colours.diff.delete,
    },
    TelescopeMatching = {
      fg = colours.colour1,
      bg = colours.bg_float
    }
  }
end
