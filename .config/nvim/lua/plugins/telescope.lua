local config = function()
	require("telescope").setup({
		defaults = {
			prompt_prefix = " > ",
			layout_config = {
				horizontal = {
					preview_width = 0.50,
					results_width = 0.8,
				},
			},
			path_display = { "truncate" },
			mappings = {
				n = {
					["q"] = "close",
				},
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
}
