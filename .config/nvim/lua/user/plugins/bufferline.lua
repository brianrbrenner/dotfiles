local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", padding = 1 },
      { filetype = "Outline", text = "Code Outline", highlight = "Directory", padding = 1 },
    },
    indicator = {
      icon = "▎",
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
  },
  highlights = {
    buffer_selected = {
      bold = false,
      italic = false,
    },
    tab_selected = {
      bold = false,
      italic = false,
    },
  },
}
