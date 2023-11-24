local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Map insert mode to normal mode to jk or kj
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Split windows
keymap("n", "<leader>sh", ":split<cr>", opts) -- Horizontal split
keymap("n", "<leader>sv", ":vsplit<cr>", opts) -- Vertical split
keymap("n", "<leader>sx", ":close<cr>", opts) -- Close current split
keymap("n", "<leader>se", "<C-w>=<cr>", opts) -- Resize equally

-- Tabs
keymap("n", "<leader>tn", ":tabnew<cr>", opts) -- Create new tab
keymap("n", "<leader>tx", ":tabclose<cr>", opts) -- Close current tab
keymap("n", "<Tab>", ":tabn<cr>", opts) -- Switch to next tab
keymap("n", "<S-Tab>", ":tabp<cr>", opts) -- Switch to previous tab

-- Switch windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Remove highlight after searching
keymap("n", "<leader>nh", ":nohl<cr>", opts)

-- Deleting a character won't copy it
keymap("n", "x", '"_x', opts)

-- Increment and Decrement Numbers
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Delete a word backwards
keymap("n", "dw", 'vb"_d', opts)

-- Select All
keymap("n", "<C-a>", "gg<S-v>G", opts)
