local keymap = vim.keymap.set

keymap('i', 'jk', '<ESC>')
keymap('i', 'kj', '<ESC>')
keymap('n', '<leader>nh', ':nohl<CR>')
keymap('n', 'x', '"_x')

-- Increment and Decrement Numbers
keymap('n', '+', '<C-a>')
keymap('n', '-', '<C-x>')

-- Delete a word backwards
keymap('n', 'dw', 'vb"_d')

-- Split Windows
keymap('n', '<leader>sh', '<C-w>s')
keymap('n', '<leader>sv', '<C-w>v')
keymap('n', '<leader>se', '<C-w>=')
keymap('n', '<leader>sx', ':close<CR>')

-- Tabs
keymap('n', '<leader>tn', ':tabnew<CR>', { silent = true })
keymap('n', '<leader>tx', ':tabclose<CR>', { silent = true })
keymap('n', '<Tab>', ':tabn<CR>', { silent = true })
keymap('n', '<S-Tab>', ':tabp<CR>', { silent = true })

-- Select All
keymap('n', '<C-a>', 'gg<S-v>G')

-- NvimTree Toggle
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<CR>')
keymap('n', '<leader>fr', ':Telescope live_grep<CR>')
keymap('n', '<leader>fc', ':Telescope grep_string<CR>')
keymap('n', '<leader>fd', ':Telescope diagnostics<CR>')

-- Zen Mode
keymap('n', '<leader>zm', ':ZenMode<CR>', { silent = true })

-- Toggle Term
keymap('n', '<leader>tt', ':ToggleTerm<CR>', { silent = true })
