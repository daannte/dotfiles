return function(colours)
  return {
    DiagnosticError = { fg = colours.colour0 },
    DiagnosticWarn = { fg = colours.colour6 },
    DiagnosticInfo = { fg = colours.colour5 },
    DiagnosticHint = { fg = colours.colour2 },
  }
end
