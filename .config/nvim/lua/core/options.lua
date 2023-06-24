vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.timeoutlen = 500

-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Line wrap
vim.opt.wrap = false

-- Search Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Use System Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Split Windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set scrolloff
vim.opt.scrolloff = 5

-- Disable Default Status Line
vim.opt.laststatus = 0
vim.opt.ruler = false
vim.opt.cmdheight = 0

-- Cursor line
vim.opt.cursorline = true

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
   augroup highlight_yank
   autocmd!
   au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
   augroup END
]]

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
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "logipat",
  "matchit",
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
  "vimgrep"
}

for _, plugin in ipairs(builtins) do
  vim.g["loaded_" .. plugin] = 1
end
