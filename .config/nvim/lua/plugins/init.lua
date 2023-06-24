require('plugins.bootstrap')

local plugins = {
  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    config = function() require('plugins.utils.nvim-tree') end
  },

  -- Split Window Navigation
  {
    'christoomey/vim-tmux-navigator',
    event = 'BufRead'
  },

  -- Plugin that many other plugins use
  {
    'nvim-lua/plenary.nvim',
    lazy = true
  },

  -- Fuzzy Finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'plenary.nvim' },
    config = function() require('plugins.utils.telescope') end
  },

  -- Comment
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
    config = function() require('plugins.utils.comment') end,
  },

  -- Discord Presence
  {
    'andweeb/presence.nvim',
    event = 'BufRead',
    config = function() require('plugins.others.discord') end
  },

  -- Icons
  {
    'kyazdani42/nvim-web-devicons',
    event = 'BufRead',
    config = function() require('plugins.ui.devicons') end,
  },

  -- LSP
  {
    'williamboman/mason.nvim',
    dependencies = 'williamboman/mason-lspconfig.nvim',
    cmd = 'Mason',
    config = function() require('plugins.lsp.mason') end
  },
  {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lsp.lspconfig') end
  },
  {
    'glepnir/lspsaga.nvim',
    config = function() require('plugins.lsp.lspsaga') end
  },
  {
    'onsails/lspkind-nvim',
    config = function() require('plugins.lsp.lspkind') end
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
          require("plugins.lsp.luasnip")
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    config = function() require("plugins.lsp.cmp") end,
  },

  -- Diagnostics, formatting, linting
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function() require('plugins.lsp.null-ls') end
  },

  -- Proper syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    config = function() require('plugins.ts.treesitter') end,
  },

  -- Auto Closing Tags
  {
    'windwp/nvim-autopairs',
    config = function() require('plugins.ts.autopairs') end,
    event = "InsertEnter",
  },
  {
    'windwp/nvim-ts-autotag',
    config = function() require('plugins.ts.autotag') end,
    event = "InsertEnter",
  },

  -- Git Integration
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.ui.gitsigns') end
  },

  -- Zen Mode
  {
    'folke/zen-mode.nvim',
    cmd = "ZenMode",
    config = function() require('plugins.utils.zen') end,
  },

  -- Color Highlighter
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function() require('plugins.ui.colorizer') end,
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- LaTeX Support
  {
    'lervag/vimtex',
    ft = "tex",
    config = function() require('plugins.others.latex') end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function() require('plugins.colourscheme') end,
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
