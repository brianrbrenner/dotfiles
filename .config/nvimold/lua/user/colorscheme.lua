vim.cmd [[
try
  colorscheme jellybeans-nvim
  "hi Normal ctermbg=NONE guibg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]
