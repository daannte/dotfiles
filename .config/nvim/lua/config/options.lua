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
o.signcolumn = "yes"

-- Command line height
o.cmdheight = 1

-- Disable built in plugins
local builtins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "logipat",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
  "archlinux",
  "fzf",
  "tutor_mode_plugin",
  "sleuth",
  "vimgrep",
}

for _, plugin in ipairs(builtins) do
  g["loaded_" .. plugin] = 1
end
