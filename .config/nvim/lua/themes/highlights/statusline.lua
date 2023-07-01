return function(colours)
  return {
    Statusline = { fg = colours.fg, bg = colours.none },
    StatuslineLspErrorIcon = { fg = colours.colour0, bg = colours.none },
    StatuslineLspWarningIcon = { fg = colours.colour6, bg = colours.none },
    StatuslineLspHintIcon = { fg = colours.colour2, bg = colours.none },
    StatuslineLspInfoIcon = { fg = colours.colour5, bg = colours.none },
  }
end
