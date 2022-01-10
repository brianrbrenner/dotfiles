-- defaults
local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

g.mapleader = "<Space>"

cmd[[syntax on]]
opt.hidden = true
opt.termguicolors = true
cmd[[t_Co=256]]
cmd[[set noshowmode = true]]
opt.ruler = true
opt.noerrorbells = true
opt.tabstop=4
opt.softtabstop=4
opt.shiftwidth=4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.smarttab = true
opt.nu = true
opt.nowrap = true
opt.noswapfile = true
opt.smartcase = true
opt.nobackup = true
opt.incsearch = true
opt.scrolloff=8
opt.cmdheight=1
opt.relativenumber = true
opt.updatetime=300
opt.timeoutlen=500

g.dashboard_default_executive ='telescope'

-- a list of groups can be found at `:help nvim_tree_highlight`
cmd[[highlight NvimTreeFolderIcon guibg=blue]]
cmd[[highlight link LspSagaFinderSelection Search]]

-- colorscheme
cmd[[au ColorScheme * hi Normal ctermbg=none guibg=none]]
cmd[[au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red]]
cmd[[colorscheme monokai_pro]]

-- reset cursor on exit
cmd([[augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25
augroup END]])
