--Plugins
vim.cmd([[
call plug#begin('~/.vim/plugged')

" Language
Plug 'neovim/nvim-lspconfig'
" using a fork of lspsaga until fixed for api change of nvim 0.5.1
"Plug 'tami5/lspsaga.nvim'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Appearance
Plug 'tanvirtin/monokai.nvim'
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

" function
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'windwp/nvim-autopairs'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ethanholz/nvim-lastplace'
Plug 'BurntSushi/ripgrep'
Plug 'glepnir/dashboard-nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'ahmedkhalf/project.nvim'

call plug#end()

source $HOME/.config/nvim/settings/config.vim
source $HOME/.config/nvim/settings/mappings.vim
]])

require('telescope').setup{}
require('telescope').load_extension('projects')
require('telescope').load_extension('fzf')
require('nvim-autopairs').setup{}
require('nvim-lastplace').setup{}
require("project_nvim").setup{}
require("indent_blankline").setup {}

-- lsp config
require('lsp_signature').setup{}
require('nvim-lspconfig/main')
--require('nvim-lspsaga/main')
require('nvim-lspinstall/main')

-- configurations for each plugin
require('nvim-tree/main')
require('nvim-treesitter/main')
require('nvim-cmp/main')
require('nvim-lualine/main')
require('nvim-bufferline/main')
require('nvim-toggleterm/main')



