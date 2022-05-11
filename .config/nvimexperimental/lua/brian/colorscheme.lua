vim.cmd[[
  let g:everforest_transparent_background=1
  let g:everforest_current_word='bold'
  let g:gruvbox_material_transparent_background=1
  hi Normal ctermbg=NONE guibg=NONE
]]
local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
