local g = vim.g
local o = vim.opt

-- Set leader
g.mapleader = " "
g.maplocalleader = " "

-- Timing stuff
o.timeoutlen = 500
o.updatetime = 300
o.timeout = true
o.ttimeoutlen = 10

-- Tabs
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.smartindent = true

-- Line numbers
-- o.number = true
o.relativenumber = false
o.numberwidth = 4

-- Line wrap
o.wrap = false

-- Search Settings
o.ignorecase = true
o.smartcase = true

-- Appearance
o.termguicolors = true
o.background = "dark"
o.fillchars:append({ eob = " " }) -- disable "~" indicator

-- Use System Clipboard
o.clipboard = "unnamedplus"

-- Split Windows
o.splitright = true
o.splitbelow = true

-- Set scrolloff
o.scrolloff = 5

-- Disable Default Status Line
o.laststatus = 0
o.ruler = false
o.showmode = false

-- Mouse
o.mouse = "a"

-- Cursor line
o.cursorline = true

-- Always show signcolumn
o.signcolumn = "yes:2"

-- Command line height
o.cmdheight = 0

-- Undo file
o.undofile = true

-- Disable built in plugins
local builtins = {
  "2html_plugin",
  "archlinux",
  "bugreport",
  "compiler",
  "ftplugin",
  "fzf",
  "sleuth",
  "syntax",
  "synmenu",
  "spellfile",
  "spellfile_plugin",
  "optwin",
  "matchit",
  -- "matchparen",
  "rrhelper",
  "rplugin",
  "logipat",
  "gtags",
  "getscript",
  "getscriptPlugin",
  "man",
  "tutor",
  "tutor_mode_plugin",
  "tar",
  "tarPlugin",
  "zip",
  "zipPlugin",
  "gzip",
  "vimball",
  "vimballPlugin",
  "vimgrep",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "node_provider",
  "ruby_provider",
  "python3_provider",
  "perl_provider",
}

for _, plugin in ipairs(builtins) do
  g["loaded_" .. plugin] = 1
end
