local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Colorscheme
  -- 'Shatur/neovim-ayu',
  ({ 'jesseleite/nvim-noirbuddy',
    dependencies = {
      'tjdevries/colorbuddy.nvim',
      branch = "dev"
    }
  }),

  -- File Explorer
  'nvim-tree/nvim-tree.lua',

  -- Split Window Navigation
  "christoomey/vim-tmux-navigator",

  -- Fuzzy Finder
  'nvim-telescope/telescope.nvim',

  -- Comment
  ({
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }),

  -- Plugin that many other plugins use
  'nvim-lua/plenary.nvim',

  -- Discord Presence
  'andweeb/presence.nvim',

  -- Icons
  'kyazdani42/nvim-web-devicons',

  -- Status Line
  'nvim-lualine/lualine.nvim',

  -- LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'glepnir/lspsaga.nvim',
  'onsails/lspkind-nvim',

  -- Autocompletion
  'hrsh7th/cmp-buffer',
  'hrsh7th/nvim-cmp',

  -- Diagnostics, formatting, linting
  'jose-elias-alvarez/null-ls.nvim',

  -- Proper syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },

  -- Auto Closing Tags
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',

  -- Git Integration
  'lewis6991/gitsigns.nvim',

  -- Zen Mode
  'folke/zen-mode.nvim',

  -- Color Highlighter
  'norcalli/nvim-colorizer.lua',

  -- Tab Line Customization
  'akinsho/nvim-bufferline.lua',

  -- Snippets
  'L3MON4D3/LuaSnip',

  -- Markdown Preview
  ({
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  }),

  -- LaTeX Support
  'lervag/vimtex',

  -- use 'github/copilot.vim'

}

local opts = {}

require("lazy").setup(plugins, opts)
