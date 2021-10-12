" Plugins
call plug#begin('~/.vim/plugged')

" Language
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'

" Appearance
Plug 'tanvirtin/monokai.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

" function
Plug 'windwp/nvim-autopairs'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ethanholz/nvim-lastplace'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'BurntSushi/ripgrep'
Plug 'mhinz/vim-startify'
Plug 'akinsho/toggleterm.nvim'
Plug 'ahmedkhalf/project.nvim'

call plug#end()

" Lua config

lua << EOF

require('telescope').setup{}
require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')
require('nvim-autopairs').setup{}
require('nvim-lastplace').setup{}
require("project_nvim").setup{}

-- blankline-nvim
require("indent_blankline").setup {}

-- lsp config
require('lsp_signature').setup{}

-- configurations for each plugin
require('nvim-lspconfig/main')
require('nvim-cmp/main')
require('nvim-lualine/main')
require('nvim-tree/main')
require('nvim-bufferline/main')
require('nvim-lspsaga/main')
require('nvim-lspinstall/main')
require('nvim-toggleterm/main')

EOF

source $HOME/.config/nvim/settings/config.vim
source $HOME/.config/nvim/settings/mappings.vim
source $HOME/.config/nvim/settings/start-screen.vim

