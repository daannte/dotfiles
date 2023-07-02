function Map(mode, keys, cmd, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, keys, cmd, options)
end

-- map Insert mode to Normal mode to jk and kj
Map('i', 'jk', '<ESC>')
Map('i', 'kj', '<ESC>')

-- Remove highlight after searching
Map('n', '<leader>nh', ':nohl<CR>')

-- Deleting a character won't copy it
Map('n', 'x', '"_x')

-- Increment and Decrement Numbers
Map('n', '+', '<C-a>')
Map('n', '-', '<C-x>')

-- Delete a word backwards
Map('n', 'dw', 'vb"_d')

-- Split Windows
Map('n', '<leader>sh', '<C-w>s')
Map('n', '<leader>sv', '<C-w>v')
Map('n', '<leader>se', '<C-w>=')
Map('n', '<leader>sx', ':close<CR>')

-- Tabs
Map('n', '<leader>tn', ':tabnew<CR>')
Map('n', '<leader>tx', ':tabclose<CR>')
Map('n', '<Tab>', ':tabn<CR>')
Map('n', '<S-Tab>', ':tabp<CR>')

-- Select All
Map('n', '<C-a>', 'gg<S-v>G')

-- Plugin keymaps

-- NvimTree Toggle
Map('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Telescope
Map('n', '<leader>ff', ':Telescope find_files<CR>')
Map('n', '<leader>fr', ':Telescope live_grep<CR>')
Map('n', '<leader>fc', ':Telescope grep_string<CR>')
Map('n', '<leader>fd', ':Telescope diagnostics<CR>')

-- Zen Mode
Map('n', '<leader>zm', ':ZenMode<CR>')
