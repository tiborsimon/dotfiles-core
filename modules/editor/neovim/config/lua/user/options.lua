-- GENERIC SIMPLE OPTIONS ---------------------------------------------------------------

local options = {
  -- Encodings
  fileencoding = "utf-8", -- the encoding written to a file

  -- Backup management
  backup = false,         -- do not backup
  writebackup = false,    -- do not write a backup file
  swapfile = false,       -- do not create a swapfile
  undofile = true,        -- enable persistent undo

  -- Mouse integration
  mouse = "n",            -- mouse is only allowed in normal mode, see keymaps.lua file for more

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
  conceallevel = 0,       -- so that `` is visible in markdown files

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
  timeoutlen = 1000,      -- time to wait for a mapped sequence to complete (in milliseconds)
  expandtab = true,       -- convert tabs to spaces
  shiftwidth = 2,         -- the number of spaces inserted for each indentation
  tabstop = 2,            -- insert 2 spaces for a tab
  scrolloff = 8,          -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,      -- minimal number of screen columns either side of cursor if wrap is `false`
}

-- Use the previous table to set up the options in a loop.
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- SHORTMESSAGE SETTINGS ----------------------------------------------------------------

-- Don't give ins-completion-menu messages.
vim.opt.shortmess:append "c"

-- KEYWORD RECOGNITION ------------------------------------------------------------------

-- Recognize dash-separated words as a whole. Handy for CSS and similar languages.
vim.cmd [[set iskeyword+=-]]

-- TEXT FORMATTING BEHAVIOR -------------------------------------------------------------

-- Set up the text formatting behavior of the editor.

vim.opt.textwidth = 90   -- Global wrap limit.
vim.opt.wrap = false      -- Do not wrap line by default.
vim.opt.linebreak = true -- Do not wrap words, only at whitespace.

-- Set up formatoptions. Read more at ':h formatoptions'.

-- [-][t] auto-wrap text
-- [+][c] auto-wrap comments
-- [+][r] insert comment leader on enter
-- [-][o] insert comment leader on 'o'/'O'
-- [-][/] for the 'o' option, insert comment leader for pure comments
-- [+][q] format comments with 'gq'
-- [-][w] recognize trailing whitespace for paragraphs
-- [-][a] format paragraphs automatically
-- [-][n] recognize numbered lists
-- [-][2] indent first line for regular text processing
-- [-][v] vi-compatible auto-wrapping
-- [-][b] 'v' but inly on whitespace before the wrap margin
-- [-][l] long lines are not broken in insert mode
-- [-][m] additional break after 255 characters
-- [-][M] don't insert space around multibyte character on joining
-- [-][B] don't insert space between multibyte character on joining
-- [-][1] don't break line after a one letter word
-- [-][]] respect 'textwidth' rigorously
-- [+][j] smart comment joining
-- [-][p] don't break line on single space after a pariod

-- NOTE: An autocommand is needed here as neovim sets this option during startup in this
-- built-in file /opt/homebrew/Cellar/neovim/0.8.0/share/nvim/runtime/ftplugin/lua.vim
-- To be able to see where the option was modified before use ':verbose set formatoptions'

vim.cmd [[
  augroup MyFormatOptions
    autocmd!
    autocmd BufEnter * setlocal formatoptions=crqj
  augroup END
]]
