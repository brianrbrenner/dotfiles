local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  return
end

lspsaga.init_lsp_saga {
  -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = "rounded",
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
    enable = false,
  },
  rename_in_select = false,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  rename_action_quit = ";",
  -- show symbols in winbar must nightly
  symbol_in_winbar = {
    in_custom = false,
    enable = false,
    separator = "  ",
    show_file = true,
    click_support = false,
  },
}
