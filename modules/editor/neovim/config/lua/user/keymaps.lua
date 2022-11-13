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
--   2009-10-26


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
keymap('n', '[b', ":bprevious<CR>", opts)
keymap('n', ']b', ":bnext<CR>", opts)

-- Navigate tabs
keymap("n", "<Tab>", "gt", opts)
keymap("n", "<S-Tab>", "gT", opts)

-- Increment/decrement
keymap('n', '-', '<C-a>', opts)
keymap('n', '+', '<C-x>', opts)

-- Navigate through wrapped long lines more intuitively.
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)

-- Search for word under cursor
keymap('n', '<Return>', "*``", opts)

-- Illuminate mappings
keymap('n', '<C-n>', ":lua require('illuminate').goto_next_reference()<cr>", opts)
keymap('n', '<C-p>', ":lua require('illuminate').goto_prev_reference()<cr>", opts)

-- Git hunk navigation
keymap('n', 'gn', ":lua require('gitsigns').next_hunk()<cr>", opts)
keymap('n', 'gp', ":lua require('gitsigns').prev_hunk()<cr>", opts)

-- Mouse if for scrolling only
keymap('n', '<LeftMouse>', "<nop>", opts)
keymap('n', '<RightMouse>', "<nop>", opts)

-- INSERT ---------------------------------------------------------------------

-- Motion in insert mode
keymap('i', '<C-h>', '<left>', opts)
keymap('i', '<C-l>', '<right>', opts)
keymap('i', '<C-j>', '<down>', opts)
keymap('i', '<C-k>', '<up>', opts)

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

keymap('c', '<C-h>', '<left>', { noremap = false })
keymap('c', '<C-l>', '<right>', { noremap = false })
keymap('c', '<C-j>', '<down>', { noremap = false })
keymap('c', '<C-k>', '<up>', { noremap = false })

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

which_key.register(
  {
    ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
    ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    ["r"] = { "<cmd>Telescope resume<cr>", "Resume Last Picker" },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

    ["/"] = {
      name = "Search",
      ["/"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
      l = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
      n = { "<cmd>lua require('illuminate').goto_next_reference()<cr>", "Next occurence" },
      p = { "<cmd>lua require('illuminate').goto_prev_reference()<cr>", "Next occurence" },
    },

    f = {
      name = "Files",
      f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Find Files" },
      b = { "<cmd>Telescope file_browser<cr>", "Browse Files" },
      s = { "<cmd>w!<CR>", "Save File" },
      p = { "<cmd>echo expand('%')<cr>", "Print File Path" },
    },

    b = {
      name = "Buffers",
      b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "List Buffers" },
      c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    },

    t = {
      name = "Toggle",
      w = { "<cmd>:setlocal wrap!<cr>", "Toggle Wrapping" },
      b = { "<cmd>lua package.loaded.gitsigns.toggle_current_line_blame()<cr>", "Toggle Git Line Blame" },
    },

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

    p = {
      name = "Packer",
      S = { "<cmd>PackerStatus<cr>", "Status" },
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

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

    T = {
      name = "Tab",
      n = { '<cmd>tab split<cr>', "New Tab" },
      N = { '<cmd>tabedit<cr>', "New Empty Tab" },
      c = { '<cmd>tabclose<cr>', "Close Tab" },
    },

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

    l = {
      name = "LSP",
      a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
      h = { "<cmd>Lspsaga hover_doc<cr>", "Hover Doc" },
      f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
      r = { "<cmd>Lspsaga rename<cr>", "Rename" },
      d = {
        name = "Diagnostics",
        d = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostic" },
        n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
        p = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous Diagnostic" },
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
        d = {"<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Goto Definition" },
        t = {"<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", "Goto Type Definition" },
        D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
        i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
        c = {"<cmd>lua require('telescope.builtin').lsp_incoming_calls()<cr>", "Goto Incomming Calls" },
        C = {"<cmd>lua require('telescope.builtin').lsp_outgoing_calls()<cr>", "Goto Outgoing Calls" },
        r = {"<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Goto References" },
      },
      ["?"] = {
        name = "System Info",
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      },
    },

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
  },
  {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }
)

-- VISUAL ---------------------------------------------------------------------

which_key.register(
  {
    c = {
      name = "Clipboard",
      c = { '"+y', "Copy selection to system clipboard" },
    },
  },
  {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }
)
