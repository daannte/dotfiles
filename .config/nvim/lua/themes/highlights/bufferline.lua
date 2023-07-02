return function(colours)
  return {
    BufflineCurrentTab = { bg = colours.bg, italic = true },
    BufflineTab = { fg = colours.fg_faded, bg = colours.bg_dim },
    BufflineEmptyColour = { bg = colours.bg }
  }
end
