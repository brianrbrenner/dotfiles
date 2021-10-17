" defaults
let g:mapleader = "\<Space>"

syntax on
set hidden
set termguicolors
set t_Co=256
set noshowmode
set ruler
set noerrorbells
set tabstop=4 softtabstop=4
set iskeyword+=-
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set smarttab
set nu
set nowrap
set noswapfile
set smartcase
set nobackup
set incsearch
set scrolloff=8
set cmdheight=1
set relativenumber
set updatetime=300
set timeoutlen=500

" Default value is clap
let g:dashboard_default_executive ='telescope'

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
highlight link LspSagaFinderSelection Search

" colorscheme
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

colorscheme monokai_pro

" reset cursor on exit
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25
augroup END    
