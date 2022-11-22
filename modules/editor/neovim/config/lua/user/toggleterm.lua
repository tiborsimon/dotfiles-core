local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
  -- ARTICLE: Custom TMUX based toggleterm.
  -- Global mapping was not set in the global config to be able to manually map it later
  -- on for the custom Terminal.
	-- open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
  cmd="tmux new -s neovim",
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal

-- Custom terminal to create/attach to the dedicated neovim tmux session.
local tmux_terminal = Terminal:new({
  cmd = "tmux new-session -A -s neovim",
  hidden = true,
})

-- Global function to be able to use the toggle command in the mappings.
function _MY_TOGGLETERM__TMUX_TOGGLE()
	tmux_terminal:toggle()
end

-- Using the default neovim terminal escape key <C-\> to toggle the tmux terminal, but it
-- is okay, as we don't want to do use non-mapped key combination in the terminal buffer.
-- See more :h terminal
vim.api.nvim_set_keymap("n", [[<C-\>]], "<cmd>lua _MY_TOGGLETERM__TMUX_TOGGLE()<CR>", {noremap = true, silent = true})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  -- Prevent detaching the terminal.
  vim.api.nvim_buf_set_keymap(0, 't', '<C-d>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', [[<C-\>]], "<cmd>lua _MY_TOGGLETERM__TMUX_TOGGLE()<CR>", opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
