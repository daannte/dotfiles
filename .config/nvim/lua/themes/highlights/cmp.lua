return function(colours)
  return {
    CmpItemKindClass = { link = "Type" },
    CmpItemKindConstant = { link = "Constant" },
    CmpItemKindConstructor = { link = "TSConstructor" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindKeyword = { link = "Keyword" },
    CmpItemKindOperator = { link = "Operator" },
    CmpItemKindProperty = { link = "TSProperty" },
    CmpItemKindStruct = { link = "Structure" },
    CmpItemKindTypeParameter = { link = "TSParameter" },
    CmpItemKindUnit = { link = "Number" },
    CmpItemKindValue = { link = "String" },
    CmpItemKindVariable = { link = "Identifier" },
    CmpDocumentationBorder = { fg = colours.fg, bg = colours.bg_float },
    CmpItemAbbr = { fg = colours.fg, bg = colours.none },
    CmpItemAbbrDeprecated = { fg = colours.fg_faded, bg = colours.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = colours.colour2, bg = colours.none },
    CmpItemAbbrMatchFuzzy = { fg = colours.colour2, bg = colours.none },
    CmpItemKind = { fg = colours.colour6, bg = colours.none },
    CmpItemMenu = { fg = colours.fg_faded, bg = colours.none },
  }
end
