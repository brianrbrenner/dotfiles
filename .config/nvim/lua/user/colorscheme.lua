vim.cmd [[
try
  let g:everforest_transparent_background = 1
  colorscheme everforest
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]
