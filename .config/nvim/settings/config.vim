" defaults
let g:mapleader = "\<Space>"

syntax on
set hidden
set termguicolors
set cursorline
set cc=80
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
set updatetime=300
set timeoutlen=500

" Default value is clap
let g:dashboard_default_executive ='telescope'

" filetype
let g:did_load_filetypes = 1

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
highlight link LspSagaFinderSelection Search

" colorscheme
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

highlight ColorColumn ctermbg=238 guibg=238

colorscheme nightfox
"colorscheme monokai_pro
"let g:gruvbox_flat_style = "dark"
"let g:gruvbox_transparent=1
"colorscheme gruvbox-flat

" reset cursor on exit
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25
augroup END

" whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()
