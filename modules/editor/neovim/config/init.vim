"=============================================================================
"   _       _ _         _
"  (_)     (_) |       (_)
"   _ _ __  _| |___   ___ _ __ ___
"  | | '_ \| | __\ \ / / | '_ ` _ \
"  | | | | | | |_ \ V /| | | | | | |
"  |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"
"=============================================================================
" NEOVIM CONFIG
"=============================================================================
"  Started on 2021-08-01
"
"=============================================================================
" PLUGINS
"=============================================================================
call plug#begin(stdpath('data') . 'vimplug')

  " Color themes
  Plug 'joshdick/onedark.vim', { 'commit': 'ff0e0a4' }

  " Utilities
  Plug 'folke/which-key.nvim', { 'commit': 'bd4411a' }

  " Picker
  Plug 'nvim-lua/plenary.nvim', { 'commit': '968a4b9' }
  Plug 'nvim-telescope/telescope.nvim', { 'tag': 'nvim-0.6' }
  Plug 'kyazdani42/nvim-web-devicons', { 'commit': '8d2c533' }
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'commit': '6a33ece', 'do': 'make' }

  " File tree
  Plug 'kyazdani42/nvim-tree.lua', { 'commit': '19dcacf' }

  " Tpope magic
  Plug 'tpope/vim-characterize', { 'commit': '967ac3a' }
  Plug 'tpope/vim-commentary', { 'commit': '3654775' }
  Plug 'tpope/vim-repeat', { 'commit': '24afe92' }
  Plug 'tpope/vim-speeddating', { 'commit': '95da3d7' }
  Plug 'tpope/vim-surround', { 'commit': 'bf3480d' }
  Plug 'tpope/vim-unimpaired', { 'commit': 'efdc647' }

  " Parsing
  " Plug 'nvim-treesitter/nvim-treesitter', { 'commit': 'f75e27c' }

  " Status line
  Plug 'nvim-lualine/lualine.nvim', { 'commit': '5113cdb' }

  " Terminal
  Plug 'akinsho/toggleterm.nvim', { 'commit': '04174e1' }

  " Version control
  Plug 'tpope/vim-fugitive', { 'commit': 'f809dde' }
  Plug 'mhinz/vim-signify', { 'commit': '69498f6' }

  " Tmux navigator
  Plug 'christoomey/vim-tmux-navigator', { 'commit': '9ca5bfe' }

call plug#end()


"=============================================================================
" BASIC SETTINGS
"=============================================================================
set nocompatible

syntax enable

set number
set relativenumber
set cursorline

set ignorecase
set smartcase

" Disable backup and swap files as we are using version control tools
set nobackup
set nowritebackup
set noswapfile

" Splits open at the bottom and right, which is non-retarded
set splitbelow splitright

set undofile
set undodir=~/.cache/nvim/undodir

" Tab management: http://stackoverflow.com/a/1878983/1565331
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set smarttab
set smartindent
set autoindent

" Scrolling
set scrolloff=3
set sidescrolloff=5
set scrolljump=0


"==============================================================================
" COLOR THEME
"==============================================================================
colorscheme onedark
" hi Normal guibg=NONE ctermbg=NONE


"==============================================================================
" KEYBOARD MAPPINGS
"==============================================================================
let mapleader="\<Space>"

" Remap the semicolon to be able to use the colon faster.
nnoremap ; :
vnoremap ; :

" Navigate through wrapped long lines intuitively.
nnoremap j gj
nnoremap k gk

" Making a more ergonomic esc. Ctr+[ is better!
"inoremap jk <esc>
"inoremap kj <esc>

" Toggle wrap mode
nnoremap <leader>tw :setlocal wrap!<cr>

" Easyer split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Motion in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <down>
inoremap <C-k> <up>

" Motion in command line
cnoremap <C-h> <left>
cnoremap <C-l> <right>
cnoremap <C-j> <down>
cnoremap <C-k> <up>

" Move lines in all modes
nnoremap J :move .+1<cr>==
nnoremap K :move .-2<cr>==
vnoremap J :move '>+1<cr>gv=gv
vnoremap K :move '<-2<cr>gv=gv

" Indented new line, useful in HTML files
inoremap <C-CR> <CR><Esc>k$o

lua <<EOF
local wk = require("which-key")
wk.register({
  ["<leader>f"] = {
    name = "+[F]ile operations",
    s = { "<cmd>w<cr>", "[S]ave File", silent=False },
    S = { "<cmd>wa<cr>", "[S]ave All Files", silent=False },
  },
})
wk.register({
  ["<leader>t"] = {
    name = "+[T]oggle",
    w = { "<cmd>setlocal wrap!<cr>", "Toggle [W]rap" },
  },
})
EOF


"==============================================================================
" SEARCH CONFIG
"==============================================================================

" Search options
set hlsearch           " Highlight search
set incsearch          " Incremental search
set magic              " Set magic on, for regular expressions
set ignorecase         " Searches are Non Case-sensitive
set smartcase          " Overrides ignorecase, if search contains uppercase character


" Do not jump if a word is selected
nnoremap * :let @/='\<<C-R>=expand("<cword>")<cr>\>'<cr>:set hls<cr>
nnoremap <cr> :let @/='\<<C-R>=expand("<cword>")<cr>\>'<cr>:set hls<cr>

" Enable visual selection search patterns
" Source: http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
set guioptions+=a
function! MakePattern(text)
  let pat = escape(a:text, '\')
  let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
  let pat = substitute(pat, '^\_s\+', '\\s\\*', '')
  let pat = substitute(pat, '\_s\+',  '\\_s\\+', 'g')
  return '\\V' . escape(pat, '\"')
endfunction
vnoremap <silent> <cr> :<C-U>let @/="<C-R>=MakePattern(@*)<cr>"<cr>:set hls<cr>

" Disables the search highlight for the next search
" nnoremap <silent> <leader>/ :nohlsearch<cr>


"=============================================================================
" CLIPBOARD HANDLING
"=============================================================================

vnoremap <C-c> "*y :let @+=@*<cr>
nnoremap <C-P> "+p


"=============================================================================
" PICKER CONFIG
"=============================================================================

lua <<EOF
local wk = require("which-key")
wk.register({
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "[F]ind Files" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open [R]ecent Files" },
  ["<leader>fn"] = { "<cmd>enew<cr>", "[N]ew File" },
})
wk.register({
  ["<leader>/"] = { name = "+Search [/]" },
  ["<leader>//"] = { "<cmd>nohlsearch<cr>", "Remove search highlighting" },
  ["<leader>/l"] = { "<cmd>Telescope live_grep<cr>", "[L]ive Grep" },
  ["<leader>/s"] = { "<cmd>Telescope grep_string<cr>", "Grep [S]tring Under Cursor" },
})
wk.register({
  ["<leader>b"] = { "<cmd>Telescope buffers<cr>", "[B]uffers" },
  ["<leader>//"] = { "<cmd>nohlsearch<cr>", "Remove search highlighting" },
  ["<leader>/l"] = { "<cmd>Telescope live_grep<cr>", "[L]ive Grep" },
  ["<leader>/s"] = { "<cmd>Telescope grep_string<cr>", "Grep [S]tring Under Cursor" },
})
EOF

lua <<EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  pickers = {
    find_files = {
      layout_config = {
        scroll_speed = 1,
        width = 0.8,
      },
    },
    git_commits = {
      layout_config = {
        scroll_speed = 1,
      },
    },
    git_bcommits = {
      layout_config = {
        scroll_speed = 1,
      },
    },
    git_status = {
      layout_config = {
        scroll_speed = 1,
      },
    },
    git_branch = {
      layout_config = {
        scroll_speed = 1,
      },
    },
  },
  defaults = {
    mappings = {
      i = {
        ["<C-e>"] = actions.preview_scrolling_down,
        ["<C-y>"] = actions.preview_scrolling_up,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_previewers_next,
        ["<C-p>"] = actions.cycle_previewers_prev,
        ["<C-v>"] = actions.select_horizontal,
        ["<C-s>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
      },
      n = {
        ["q"] = actions.close,
      },
    },
  }
}

require('telescope').load_extension('fzf')
EOF


"=============================================================================
" FILE TREE
"=============================================================================

lua <<EOF
local wk = require("which-key")
wk.register({
  ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "File [E]xplorer" },
})
EOF

" Nvim-tree config
lua <<EOF
  require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = false,
    reload_on_bufenter = false,
    respect_buf_cwd = false,
    view = {
      adaptive_size = false,
      centralize_selection = false,
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = "left",
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      mappings = {
        custom_only = false,
        list = {
          -- user mappings go here
        },
      },
    },
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      full_name = false,
      highlight_opened_files = "none",
      root_folder_modifier = ":~",
      indent_markers = {
        enable = false,
        icons = {
          corner = "└ ",
          edge = "│ ",
          item = "│ ",
          none = "  ",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = false,
        },
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    update_focused_file = {
      enable = false,
      update_root = false,
      ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = {
      cmd = "",
      args = {},
    },
    diagnostics = {
      enable = false,
      show_on_dirs = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    filters = {
      dotfiles = false,
      custom = {},
      exclude = {},
    },
    filesystem_watchers = {
      enable = false,
      interval = 100,
      debounce_delay = 50,
    },
    git = {
      enable = false,
      ignore = true,
      show_on_dirs = true,
      timeout = 400,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      expand_all = {
        max_folder_discovery = 300,
        exclude = {},
      },
      open_file = {
        quit_on_open = false,
        resize_window = true,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
      remove_file = {
        close_window = true,
      },
    },
    trash = {
      cmd = "gio trash",
      require_confirm = true,
    },
    live_filter = {
      prefix = "[FILTER]: ",
      always_show_folders = true,
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false,
        watcher = false,
      },
    },
  } -- END_DEFAULT_OPTS
EOF

" let g:nvim_tree_disable_default_keybindings = 1

" lua <<EOF
"   local tree_cb = require'nvim-tree.config'.nvim_tree_callback
"   vim.g.nvim_tree_bindings = {
"     { key = {"<CR>", "o"}, cb = tree_cb("edit") },
"     { key = "e",           cb = tree_cb("cd") },
"     { key = "s",           cb = tree_cb("vsplit") },
"     { key = "i",           cb = tree_cb("split") },
"     { key = "t",           cb = tree_cb("tabnew") },
"     { key = "<",           cb = tree_cb("prev_sibling") },
"     { key = ">",           cb = tree_cb("next_sibling") },
"     { key = "P",           cb = tree_cb("parent_node") },
"     { key = "<BS>",        cb = tree_cb("close_node") },
"     { key = "<S-CR>",      cb = tree_cb("close_node") },
"     { key = "<Tab>",       cb = tree_cb("preview") },
"     { key = "K",           cb = tree_cb("first_sibling") },
"     { key = "J",           cb = tree_cb("last_sibling") },
"     { key = "I",           cb = tree_cb("toggle_ignored") },
"     { key = "H",           cb = tree_cb("toggle_dotfiles") },
"     { key = "R",           cb = tree_cb("refresh") },
"     { key = "a",           cb = tree_cb("create") },
"     { key = "d",           cb = tree_cb("remove") },
"     { key = "r",           cb = tree_cb("rename") },
"     { key = "<C-r>",       cb = tree_cb("full_rename") },
"     { key = "x",           cb = tree_cb("cut") },
"     { key = "c",           cb = tree_cb("copy") },
"     { key = "p",           cb = tree_cb("paste") },
"     { key = "y",           cb = tree_cb("copy_name") },
"     { key = "Y",           cb = tree_cb("copy_path") },
"     { key = "gy",          cb = tree_cb("copy_absolute_path") },
"     { key = "[c",          cb = tree_cb("prev_git_item") },
"     { key = "]c",          cb = tree_cb("next_git_item") },
"     { key = "u",           cb = tree_cb("dir_up") },
"     { key = "O",           cb = tree_cb("system_open") },
"     { key = "q",           cb = tree_cb("close") },
"     { key = "?",           cb = tree_cb("toggle_help") },
"   }
" EOF


"=============================================================================
" WHICH-KEY CONFIG
"=============================================================================

lua << EOF
  require("which-key").setup {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = '<c-d>', -- binding to scroll down inside the popup
      scroll_up = '<c-u>', -- binding to scroll up inside the popup
    },
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
  }
EOF


"=============================================================================
" TREESITTER CONFIG
"=============================================================================

" lua << EOF
"   require'nvim-treesitter.configs'.setup {
"     -- A list of parser names, or "all"
"     ensure_installed = {
"       "tsx",
"       "toml",
"       "json",
"       "yaml",
"       "swift",
"       "html",
"       "scss",
"       "python",
"     },
" 
"     -- Install parsers synchronously (only applied to `ensure_installed`)
"     sync_install = false,
" 
"     -- List of parsers to ignore installing (for "all")
"     ignore_install = { "javascript" },
" 
"     highlight = {
"       -- `false` will disable the whole extension
"       enable = true,
" 
"       -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
"       -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
"       -- the name of the parser)
"       -- list of language that will be disabled
"       disable = { "c", "rust" },
" 
"       -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"       -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"       -- Using this option may slow down your editor, and you may see some duplicate highlights.
"       -- Instead of true it can also be a list of languages
"       additional_vim_regex_highlighting = false,
"     },
"   }
" EOF


"=============================================================================
" LUALINE CONFIG
"=============================================================================

lua << EOF
-- require'lualine'.setup {
--   options = {
--     icons_enabled = true,
--     theme = 'auto',
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {},
--     always_divide_middle = true,
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff',
--                   {'diagnostics', sources={'nvim_lsp', 'coc'}}},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = {'fugitive', 'nvim-tree', 'quickfix', 'toggleterm'}
-- }
EOF

lua << EOF
-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require 'lualine'

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#000000',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {'filename'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {'fugitive', 'nvim-tree', 'quickfix', 'toggleterm'}
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
    return ''
  end,
  color = 'LualineMode',
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

-- ins_left {
--   'diagnostics',
--   sources = { 'nvim_lsp' },
--   symbols = { error = ' ', warn = ' ', info = ' ' },
--   diagnostics_color = {
--     color_error = { fg = colors.red },
--     color_warn = { fg = colors.yellow },
--     color_info = { fg = colors.cyan },
--   },
-- }

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
EOF

" NOTE: Please ensure you have set hidden in your neovim config, otherwise the
" terminals will be discarded when closed.
set hidden


"=============================================================================
" TOGGLETERM CONFIG
"=============================================================================

lua <<EOF
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    border = 'curved',
    -- width = <value>,
    -- height = <value>,
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
EOF


"=============================================================================
" VERSION CONTROL CONFIG
"=============================================================================

lua <<EOF
local wk = require("which-key")
wk.register({
  ["<leader>g"] = { name = "+[G]it" },
  ["<leader>gc"] = { "<cmd>Telescope git_bcommits<cr>", "Git [C]ommits for buffer" },
  ["<leader>gC"] = { "<cmd>Telescope git_commits<cr>", "Git [C]ommits" },
  ["<leader>gs"] = { "<cmd>Telescope git_status<cr>", "Git [S]tatus" },
  ["<leader>gb"] = { "<cmd>Telescope git_branch<cr>", "Git [B]ranch" },
})
EOF
