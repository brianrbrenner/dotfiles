local status_ok, vscode = pcall(require, "vscode")
if not status_ok then
  return
end

vscode.setup {
  -- Enable transparent background
  transparent = true,

  -- Enable italic comment
  italic_comments = true,

  -- Disable nvim-tree background color
  disable_nvimtree_bg = true,
}
