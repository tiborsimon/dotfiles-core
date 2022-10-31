local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- NORMAL ---------------------------------------------------------------------

-- A more comfortable colon
keymap("n", ";", ":", { noremap = true })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Built in file explorer
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Increment/decrement
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)

-- Navigate through wrapped long lines more intuitively.
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)

-- Clipboard handling
keymap('v', '<leader>cc', '"+y', { desc = 'Copy selection to system clipboard' })
keymap('n', '<leader>cc', 'V"+y', { desc = 'Copy line to system clipboard' })
keymap('n', '<leader>cp', '"+p', { desc = 'Paste from system clipboard' })

-- Search for word under cursor
keymap('n', '<Return>', "*``", opts)

-- Toggle
keymap('n', '<leader>tw', ':setlocal wrap!<cr>', { noremap = true })


-- INSERT ---------------------------------------------------------------------

-- Motion in insert mode
keymap('i', '<C-h>', '<left>', opts)
keymap('i', '<C-l>', '<right>', opts)
keymap('i', '<C-j>', '<down>', opts)
keymap('i', '<C-k>', '<up>', opts)


-- VISUAL ---------------------------------------------------------------------

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected text up and down
keymap("v", "J", ":move .+1<CR>==", opts)
keymap("v", "K", ":move .-2<CR>==", opts)

-- Preserve register value on paste
keymap("v", "p", '"_dP', opts)


-- VISUAL BLOCK ---------------------------------------------------------------

-- Move selected text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)


-- TERMINAL -------------------------------------------------------------------

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
