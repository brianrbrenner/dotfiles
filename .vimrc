syntax on
set clipboard=unnamedplus
set whichwrap+=<,>,[,],h,l
set iskeyword+=-
set nohlsearch
set nobackup
set noswapfile
set cmdheight=1
set laststatus=2
set termguicolors
set shiftwidth=4                                " number of spaces to use for indenting
set softtabstop=4                               " number of spaces to use when inserting a tab
set tabstop=4                                   " show tabs as 2 spaces
set expandtab                                   " convert tabs into spaces
set autoindent                                  " copy indent from previous line
set nowrap                                      " don't wrap long lines
set ignorecase smartcase                        " search case-insensitively unless uppercase characters are used
set hidden                                      " allow unsaved buffers to be hidden
set ruler                                       " show cursor line and column in status
set showcmd                                     " show current command in status line
set visualbell                                  " visual bell = no sounds
set undofile                                    " store undo info in a file
set sidescrolloff=7                             " keep 7 characters visible to the left/right of the cursor when scrolling
set sidescroll=1                                " scroll left/right one character at a time
set splitbelow splitright                       " put new windows below or to the right
set t_Co=256
set encoding=utf-8
set splitright
set splitbelow
set number
set relativenumber
set cursorline
set mouse=a

" indentation
set listchars=tab:\|\ 
set list

" reset cursor
augroup RestoreCursorShapeOnExit                                                                    
  autocmd!                                                                                        
  autocmd VimLeave * set guicursor=a:ver25                                                        
augroup END                           

let mapleader=" "                               " set <space> as the leader for mappings
nnoremap <space> <nop>

" Plugs
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'bfrg/vim-cpp-modern'
call plug#end()

colorscheme gruvbox
set background=dark

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" coc completions
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

" move line mappings
vnoremap <A-j> :m .+1<CR>==
vnoremap <A-k> :m .-2<CR>==

" git mappings
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gph :Gpush<CR>
nmap <leader>gpl :Gpull<CR>

" fast normal
inoremap <silent> jk <ESC>
inoremap <silent> kj <ESC>

" navigate buffers
nnoremap <silent> <S-l> :bnext<CR>
nnoremap <silent> <S-h> :bprev<CR>
nnoremap <leader>bd :bd<CR>

" navigate windows
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-l> <C-w>l

" FZF
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fg :Rg<CR>

" format code with Ale
" auto format code
au BufWrite *.rs,*.c,*.h,*.cpp,*.hpp,*.js :ALEFix
au User ALEFixPost :w
let g:ale_linters = { 'c': ['clangd'], 'cpp': ['clangd'] }
let g:ale_fixers = { 'c': ['clang-format'], 'cpp': ['clang-format'] }

" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" settings
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" rooter
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

" highlights
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1
