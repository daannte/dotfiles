return function(colours)
  return {
    NvimTreeNormal = { fg = colours.fg, bg = colours.bg_dim },
    NvimTreeNormalNC = { fg = colours.fg, bg = colours.bg_dim },
    NvimTreeRootFolder = { fg = colours.colour7 },
    NvimTreeGitDirty = { fg = colours.git.change },
    NvimTreeGitNew = { fg = colours.git.add },
    NvimTreeGitDeleted = { fg = colours.git.delete },
    NvimTreeSpecialFile = { fg = colours.fg },
    NvimTreeIndentMarker = { fg = colours.fg_faded },
    NvimTreeImageFile = { fg = colours.fg },
    NvimTreeSymlink = { fg = colours.fg },
    NvimTreeFolderIcon = { fg = colours.colour1, bg = colours.none },
    -- NvimTreeFolderName = { fg = colours.colour2 },
    NvimTreeOpenedFolderName = { fg = colours.colour2 },
    NvimTreeEmptyFolderName = { fg = colours.colour2 },
  }
end
