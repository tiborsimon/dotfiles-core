local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local action_layout = require("telescope.actions.layout")

telescope.setup {
  defaults = {
    -- Available layout strategies: horizontal, vertical, center, cursor, flex,
    -- bottom_pane
    layout_strategy = "vertical",
    layout_config = {
      scroll_speed = 1,
    },

    file_ignore_patterns = {
      ".git",
      "node_modules",
      ".mypy_cache",
      ".pytest_cache",
      "__pycache__",
    },

    -- prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        -- ["<esc>"] = actions.close,

        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-h>"] = actions.cycle_previewers_next,
        ["<C-l>"] = actions.cycle_previewers_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<C-o>"] = action_layout.toggle_preview,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        -- ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      hidden=true,
    },
    -- git_commits = {
    --   layout_config = {
    --     scroll_speed = 1,
    --   }
    -- },
    -- git_bcommits = {
    --   layout_config = {
    --     scroll_speed = 1,
    --   }
    -- },
    -- git_status = {
    --   layout_config = {
    --     scroll_speed = 1,
    --   }
    -- },
    -- diagnostics = {
    --   layout_config = {
    --     scroll_speed = 1,
    --   }
    -- },
    -- lsp_document_symbols = {
    --   layout_config = {
    --     scroll_speed = 1,
    --   }
    -- },
    -- lsp_dynamic_workspace_symbols = {
    --   layout_config = {
    --     scroll_speed = 1,
    --   }
    -- },
    -- lsp_definitions = {
    --   layout_config = {
    --     scroll_speed = 1,
    --   }
    -- },
    -- lsp_type_definitions = {
    --   layout_config = {
    --     scroll_speed = 1,
    --   }
    -- },
    -- lsp_incoming_calls = {
    --   layout_config = {
    --     scroll_speed = 1,
    --   }
    -- },
    -- lsp_outgoing_calls = {
    --   layout_config = {
    --     scroll_speed = 1,
    --   }
    -- },
    -- lsp_references = {
    --   layout_config = {
    --     scroll_speed = 1,
    --   }
    -- },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}
telescope.load_extension("file_browser")
