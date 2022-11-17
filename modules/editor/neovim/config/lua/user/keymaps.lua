local opts = { noremap = true, silent = true }

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

-- Resize with arrows
keymap("n", "<S-Up>", ":resize +1<CR>", opts)
keymap("n", "<S-Down>", ":resize -1<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +1<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Navigate tabs
keymap("n", "<Tab>", "gt", opts)
keymap("n", "<S-Tab>", "gT", opts)

-- Increment/decrement
keymap("n", "-", "<C-a>", opts)
keymap("n", "+", "<C-x>", opts)

-- Navigate through wrapped long lines more intuitively.
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Search for word under cursor
keymap("n", "<Return>", "*``", opts)

-- Illuminate mappings
keymap("n", "<C-n>", ":lua require('illuminate').goto_next_reference()<cr>", opts)
keymap("n", "<C-p>", ":lua require('illuminate').goto_prev_reference()<cr>", opts)

-- Mouse if for scrolling only
keymap("n", "<LeftMouse>", "<nop>", opts)
keymap("n", "<RightMouse>", "<nop>", opts)

-- Bracket based mappings
-- Switching buffers
keymap("n", "[b", ":bprevious<CR>", opts)
keymap("n", "]b", ":bnext<CR>", opts)

-- Jumping to diagnostics
keymap("n", "[d", ":Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "]d", ":Lspsaga diagnostic_jump_next<cr>", opts)
keymap("n", "gd", ":Lspsaga show_line_diagnostics<cr>", opts)

-- Git hunk navigation
keymap("n", "[h", ":lua require('gitsigns').next_hunk()<cr>", opts)
keymap("n", "]h", ":lua require('gitsigns').prev_hunk()<cr>", opts)

-- Navigate todo comments
keymap("n", "[t", ":lua require('todo-comments').jump_next()<cr>", opts)
keymap("n", "]t", ":lua require('todo-comments').jump_prev()<cr>", opts)
keymap("n", "gt", ":TodoTrouble<cr>", opts)

-- INSERT ---------------------------------------------------------------------

-- Motion in insert mode
keymap("i", "<C-h>", "<left>", opts)
keymap("i", "<C-l>", "<right>", opts)
keymap("i", "<C-j>", "<down>", opts)
keymap("i", "<C-k>", "<up>", opts)

-- VISUAL ---------------------------------------------------------------------

-- A more comfortable colon
keymap("v", ";", ":", { noremap = true })

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected text up and down
keymap("v", "J", ":move .+1<CR>==", opts)
keymap("v", "K", ":move .-2<CR>==", opts)

-- Preserve register value on paste
-- keymap("v", "p", '"_dP', opts)

-- VISUAL BLOCK ---------------------------------------------------------------

-- A more comfortable colon
keymap("x", ";", ":", { noremap = true })

-- Move selected text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- COMMAND --------------------------------------------------------------------

keymap("c", "<C-h>", "<left>", { noremap = false })
keymap("c", "<C-l>", "<right>", { noremap = false })
keymap("c", "<C-j>", "<down>", { noremap = false })
keymap("c", "<C-k>", "<up>", { noremap = false })

-- TERMINAL -------------------------------------------------------------------

-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-------------------------------------------------------------------------------

-- LEADER KEY BASED MAPPINGS --------------------------------------------------

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- NORMAL ---------------------------------------------------------------------

local normal_leader_mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  ["r"] = { "<cmd>Telescope resume<cr>", "Resume Last Picker" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["<space>"] = { "<cmd>HopChar2<cr>", "Hop!!" },
  ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },

  -- SEARCH -------------------------------------------------------------------

  ["/"] = {
    name = "Search",
    ["/"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    l = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    n = { "<cmd>lua require('illuminate').goto_next_reference()<cr>", "Next occurence" },
    p = { "<cmd>lua require('illuminate').goto_prev_reference()<cr>", "Next occurence" },
  },

  -- FILES --------------------------------------------------------------------

  f = {
    name = "Files",
    f = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Find Files",
    },
    b = { "<cmd>Telescope file_browser<cr>", "Browse Files" },
    s = { "<cmd>w!<CR>", "Save File" },
    p = { "<cmd>echo expand('%')<cr>", "Print File Path" },
  },

  -- BUFFERS ------------------------------------------------------------------

  b = {
    name = "Buffers",
    b = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "List Buffers",
    },
    c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  },

  -- TOGGLE -------------------------------------------------------------------

  t = {
    name = "Toggle",
    w = { "<cmd>:setlocal wrap!<cr>", "Toggle Wrapping" },
    b = { "<cmd>lua package.loaded.gitsigns.toggle_current_line_blame()<cr>", "Toggle Git Line Blame" },
    c = { "<cmd>:ColorizerToggle<cr>", "Toggle Colorizer" },
  },

  -- CLIPBOARD ----------------------------------------------------------------

  c = {
    name = "Clipboard",
    c = { 'V"+y', "Copy line to system clipboard" },
    p = { '"+p', "Paste from system clipboard" },
    f = {
      name = "File Path",
      r = { "<cmd>let @+ = expand('%')<cr>", "Copy Relative Path" },
      a = { "<cmd>let @+ = expand('%:p')<cr>", "Copy Absolute Path" },
    },
  },

  -- PACKER -------------------------------------------------------------------

  p = {
    name = "Packer",
    S = { "<cmd>PackerStatus<cr>", "Status" },
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  -- WINDOW -------------------------------------------------------------------

  w = {
    name = "Window",
    s = {
      name = "Split Window",
      s = { "<cmd>split<cr>", "Horizontal Split" },
      v = { "<cmd>vsplit<cr>", "Vertical Split" },
    },
    c = { "<cmd>close<cr>", "Close Window" },
    r = { "<C-w>=", "Reset Window Alignment" },
  },

  -- TAB ----------------------------------------------------------------------

  T = {
    name = "Tab",
    n = { "<cmd>tab split<cr>", "New Tab" },
    N = { "<cmd>tabedit<cr>", "New Empty Tab" },
    c = { "<cmd>tabclose<cr>", "Close Tab" },
  },

  -- GIT ----------------------------------------------------------------------

  g = {
    name = "Git",
    h = {
      name = "Hunks",
      -- n = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Next Hunk" },
      -- p = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", "Prev Hunk" },
      p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
      s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
      u = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Undo Stage Hunk" },
    },
    c = {
      name = "Commits",
      c = { "<cmd>Telescope git_commits<cr>", "Commits" },
      b = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
    },
    b = { "<cmd>lua require('gitsigns').blame_line()<cr>", "Blame" },
    s = { "<cmd>Telescope git_status<cr>", "Git Status" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
    R = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "Reset Buffer" },
  },

  -- LSP ----------------------------------------------------------------------

  l = {
    name = "LSP",
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    h = { "<cmd>Lspsaga hover_doc<cr>", "Hover Doc" },
    F = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    r = { "<cmd>Lspsaga rename<cr>", "Rename" },
    p = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
    f = { "<cmd>Lspsaga lsp_finder<cr>", "LSP Finder" },
    t = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble List for Buffer" },
    T = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble List for Workspace" },
    d = {
      name = "Diagnostics",
      c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Show Cursor Diagnostic" },
      l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostic" },
      b = { "<cmd>Telescope diagnostics bufnr=0<cr>", "List Buffer Diagnostics" },
      w = { "<cmd>Telescope diagnostics<cr>", "List Workspace Diagnostics" },
    },
    s = {
      name = "Symbols",
      d = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      w = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    },
    g = {
      name = "Goto",
      d = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
      t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
      r = { "<cmd>Telescope lsp_references<cr>", "Goto References" },
    },
    c = {
      name = "Calls",
      i = { "<cmd>Telescope lsp_incoming_calls<cr>", "Incomming Calls" },
      o = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Outgoing Calls" },
    },
    ["?"] = {
      name = "System Info",
      i = { "<cmd>LspInfo<cr>", "Info" },
      I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    },
  },

  -- SAERCH 2 -----------------------------------------------------------------

  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },
}

which_key.register(normal_leader_mappings, {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

-- VISUAL ---------------------------------------------------------------------

local visual_leader_mappings = {
  c = {
    name = "Clipboard",
    c = { '"+y', "Copy selection to system clipboard" },
  },
}

which_key.register(visual_leader_mappings, {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})
