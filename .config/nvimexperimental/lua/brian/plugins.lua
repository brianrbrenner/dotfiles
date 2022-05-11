return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Language
  use 'nvim-lua/plenary.nvim'
  use {
    "williamboman/nvim-lsp-installer",
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvim-lsp-installer").setup {}
            local lspconfig = require("lspconfig")
            lspconfig.sumneko_lua.setup {}
        end
    }
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Appearance
  use 'kyazdani42/nvim-web-devicons'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'lunarvim/colorschemes'
  use 'nvim-lualine/lualine.nvim'

  -- function
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzf-native.nvim'
  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-tree.lua'
  use 'ethanholz/nvim-lastplace'
  use 'BurntSushi/ripgrep'
  use {'ojroques/nvim-bufbar'}

  end)
