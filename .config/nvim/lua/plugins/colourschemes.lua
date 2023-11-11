return {
	{
		"Everblush/nvim",
		name = "everblush",
		lazy = true,
		priority = 999,
		config = function()
			vim.cmd("colorscheme everblush")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
		priority = 999,
		lazy = true,
		config = function()
			vim.cmd("colorscheme gruvbox-material")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 999,
		lazy = false,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				disable_italics = true,
			})
			vim.cmd("colorscheme rose-pine")
		end,
	},
}
