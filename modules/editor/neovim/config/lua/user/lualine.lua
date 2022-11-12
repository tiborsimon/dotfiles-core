local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local filename = {
	"filename",
	filename_status = true,
	newfile_status = true,
	path = 1,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 1,
}

local progress = {
	"progress",
	padding = 1,
}

local spaces = function()
	return " " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "tokyonight",

    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},

    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},

    -- section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = '' },

    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = '' },

		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch },
		lualine_b = { filename },
		lualine_c = { diff },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

