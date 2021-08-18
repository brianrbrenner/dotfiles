syntax on
set termguicolors
set noshowmode
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

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hrsh7th/nvim-compe'
Plug 'windwp/nvim-autopairs'
Plug 'romgrk/barbar.nvim'

call plug#end()

" Remaps
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" autopairs remaps
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" compe remaps
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Colorscheme
let NERDTreeShowHidden=1
let g:gruvbox_material_transparent_background=1
colorscheme gruvbox-material

" Lua config

lua <<EOF

require('nvim-autopairs').setup{}

-- lsp config
require'lspconfig'.jdtls.setup{} 
require'lspconfig'.clangd.setup{}

-- configurations for each plugin
require('nvim-compe/main')
require('nvim-lualine/main')
require('nvim-tree/main')
require('nvim-barbar/main')

EOF

