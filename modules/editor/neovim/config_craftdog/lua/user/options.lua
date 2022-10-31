-- vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leavin insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste",
})
-- Add asterinsks in block comments
vim.opt.formatoptions:append { 'r' }

local options = {
  backup = false,
  clipboard = "", -- Do not access the clipbard directly. We will be using registers.
  cmdheight = 1,
  completeopt = { "menuone", "noselect", "noinsert" },
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8",
  encoding = 'utf-8',

  -- Disable backup and swap files as we are using version control systems..,,
  writebackup = false,
  swapfile = false,
  backupskip = '/tmp/*,/private/tmp/*',
  -- Undo system
  undofile = true,
  -- Tab management
  tabstop = 2,
  softtabstop = 2,
  expandtab = true,
  shiftwidth = 2,
  smarttab = true,
  smartindent = true,
  autoindent = true,
  -- Scrolling
  scrolloff = 8,
  sidescrolloff = 4,
  scrolljump = 0,
  --Searching
  hlsearch = true,
  incsearch = true,
  magic = true,
  ignorecase = true,
  smartcase = true,
  title = true,
  showcmd = true,
  laststatus = 2,
  shell = 'fish',
  inccommand = 'split',
  breakindent = true,
  wrap = false, -- No wrap lines
  backspace = 'start,eol,indent',
  -- Disable mouse as it is annoying..
  mouse = "",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
