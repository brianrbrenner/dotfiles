" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sainnhe/gruvbox-material'
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hrsh7th/nvim-compe'
Plug 'windwp/nvim-autopairs'
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ethanholz/nvim-lastplace'


call plug#end()

" Lua config

lua <<EOF

require('telescope').setup{}
require('nvim-autopairs').setup{}
require('nvim-lastplace').setup{}

-- lsp config
require'lspconfig'.jdtls.setup{} 
require'lspconfig'.clangd.setup{}

-- configurations for each plugin
require('nvim-compe/main')
require('nvim-lualine/main')
require('nvim-tree/main')
require('nvim-barbar/main')
require('nvim-lspsaga/main')

EOF

source ~/.config/nvim/vim/config.vim
