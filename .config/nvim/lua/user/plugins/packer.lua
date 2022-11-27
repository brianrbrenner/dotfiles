local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local compile_path = fn.stdpath "config" .. "/lua/packer_compiled.lua"

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
  require("packer").packadd = "packer.nvim"
end

local Packer = augroup("packer_config", { clear = true })

-- Automatically re-compile packer whenever you save packer.lua
autocmd("BufWritePost", {
  callback = function()
    vim.cmd [[ source <afile> | PackerCompile ]]
  end,
  group = Packer,
  pattern = "packer.lua",
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local packer_compiled_ok, _ = pcall(require, "packer_compiled")
if not packer_compiled_ok then
  vim.notify_once("Please Run :PackerCompile", vim.log.levels.INFO)
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  compile_path = compile_path,
  git = {
    clone_timeout = 300,
  },
  working_sym = "", -- The symbol for a plugin being installed/updated
  error_sym = "✗", -- The symbol for a plugin with an error in installation/updating
  done_sym = "✓", -- The symbol for a plugin which has completed installation/updating
}

local plugins = {
  ["wbthomason/packer.nvim"] = {}, -- Have packer manage itself

  ["nvim-lua/plenary.nvim"] = {}, -- Useful lua functions used by lots of plugins

  ["windwp/nvim-autopairs"] = {}, -- Autopairs, integrates with both cmp and treesitter

  ["numToStr/Comment.nvim"] = {}, -- Easily comment

  ["JoosepAlviste/nvim-ts-context-commentstring"] = {}, -- Setting the commentstring option based on the cursor location in the file

  ["kyazdani42/nvim-web-devicons"] = {}, -- Icons and Glyphs

  ["kyazdani42/nvim-tree.lua"] = {}, -- File explorer

  ["akinsho/bufferline.nvim"] = {}, -- Tabline

  ["moll/vim-bbye"] = {}, -- Delete Buffer

  ["nvim-lualine/lualine.nvim"] = {}, -- Statusline

  ["lewis6991/impatient.nvim"] = {}, -- Improve Neovim Startup Time

  ["goolord/alpha-nvim"] = {}, -- Startup Screen

  ["norcalli/nvim-colorizer.lua"] = {}, -- Preview Colors

  ["akinsho/toggleterm.nvim"] = {}, -- Terminal

  ["lukas-reineke/indent-blankline.nvim"] = {}, -- Indent Guide

  -- Colorscheme
  ["folke/tokyonight.nvim"] = {},

  ["ellisonleao/gruvbox.nvim"] = {},

  ["Yazeed1s/oh-lucy.nvim"] = {},
  -- ["Lunarvim/onedarker.nvim"] = {
  --   branch = "freeze",
  -- },

  ["navarasu/onedark.nvim"] = {},

  ["rmehri01/onenord.nvim"] = {},

  ["rebelot/kanagawa.nvim"] = {},

  ["ofirgall/ofirkai.nvim"] = {},
  -- ["projekt0n/github-nvim-theme"] = {},

  -- ["Mofiqul/vscode.nvim"] = {},

  -- ["catppuccin/nvim"] = {},

  ["sam4llis/nvim-tundra"] = {},

  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  }, --Markdown Preview

  ["is0n/jaq-nvim"] = {}, -- Code Runner

  -- cmp plugins
  ["hrsh7th/nvim-cmp"] = {}, -- The completion plugin

  ["hrsh7th/cmp-buffer"] = {}, -- buffer completions

  ["hrsh7th/cmp-path"] = {}, -- path completions

  ["saadparwaiz1/cmp_luasnip"] = {}, -- snippet completions

  ["hrsh7th/cmp-nvim-lsp"] = {}, -- lsp completions

  ["hrsh7th/cmp-nvim-lua"] = {}, -- lua completions

  ["ggandor/leap.nvim"] = {}, -- sneak

  -- Snippets
  ["L3MON4D3/LuaSnip"] = {}, --snippet engine

  ["rafamadriz/friendly-snippets"] = {}, -- a bunch of snippets to use

  ---LSP
  ["neovim/nvim-lspconfig"] = {}, -- enable LSP

  ["ray-x/lsp_signature.nvim"] = {},

  ["jose-elias-alvarez/null-ls.nvim"] = {}, -- for formatters and linters

  ["RRethy/vim-illuminate"] = {}, -- LSP Highlight

  ["glepnir/lspsaga.nvim"] = {}, -- LSP UI

  ["williamboman/mason.nvim"] = {}, -- LSP Installer

  ["williamboman/mason-lspconfig.nvim"] = {}, -- LSP Configuration

  -- Telescope
  ["nvim-telescope/telescope.nvim"] = {}, -- FZF

  -- Projects
  ["ahmedkhalf/project.nvim"] = {
    requires = { "neovim/nvim-lspconfig" },
    config = function()
      require("project_nvim").setup {
        manual_mode = false,
        detection_methods = { "lsp", "pattern" },
        silent_chdir = true,
        show_hidden = true,
      }
    end,
  },

  -- Treesitter
  ["nvim-treesitter/nvim-treesitter"] = {
    run = ":TSUpdate",
  },

  -- Git
  ["lewis6991/gitsigns.nvim"] = {}, -- Git Signs

  -- Key Bindings Popup
  ["folke/which-key.nvim"] = {},
}

-- Install your plugins here
return packer.startup(function(use)
  for key, plugin in pairs(plugins) do
    if type(key) == "string" and not plugin[1] then
      plugin[1] = key
    end

    use(plugin)
  end

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
