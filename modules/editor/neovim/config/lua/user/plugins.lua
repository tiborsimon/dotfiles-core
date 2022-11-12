local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself


  -- My plugins here
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used ny lots of plugins
  use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
	use {
    -- Delete buffers and close files - https://github.com/moll/vim-bbye
    "moll/vim-bbye",
  }
  use { "akinsho/toggleterm.nvim" }
  use {
    -- The superior project management for neovim - https://github.com/ahmedkhalf/project.nvim
    "ahmedkhalf/project.nvim",
  }
  -- use { "lewis6991/impatient.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }

  -- Comment handling
  use {
    -- Smart and powerful comment plugin for neovim - https://github.com/numToStr/Comment.nvim
    "numToStr/Comment.nvim",
  }
  use {
    -- Neovim treesitter plugin for settings the commentstring based on the cursor location - https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    "JoosepAlviste/nvim-ts-context-commentstring",
  }


  -- GUI improvements
  use {
    -- Custom status line - https://github.com/nvim-lualine/lualine.nvim
    "nvim-lualine/lualine.nvim",
  }
  use {
    -- A snazzy bufferline for Neovim - https://github.com/akinsho/bufferline.nvim
    "akinsho/bufferline.nvim",
  }
  use {
    -- A lua powered greeter screen - https://github.com/goolord/alpha-nvim
    "goolord/alpha-nvim",
  }
  use {
    "kyazdani42/nvim-web-devicons",
  }
	use {
    -- Key bindings popup window - https://github.com/folke/which-key.nvim
    "folke/which-key.nvim",
  }
  use {
    "kyazdani42/nvim-tree.lua",
  }


  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  -- use "lunarvim/darkplus.nvim"
  use { 'folke/tokyonight.nvim' }


  -- Cmp plugins
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "hrsh7th/cmp-cmdline" } -- cmdline completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }


  -- Snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use


  -- LSP
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim" } -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" } -- simple to use language server installer
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" }
  use { 'kkharji/lspsaga.nvim' }


  -- Telescope
	use {
    -- Custom pickers - https://github.com/nvim-telescope/telescope.nvim
    "nvim-telescope/telescope.nvim",
  }
  use {
    -- telescope based file browser - https://github.com/nvim-telescope/telescope-file-browser.nvim
    "nvim-telescope/telescope-file-browser.nvim",
  }


	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
	}

	-- Git
	use {
    -- Git integration for buffers - https://github.com/lewis6991/gitsigns.nvim
    "lewis6991/gitsigns.nvim",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
