local mapkey = require("util.keymapper").mapkey

-- Map insert mode to normal mode to jk or kj
mapkey("i", "jk", "<ESC>")
mapkey("i", "kj", "<ESC>")

-- Split windows
mapkey("n", "<leader>sh", ":split") -- Horizontal split
mapkey("n", "<leader>sv", ":vsplit") -- Vertical split
mapkey("n", "<leader>sx", ":close") -- Close current split
mapkey("n", "<leader>se", "<C-w>=") -- Resize equally

-- Tabs
mapkey("n", "<leader>tn", ":tabnew") -- Create new tab
mapkey("n", "<leader>tx", ":tabclose") -- Close current tab
mapkey("n", "<Tab>", ":tabn") -- Switch to next tab
mapkey("n", "<S-Tab>", ":tabp") -- Switch to previous tab

-- Remove highlight after searching
mapkey("n", "<leader>nh", ":nohl")

-- Deleting a character won't copy it
mapkey("n", "x", '"_x')

-- Increment and Decrement Numbers
mapkey("n", "+", "<C-a>")
mapkey("n", "-", "<C-x>")

-- Delete a word backwards
mapkey("n", "dw", 'vb"_d')

-- Select All
mapkey("n", "<C-a>", "gg<S-v>G")

--------------------
-- Plugin keymaps --
--------------------

-- NvimTree Toggle
mapkey("n", "<leader>e", ":NvimTreeToggle")

-- Telescope
mapkey("n", "<leader>ff", ":Telescope find_files")
mapkey("n", "<leader>fr", ":Telescope live_grep")
mapkey("n", "<leader>fs", ":Telescope grep_string")
mapkey("n", "<leader>fd", ":Telescope diagnostics")

-- Zen Mode
mapkey("n", "<leader>zm", ":ZenMode")
