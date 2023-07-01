return function(colours)
  return {
    GitSignsAdd = { fg = colours.git.add },
    GitSignsChange = { fg = colours.git.change },
    GitSignsDelete = { fg = colours.git.delete },
  }
end
