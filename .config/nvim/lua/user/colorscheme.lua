vim.cmd [[
try
  colorscheme deus
  hi Normal ctermbg=NONE guibg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]
