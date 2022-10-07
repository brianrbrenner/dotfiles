local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

local pickers = {
  oldfiles = {
    prompt_title = "Recent Files",
  }
}

telescope.setup {
  defaults = {
    layout_config = {
      width = 0.8,
      prompt_position = "top",
      preview_cutoff = 120,
      horizontal = { mirror = false },
      vertical = { mirror = false },
    },
    layout_strategy = "horizontal",
    winblend = 8,
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    prompt_prefix = " ",
    selection_caret = "ﰲ ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<A-j>"] = actions.move_selection_next,
        ["<A-k>"] = actions.move_selection_previous,
        ["<Tab>"] = actions.move_selection_next,
        ["<S-Tab>"] = actions.move_selection_previous,
        [";"] = actions.close,
      },
      n = {
        [";"] = actions.close,
      },
    },
  },
  pickers = pickers,
}
