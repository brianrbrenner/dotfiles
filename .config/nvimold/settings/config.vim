" defaults
let g:mapleader = "\<Space>"

syntax on
set hidden
set termguicolors
set cursorline
set nohlsearch
set mouse=a
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

" status-line
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}

"set laststatus=2
"set statusline=
""set statusline+=%#CursorColumn#
""set statusline+=%#PmenuSel#
"set statusline+=\ %{toupper(g:currentmode[mode()])}
"set statusline+=%{StatuslineGit()}
"set statusline+=%#LineNr#
"set statusline+=%#192330#
"set statusline+=%=
""set statusline+=%#CursorColumn#
"set statusline+=\ %y
"set statusline+=\ %p%%
"set statusline+=\ %l:%c
"set statusline+=\

" Default value is clap
let g:dashboard_default_executive ='telescope'

" filetype
let g:did_load_filetypes = 1

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
highlight link LspSagaFinderSelection Search
highlight ColorColumn ctermbg=238 guibg=238

" colorscheme
"au ColorScheme * hi Normal ctermbg=none guibg=#282426
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

colorscheme nightfox

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

" goneovim
let neovide_remember_window_size = v:true
let g:neovide_cursor_animation_length=0.08
set guifont=Iosevka:h12
