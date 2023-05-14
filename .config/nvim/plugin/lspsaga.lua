local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
  ui = {
    winblend = 10,
    border = 'rounded',
    colors = {
      normal_bg = '#002b36'
    }
  },
  symbol_in_winbar = {
    enable = false
  }
})

-- local diagnostic = require("lspsaga.diagnostic")
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>d', ':Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<leader>D', ':Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', '<leader>ld', ':Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>k', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<leader>lf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set('n', '<leader>pd', ':Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', '<leader>rn', ':Lspsaga rename<CR>', opts)
vim.keymap.set({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<CR>")
