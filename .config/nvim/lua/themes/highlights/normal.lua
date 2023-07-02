return function(colours)
  return {
    Normal = { fg = colours.fg, bg = colours.bg },               -- normal Text
    NormalNC = { fg = colours.fg, bg = colours.bg },             -- normal text in non-current window
    NormalSB = { fg = colours.fg, bg = colours.bg },             -- normal text in sidebar
    NormalFloat = { fg = colours.fg, bg = colours.bg_float },    -- normal text in floating windows
    Visual = { bg = colours.visual },                            -- visual mode selection
    VisualNOS = { bg = colours.bg },                             -- visual mode selection when vim is "Not Owning the Selection"
    Comment = { fg = colours.fg_faded, italic = true },          -- self-explanatory
    Cursor = { fg = colours.bg, bg = colours.fg },               -- character under cursornrnr
    lCursor = { fg = colours.bg, bg = colours.fg },              -- character under cursor for each mode
    CursorIM = { fg = colours.bg, bg = colours.fg },             -- like Cursor, but used in IME mode
    CursorColumn = { bg = colours.bg_highlight },                -- cursor column highlight when 'cursorcolumn' opt is set
    CursorLine = { bg = colours.bg_highlight },                  -- cursor line highlight when 'cursorline' opt is set
    LineNr = { fg = colours.fg_faded, bg = colours.bg },         -- colour of the numbers when 'number' or 'relativenumber' opt is set
    CursorLineNr = { fg = colours.black },                       -- like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line
    SignColumn = { bg = colours.bg, fg = colours.fg },           -- column where signs are displayed, for example git signs
    MsgArea = { fg = colours.fg, bg = colours.bg },              -- area for messaged and commands
    ModeMsg = { fg = colours.fg, bg = colours.bg },              -- mode, stuff like insert, normal, etc.
    EndOfBuffer = { fg = colours.bg },                           -- Background of the lines with the '~'
    VertSplit = { fg = colours.black },                          -- the vertical line when you split vertically
    WinSeparator = { fg = colours.black, bold = true },          -- the vertical line when you split vertically
    TabLine = { fg = colours.fg_faded, bg = colours.bg },        -- tab pages line, not selected tab
    TabLineSel = { fg = colours.fg, bg = colours.bg_highlight }, -- tab pages line, selected tab
    TabLineFill = { fg = colours.fg, bg = colours.bg },          -- tab pages line when there are no tabs
    WildMenu = { bg = colours.visual },                          -- current match in 'wildmenu' completion
    Folded = { fg = colours.fg_faded, bg = colours.bg },         -- line used for closed folds
    FoldColumn = { fg = colours.fg_faded, bg = colours.bg },     -- foldcolumn
    FloatBorder = { fg = colours.fg_faded, bg = colours.bg_float },
    Whitespace = { fg = colours.fg_faded },                      -- "nbsp", "space", "tab" and "trail" in 'listchars'
    ColorColumn = { bg = colours.bg },                           -- used for the columns set with 'colorcolumn'
    WarningMsg = { fg = colours.colour6 },                       -- warning messages
    ErrorMsg = { fg = colours.red },                             -- error messages on command line
    MoreMsg = { fg = colours.colour6 },                          -- |more-prompt|
    DiffAdd = { bg = colours.bg },                               -- diff mode: Added line
    DiffChange = { bg = colours.bg },                            -- diff mode: Changed line
    DiffDelete = { bg = colours.bg },                            -- diff mode: removed line
    QuickFixLine = { bg = colours.visual, bold = true },         -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    MatchParen = { fg = colours.colour1, bold = true },          -- The character under the cursor or just before it, if it is a paired bracket, and its match.
    Conceal = { fg = colours.colour7 },                          -- placeholder characters substituted for concealed text (see 'conceallevel')
    Directory = { fg = colours.colour2 },                        -- Directory names (and other special names in listing)
    SpecialKey = { fg = colours.bg },                            -- Unprintable characters
    Title = { fg = colours.colour1, bold = true },               -- titles for output from ":set all", ":autocmd" etc.
    Search = { fg = colours.fg, bg = colours.colour0 },          -- last search pattern highlighting
    IncSearch = { fg = colours.fg, bg = colours.colour2 },       -- 'incsearch' highlighting
    CurSearch = { link = 'IncSearch' },
    Substitute = { fg = colours.bg, bg = colours.colour6 },      -- :substitute replacement text highlighting
    Question = { fg = colours.colour6 },                         -- |hit-enter| prompt and yes/no questions
    NonText = { fg = colours.bg },                               -- see :h hl-NonText
    Pmenu = { fg = colours.fg, bg = colours.bg },                -- popup menu: normal item
    PmenuSel = { fg = colours.fg, bg = colours.bg_highlight },   -- popup menu: selected item
    PmenuSbar = { bg = colours.bg_float },                       -- popup menu: scrollbar
    PmenuThumb = { bg = colours.fg_faded },                      -- popup menu: thumb of the scrollbar

    -- Commented out groups chain up to the 'preferred' group by default

    Constant = { fg = colours.colour4 },  -- (preferred) any constant
    String = { fg = colours.colour2 },    -- a string: 'Hello World'
    Character = { fg = colours.colour2 }, -- a character: 'a', '\n'
    -- Number  = { },                    -- a number: 123, 0xff
    -- Boolean = { },                    -- a boolean: True, False
    -- Float   = { },                    -- a float: 3.14

    Identifier = { fg = colours.colour5 },               -- (preferred) any variable name
    Function = { fg = colours.colour2 },                 -- function names (also: methods and classes)

    Statement = { fg = colours.colour0, italic = true }, -- (preferred) any statement
    Operator = { fg = colours.colour1 },                 -- '+', '*', '-', etc.
    -- Conditional = { },                               -- if, then, else, endif, switch, etc.
    -- Repeat      = { },                               -- for, do, while, etc.
    -- Label       = { },                               -- case, switch, etc.
    -- Keyword     = { },                               -- any other keyword
    -- Exception   = { },                               -- try, catch, throw

    PreProc = { fg = colours.colour4 }, -- (preferred) generic Preprocessor
    -- Include   = { },                -- preprocessor #include
    -- Define    = { },                -- preprocessor #define
    -- Macro     = { },                -- same as Define
    -- PreCondit = { },                -- preprocessor #if, #else, #endif, etc.

    Type = { fg = colours.colour6 }, -- (preferred) int, long, char, etc.
    -- StorageClass = { },           -- static, register, volatile, etc.
    -- Structure    = { },           -- struct, union, enum, etc.
    -- Typedef      = { },           -- a typedef


    Special    = { fg = colours.colour6 }, -- (preferred) any special symbol
    Debug      = { fg = colours.colour1 }, -- debugging statements
    -- SpecialChar    = { },              -- special char in constant
    -- Tag            = { },              -- you can use CTRL - ] on it
    -- Delimiter      = { },              -- character that needs attention
    -- SpecialComment = { },              -- special things inside a comment

    Underlined = { underline = true }, -- (preferred) text that stands out, HTML Links
    Bold       = { bold = true },
    Italic     = { italic = true },

    -- Ignore = { },

    Error      = { fg = colours.colour0 },                               -- (preferred) any erroneous construct
    Todo       = { fg = colours.bg, bg = colours.colour5, bold = true }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX


    -- if I ever use spellchecker I'll edit these
    -- SpellBad = {},
    -- SpellCap = {},
    -- SpellLocal = {},
    -- SpellRare = {},

    -- TSX
    ['@tag.tsx'] = { fg = colours.colour0 },

    -- LSP Semantic Token Groups
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.type.interface"] = { fg = colours.colour5 },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string.rust"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = colours.colour0 },
    ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = colours.colour5 },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
  }
end
