local keymap = vim.keymap

-- print("leader set!")
-- Set leader to space
vim.g.mapleader = " "

-- Do not yank with x in normal mode
keymap.set('n', 'x', '"_x')

-- Navifate through wrapped long lines more intuitively.
keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Swap colon with semicolon in normal mode
keymap.set('n', ';', ':')

-- Keep visual mode enabled on indenting
keymap.set('v', '>', '>gv')
keymap.set('v', '<', '<gv')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Motion in insert mode
keymap.set('i', '<C-h>', '<left>')
keymap.set('i', '<C-l>', '<right>')
keymap.set('i', '<C-j>', '<down>')
keymap.set('i', '<C-k>', '<up>')

-- Window tab management
keymap.set('n', '<leader>te', ':tabedit<Return>', { silent = true })

-- Split handling
keymap.set('n', '<leader>ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', '<leader>sv', ':vsplit<Return><C-w>w', { silent = true })

-- Resize windows in normal mode
keymap.set('n', '<leader>s=', '<C-w>=')
keymap.set('n', '<S-Up>', '<C-w>+')
keymap.set('n', '<S-Down>', '<C-w>-')
keymap.set('n', '<S-Left>', '<C-w><')
keymap.set('n', '<S-Right>', '<C-w>>')

-- Motion between windows in normal mode
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-l>', '<C-w>l')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')

-- File related mappings
keymap.set('n', '<leader>fs', ':w<Return>')
keymap.set('n', '<leader>fq', ':q<Return>')

-- Clipboard handling
keymap.set('v', '<leader>cc', '"+y', { desc = 'Copy selection to system clipboard' })
keymap.set('n', '<leader>cc', 'V"+y', { desc = 'Copy line to system clipboard' })
keymap.set('n', '<leader>cp', '"+p', { desc = 'Paste from system clipboard' })

-- Searching
keymap.set('n', '<Return>', "*``")

-- Toggle
keymap.set('n', '<leader>tw', ':setlocal wrap!<cr>')
