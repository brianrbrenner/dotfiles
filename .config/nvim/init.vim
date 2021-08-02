syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set nobackup
set incsearch
set scrolloff=8
set cmdheight=2

call plug#begin('~/.config/nvim/plugged')

Plug 'sainnhe/gruvbox-material'
Plug 'neovim/nvim-lspconfig'

call plug#end()

let g:gruvbox_material_transparent_background=1
colorscheme gruvbox-material
