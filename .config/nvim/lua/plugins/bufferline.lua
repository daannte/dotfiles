return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "tabs", -- set to "tabs" to only show tabpages instead
				style_preset = bufferline.style_preset.minimal, -- or bufferline.style_preset.minimal,
				show_buffer_close_icons = false,
				show_close_icon = false,
				truncate_names = true,
			},
		})
	end,
}
