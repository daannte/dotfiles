local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Refresh neovim on save when a new package is added
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use({ "catppuccin/nvim", name = "catppuccin" })

  -- File Explorer
  use({
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  })

  -- Split Window Navigation
  use "christoomey/vim-tmux-navigator"

  -- Fuzzy Finder
  use 'nvim-telescope/telescope.nvim'
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

  -- Comment
  use({
    'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  })

  -- Plugin that many other plugins use
  use 'nvim-lua/plenary.nvim'

  -- Discord Presence
  use 'andweeb/presence.nvim'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Status Line
  use 'nvim-lualine/lualine.nvim'

  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'

  -- Autocompletion
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'

  -- Diagnostics, formatting, linting
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Proper syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Auto Closing Tags
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Git Integration
  use 'lewis6991/gitsigns.nvim'

  -- Zen Mode
  use 'folke/zen-mode.nvim'

  -- Color Highlighter
  use 'norcalli/nvim-colorizer.lua'

  -- Tab Line Customization
  use 'akinsho/nvim-bufferline.lua'

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Markdown Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- LaTeX Support
  use 'lervag/vimtex'

  -- use 'github/copilot.vim'


  if packer_bootstrap then
    require("packer").sync()
  end
end)
