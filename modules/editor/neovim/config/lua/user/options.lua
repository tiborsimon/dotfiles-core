local options = {
  -- Encodings
  fileencoding = "utf-8", -- the encoding written to a file

  -- Backup management
  backup = false,         -- do not backup
  writebackup = false,    -- do not write a backup file
  swapfile = false,       -- do not create a swapfile
  undofile = true,        -- enable persistent undo

  -- Mouse integration
  mouse = "n",            -- mouse is allowed in normal mode, see keymaps.lua file for more

  -- Clipboard handling
  clipboard = "",         -- don't access the system clipboard directly, we will access it through the registers

  -- GUI related options
  termguicolors = true,   -- set term gui colors to support optionally more colors
  cursorline = true,      -- highlight the current line
  cmdheight = 1,          -- more space in the neovim command line for displaying messages
  pumheight = 10,         -- pop up menu height
  showmode = false,       -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,        -- always show tabs
  number = true,          -- set numbered lines
  relativenumber = true,  -- set relative numbered lines
  numberwidth = 4,        -- set number column width to 2 {default 4}
  signcolumn = "yes",     -- always show the sign column, otherwise it would shift the text each time
  wrap = true,            -- display lines as one long line
  conceallevel = 0,       -- so that `` is visible in markdown files
  linebreak = true,       -- companion to wrap, don't split words

  -- Completion related options
  updatetime = 300,       -- faster completion (4000ms default)
  completeopt = {         -- completion options
    "menuone",
    "noselect",
    "noinsert",
  },

  -- Search related options
  hlsearch = true,        -- highlight all matches on previous search pattern
  ignorecase = true,      -- ignore case in search patterns
  smartcase = true,       -- smart case

  -- Behavior related options
  smartindent = true,     -- make indenting smarter again
  splitbelow = true,      -- force all horizontal splits to go below current window
  splitright = true,      -- force all vertical splits to go to the right of current window
  timeoutlen = 300,       -- time to wait for a mapped sequence to complete (in milliseconds)
  expandtab = true,       -- convert tabs to spaces
  shiftwidth = 2,         -- the number of spaces inserted for each indentation
  tabstop = 2,            -- insert 2 spaces for a tab
  scrolloff = 8,          -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,      -- minimal number of screen columns either side of cursor if wrap is `false`
  textwidth = 90,         -- 
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
