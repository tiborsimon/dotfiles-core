local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    scroll_strategy = 'limit',
    mappings = {
      n = {
        ['q'] = actions.close,
      },
      i = {
        -- Scrolling in the preview window.
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-u>"] = actions.preview_scrolling_up,
        -- Selecting results.
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        -- Search history.
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        -- Opening selection in different places.
        ["<C-v>"] = actions.select_horizontal,
        ["<C-s>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        -- Exiting in insert mode.
        ['<Esc>'] = actions.close,
        ['<C-[>'] = actions.close,
      },
    }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw add use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insertt mode mappings
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function()
            vim.cmd('startinsert')
          end
        }
      }
    }
  }
}

-- File related telescope mappings.
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f] Files - [f] Find files in project' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[f] Files - [o] Old files' })

-- Window related telescope mappings.
vim.keymap.set('n', '<leader>wl', builtin.loclist, { desc = '[w] Window - [l] Window location list' })

-- Search related telescope mappings
vim.keymap.set('n', '<leader>/l', builtin.live_grep, { desc = '[/] Search - [l] Live grep' })
vim.keymap.set('n', '<leader>/b', builtin.current_buffer_fuzzy_find, { desc = '[/] Search - [b] Live grep in buffer' })
vim.keymap.set('n', '<leader>//', builtin.grep_string, { desc = '[/] Search - [/] Search for string under cursor' })
vim.keymap.set('n', '<leader>/h', builtin.search_history, { desc = '[/] Search - [h] Search history' })

-- Git related telescope mappings.
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[g] Git - [f] Search in tracked files' })
vim.keymap.set('n', '<leader>gC', builtin.git_commits, { desc = '[g] Git - [C] List commits for current directory' })
vim.keymap.set('n', '<leader>gc', builtin.git_bcommits, { desc = '[g] Git - [c] List commits for current buffer' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = '[g] Git - [b] List branches' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[g] Git - [s] List git status for current directory' })
vim.keymap.set('n', '<leader>gS', builtin.git_stash, { desc = '[g] Git - [S] List stash items for current repository' })

-- LSP related telescope mappings.
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = '[l] LSP - [r] List references' })
vim.keymap.set('n', '<leader>li', builtin.lsp_incoming_calls, { desc = '[l] LSP - [i] List incoming calls' })
vim.keymap.set('n', '<leader>lo', builtin.lsp_outgoing_calls, { desc = '[l] LSP - [o] List outgoing calls' })
vim.keymap.set('n', '<leader>lgd', builtin.lsp_definitions, { desc = '[l] LSP - [g] Goto - [d] Definition' })
vim.keymap.set('n', '<leader>lgt', builtin.lsp_type_definitions, { desc = '[l] LSP - [g] Goto - [t] Type definition' })
vim.keymap.set('n', '<leader>lgi', builtin.lsp_implementations, { desc = '[l] LSP - [g] Goto - [i] Implementations' })
vim.keymap.set('n', '<leader>ld', builtin.diagnostics, { desc = '[l] LSP - [d] Diagnostics' })
vim.keymap.set('n', '<leader>lt', builtin.treesitter, { desc = '[l] LSP - [t] Treesitter symbols' })

-- Command related telescope mappings.
vim.keymap.set('n', '<leader>;;', builtin.commands, { desc = '[;] Commands - [;] List commands' })
vim.keymap.set('n', '<leader>;h', builtin.command_history, { desc = '[;] Commands - [h] Command history' })

-- Individual single level telescope mappings.
vim.keymap.set('n', '<leader>R', builtin.registers, { desc = '[R] List registers' })
vim.keymap.set('n', '<leader>r', builtin.resume, { desc = '[r] Resume to the previously used picker' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = '[b] List buffers!' })
vim.keymap.set('n', '<leader>k', builtin.keymaps, { desc = '[k] List keymappings' })
vim.keymap.set('n', '<leader>m', builtin.marks, { desc = '[m] List marks' })

telescope.load_extension('file_browser')

-- vim.keymap.set('n', '<leader>ff',
--   function()
--     builtin.find_files({
--       no_ignore = false,
--       hidden = true
--     })
--   end)
-- vim.keymap.set('n', '<leader>/l', function()
--   builtin.live_grep()
-- end)
-- vim.keymap.set('n', '<leader>b', function()
--   builtin.buffers()
-- end)
-- vim.keymap.set('n', '<leader>', function()
--   builtin.help_tags()
-- end)
-- vim.keymap.set('n', '<leader>r', function()
--   builtin.resume()
-- end)
-- vim.keymap.set('n', '<leader>ld', function()
--   builtin.diagnostics()
-- end)
-- vim.keymap.set("n", "<leader>e", function()
--   telescope.extensions.file_browser.file_browser({
--     path = "%:p:h",
--     cwd = telescope_buffer_dir(),
--     respect_gitignore = false,
--     hidden = true,
--     grouped = true,
--     previewer = false,
--     initial_mode = "normal",
--     layout_config = { height = 40 }
--   })
-- end)
