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

return packer.startup(function(use)

  -- PACKER -------------------------------------------------------------------
  use {
    -- https://github.com/wbthomason/packer.nvim
    "wbthomason/packer.nvim",
  }

  -- VARIOUS PLUGINS ----------------------------------------------------------
  use {
    {
      -- https://github.com/nvim-lua/plenary.nvim
      "nvim-lua/plenary.nvim",
    },
    {
      -- https://github.com/windwp/nvim-autopairs
      "windwp/nvim-autopairs",
    },
    {
      -- https://github.com/moll/vim-bbye
      "moll/vim-bbye",
    },
    {
      -- https://github.com/akinsho/toggleterm.nvim
      "akinsho/toggleterm.nvim",
    },
    {
      -- https://github.com/ahmedkhalf/project.nvim
      "ahmedkhalf/project.nvim",
    },
    {
      -- https://github.com/lewis6991/impatient.nvim
      "lewis6991/impatient.nvim",
      config = function()
        require("impatient")
      end,
    },
    {
      -- https://github.com/kylechui/nvim-surround
      "kylechui/nvim-surround",
    },
    {
      -- https://github.com/tpope/vim-speeddating
      "tpope/vim-speeddating",
    },
    {
      -- https://github.com/tpope/vim-repeat
      "tpope/vim-repeat",
    },
    {
      -- https://github.com/phaazon/hop.nvim
      "phaazon/hop.nvim",
      tag = "*",
    },
    {
      -- https://github.com/junegunn/vim-easy-align
      "junegunn/vim-easy-align",
    },
  }

  -- COMMENT HANDLING ---------------------------------------------------------
  use {
    {
      -- https://github.com/numToStr/Comment.nvim
      "numToStr/Comment.nvim",
    },
    {
      -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
      "JoosepAlviste/nvim-ts-context-commentstring",
    }
  }

  -- COLORSCHEMES -------------------------------------------------------------
  use {
    {
      -- https://github.com/tiborsimon/noctis.nvim
      "tiborsimon/noctis.nvim"
    },
    {
      -- https://github.com/tiborsimon/tokyonight.nvim
      "tiborsimon/tokyonight.nvim"
    },
    {
      -- https://github.com/NLKNguyen/papercolor-theme
      "NLKNguyen/papercolor-theme"
    }
  }

  -- GUI IMPROVEMENTS ---------------------------------------------------------
  use {
    {
      -- https://github.com/nvim-lualine/lualine.nvim
      "nvim-lualine/lualine.nvim",
    },
    {
      -- https://github.com/akinsho/bufferline.nvim
      "akinsho/bufferline.nvim",
    },
    {
      -- https://github.com/goolord/alpha-nvim
      "goolord/alpha-nvim",
    },
    {
      -- https://github.com/folke/which-key.nvim
      "folke/which-key.nvim",
    },
    {
      -- https://github.com/nvim-tree/nvim-tree.lua
      "nvim-tree/nvim-tree.lua",
    },
    {
      -- https://github.com/nvim-tree/nvim-web-devicons
      "nvim-tree/nvim-web-devicons",
    },
    {
      -- https://github.com/lukas-reineke/indent-blankline.nvim
      "lukas-reineke/indent-blankline.nvim",
      tags = "*",
    },
    {
      -- https://github.com/nvim-telescope/telescope.nvim
      "nvim-telescope/telescope.nvim",
    },
    {
      -- https://github.com/nvim-telescope/telescope-file-browser.nvim
      "nvim-telescope/telescope-file-browser.nvim",
    },
    {
      -- https://github.com/lewis6991/gitsigns.nvim
      "lewis6991/gitsigns.nvim",
    },
    {
      -- https://github.com/karb94/neoscroll.nvim
      "karb94/neoscroll.nvim",
    },
    {
      -- https://github.com/petertriho/nvim-scrollbar
      "petertriho/nvim-scrollbar",
    },
    {
      -- https://github.com/norcalli/nvim-colorizer.lua
      "norcalli/nvim-colorizer.lua",
    },
    {
      -- https://github.com/folke/zen-mode.nvim
      "folke/zen-mode.nvim",
    },
    {
      -- https://github.com/folke/lsp-colors.nvim
      "folke/lsp-colors.nvim"
    },
  }

  -- TREESITTER ---------------------------------------------------------------
	use {
    {
      -- https://github.com/nvim-treesitter/nvim-treesitter
      "nvim-treesitter/nvim-treesitter",
    },
    {
      -- https://github.com/p00f/nvim-ts-rainbow
      "p00f/nvim-ts-rainbow",
    },
    {
      -- https://github.com/yioneko/nvim-yati
      "yioneko/nvim-yati",
    },
    {
      -- https://github.com/windwp/nvim-ts-autotag
      "windwp/nvim-ts-autotag",
    },
	}

  -- COMPLETION ---------------------------------------------------------------
  use {
    -- https://github.com/hrsh7th/nvim-cmp
    "hrsh7th/nvim-cmp",
    requires = {
      {
        -- https://github.com/hrsh7th/cmp-buffer
        "hrsh7th/cmp-buffer",
      },
      {
        -- https://github.com/hrsh7th/cmp-path
        "hrsh7th/cmp-path",
      },
      {
        -- https://github.com/hrsh7th/cmp-cmdline
        "hrsh7th/cmp-cmdline",
      },
      {
        -- https://github.com/hrsh7th/cmp-nvim-lsp
        "hrsh7th/cmp-nvim-lsp",
      },
      {
        -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
        "hrsh7th/cmp-nvim-lsp-signature-help",
      },
      {
        -- https://github.com/hrsh7th/cmp-nvim-lua
        "hrsh7th/cmp-nvim-lua",
      },
      {
        -- https://github.com/saadparwaiz1/cmp_luasnip
        "saadparwaiz1/cmp_luasnip",
      },
    },
  }

  -- SNIPPETS -----------------------------------------------------------------
  use {
    {
      -- https://github.com/L3MON4D3/LuaSnip
      "L3MON4D3/LuaSnip",
    },
    {
      -- https://github.com/rafamadriz/friendly-snippets
      "rafamadriz/friendly-snippets",
    },
  }

  -- LSP ----------------------------------------------------------------------
  use {
    {
      -- https://github.com/neovim/nvim-lspconfig
      "neovim/nvim-lspconfig",
    },
    {
      -- https://github.com/williamboman/mason.nvim
      "williamboman/mason.nvim",
    },
    {
      -- https://github.com/williamboman/mason-lspconfig.nvim
      "williamboman/mason-lspconfig.nvim",
    },
    {
      -- https://github.com/jose-elias-alvarez/null-ls.nvim
      "jose-elias-alvarez/null-ls.nvim",
    },
    {
      -- https://github.com/RRethy/vim-illuminate
      "RRethy/vim-illuminate",
    },
    {
      -- https://github.com/glepnir/lspsaga.nvim
      "glepnir/lspsaga.nvim",
    },
    {
      -- https://github.com/folke/neodev.nvim
      "folke/neodev.nvim",
    },
    {
      -- https://github.com/folke/trouble.nvim
      "folke/trouble.nvim",
    },
    {
      -- https://github.com/folke/todo-comments.nvim
      "folke/todo-comments.nvim",
    },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
