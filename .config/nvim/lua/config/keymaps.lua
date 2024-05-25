local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Keep cursor centered when scrolling
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)

-- Move line / block up or down
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Split windows
map("n", "<leader>sh", ":split<cr>", opts) -- Horizontal split
map("n", "<leader>sv", ":vsplit<cr>", opts) -- Vertical split
map("n", "<leader>sx", ":close<cr>", opts) -- Close current split
map("n", "<leader>se", "<C-w>=<cr>", opts) -- Resize equally

-- Buffer Manipulation
map("n", "<Tab>", ":bnext<cr>", opts) -- Switch to next buffer
map("n", "<S-Tab>", ":bprev<cr>", opts) -- Switch to previous buffer

-- Switch windows
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Remove highlight after searching
map("n", "<leader>nh", ":nohl<cr>", opts)

-- Deleting won't copy it
map("n", "x", '"_x', opts)
map("n", "dd", '"_dd', opts)

-- Cursor Movements
map({ "n", "v" }, "L", "$")
map({ "n", "v" }, "H", "0")

-- Increment and Decrement Numbers
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)

-- Delete a word backwards
map("n", "dw", 'vb"_d', opts)

-- Select All
map("n", "<C-a>", "gg<S-v>G", opts)

-- Toggle line numbers
map("n", "<leader>n", ":set number!<cr>", opts)
