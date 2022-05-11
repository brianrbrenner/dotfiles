vim.cmd[[
  let g:everforest_transparent_background=1
  hi Normal ctermbg=NONE guibg=NONE
]]
local colorscheme = "system76"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
