local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
end

packer.startup(function(use)
  -- Packer should take care of itself
  use 'wbthomason/packer.nvim' -- Package manager: https://github.com/wbthomason/packer.nvim

  -- Color theme
  use {
    'svrana/neosolarized.nvim', -- Solarized dark theme: https://github.com/svrana/neosolarized.nvim
    requires = {
      'tjdevries/colorbuddy.nvim' -- Colorscheme helper: https://github.com/tjdevries/colorbuddy.nvim
    },
  }

  -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Neovim LSP injection library: https://github.com/jose-elias-alvarez/null-ls.nvim
  use 'onsails/lspkind-nvim' -- vscode-like pictograms: https://github.com/onsails/lspkind.nvim
  use 'neovim/nvim-lspconfig' -- LSP: https://github.com/neovim/nvim-lspconfig
  use 'glepnir/lspsaga.nvim' -- LSP UIs on steroids: https://github.com/glepnir/lspsaga.nvim

  -- Completion
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words: https://github.com/hrsh7th/cmp-buffer
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp souce for neovim's built-in LSP: https://github.com/hrsh7th/cmp-nvim-lsp
  use 'hrsh7th/nvim-cmp' -- Completion: https://github.com/hrsh7th/nvim-cmp

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter', -- Language parser lib: https://github.com/nvim-treesitter/nvim-treesitter
    run = ':TSUpdate'
  }

  -- Snippet engine
  use "L3MON4D3/LuaSnip" -- Snippet engine: https://github.com/L3MON4D3/LuaSnip
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Editing helpers
  use 'windwp/nvim-autopairs' -- Autopairs: https://github.com/windwp/nvim-autopairs
  use 'windwp/nvim-ts-autotag' -- Auto close tags: https://github.com/windwp/nvim-ts-autotag

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', -- General fuzzy finder: https://github.com/nvim-telescope/telescope.nvim
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim', -- Common utilities: https://github.com/nvim-lua/plenary.nvim
    }
  }
  use 'nvim-telescope/telescope-file-browser.nvim' -- File browser: https://github.com/nvim-telescope/telescope-file-browser.nvim

  -- GUI extensions
  use 'kyazdani42/nvim-web-devicons' -- Web icons: https://github.com/nvim-tree/nvim-web-devicons
  use 'nvim-lualine/lualine.nvim' -- Status line: https://github.com/nvim-lualine/lualine.nvim
  use 'akinsho/bufferline.nvim' -- Bufferline plugin: https://github.com/akinsho/bufferline.nvim
  use 'norcalli/nvim-colorizer.lua' -- Colorize color tags: https://github.com/norcalli/nvim-colorizer.lua
  use 'lewis6991/gitsigns.nvim' -- Git signs in the sidebar: https://github.com/lewis6991/gitsigns.nvim

end)
