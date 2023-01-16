local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup({
  options = {
    mode = "buffers",
    numbers = nil,
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    -- indicator = { style = "underline" },
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 30,
    max_prefix_length = 30,
    tab_size = 21,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(_, _, diagnostics_dict, _)
      local s = " "
      for level, count in pairs(diagnostics_dict) do
        local icon
        if level == "error" then
          icon = ""
        elseif level == "warning" then
          icon = ""
        elseif level == "info" then
          icon = ""
        elseif level == "hint" then
          icon = ""
        end
        s = s .. icon .. count .. " "
      end
      return s
    end,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
  },
  -- highlights = {
  --   separator_selected = {
  --     fg = "#16161e",
  --     bg = "#1a1b26",
  --   },
  --   separator_visible = {
  --     fg = "#16161e",
  --     bg = "#1a1b26",
  --   },
  --   separator = {
  --     fg = "#16161e",
  --     bg = "#1a1b26",
  --   },
  --   fill = {
  --     fg = "#a9b1d6",
  --     bg = "#16161e",
  --   },
  --   tab_separator = {
  --     fg = "#16161e",
  --     bg = "#1a1b26",
  --   },
  --   tab_separator_selected = {
  --     fg = "#16161e",
  --     bg = "#1a1b26",
  --   },
  -- },
})
