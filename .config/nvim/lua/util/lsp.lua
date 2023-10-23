local mapkey = require("util.keymapper").mapkey

local M = {}

M.diagnostic_signs = { Error = "", Warn = "", Hint = "", Info = "" }

M.on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	mapkey("n", "<leader>d", ":Lspsaga diagnostic_jump_next", opts)
	mapkey("n", "<leader>D", ":Lspsaga diagnostic_jump_prev", opts)
	mapkey("n", "<leader>ld", ":Lspsaga show_line_diagnostics", opts)
	mapkey("n", "<leader>k", ":Lspsaga hover_doc", opts)
	mapkey("n", "<leader>lf", ":Lspsaga lsp_finder", opts)
	mapkey("i", "<C-k>", ":lua vim.lsp.buf.signature_help()", opts)
	mapkey("n", "<leader>pd", ":Lspsaga peek_definition", opts)
	mapkey("n", "<leader>rn", ":Lspsaga rename", opts)
	mapkey("n", "<leader>ca", ":Lspsaga code_action")
end

return M
