local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {}
}

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-n>', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', '<C-p>', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
