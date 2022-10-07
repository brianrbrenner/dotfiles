local name = "tokyonight"

-- Check for colorscheme configuration, if available or not
pcall(require, "set.colorscheme.config." ..name)

-- Check if the colorscheme is found
local colorscheme_status_ok, _ = pcall(vim.cmd, "colorscheme " .. name)
if not colorscheme_status_ok then
  return
end
