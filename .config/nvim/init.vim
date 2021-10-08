" Plugins
call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tanvirtin/monokai.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hrsh7th/nvim-compe'
Plug 'windwp/nvim-autopairs'
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ethanholz/nvim-lastplace'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'BurntSushi/ripgrep'
Plug 'mhinz/vim-startify'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'akinsho/toggleterm.nvim'
Plug 'ray-x/lsp_signature.nvim'

call plug#end()

" Lua config

lua << EOF

require('telescope').setup{}
require('telescope').load_extension('fzf')
require('nvim-autopairs').setup{}
require('nvim-lastplace').setup{}

-- blankline-nvim
require("indent_blankline").setup {}

-- lsp config
require'lspconfig'.clangd.setup{}
require'lspconfig'.tsserver.setup{}
require'lsp_signature'.setup{}

-- configurations for each plugin
require('nvim-compe/main')
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
