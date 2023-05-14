vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.timeoutlen = 500

-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

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
