local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 8,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", ":", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local function toggleAlpha()
  if vim.bo.buftype == "" or vim.bo.filetype == "alpha" or vim.bo.filetype == "checkhealth" then
    vim.cmd ":Alpha"
  end
end

local mappings = {
  ["a"] = { toggleAlpha, "Alpha" },
  ["r"] = { ":%d+<cr>", "Remove All Text" },
  ["y"] = { ":%y+<cr>", "Yank All Text" },
  ["e"] = { ":NvimTreeToggle<cr>", "Explorer" },
  ["q"] = { ":qa!<cr>", "Exit" },
  ["c"] = { ":Bdelete!<cr>", "Close Buffer" },
  ["f"] = {
    ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find files",
  },
  ["F"] = { ":Telescope live_grep theme=get_dropdown<cr>", "Find Text" },
  p = {
    name = "Packer",
    c = { ":PackerCompile<cr>", "Compile" },
    C = { ":PackerClean<cr>", "Clean" },
    i = { ":PackerInstall<cr>", "Install" },
    s = { ":PackerSync<cr>", "Sync" },
    S = { ":PackerStatus<cr>", "Status" },
  },
  g = {
    name = "Git",
    g = { ":lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
    j = { ":lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { ":lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { ":lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { ":lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { ":lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { ":lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { ":lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      ":lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { ":Telescope git_status<cr>", "Open changed file" },
    b = { ":Telescope git_branches<cr>", "Checkout branch" },
    c = { ":Telescope git_commits<cr>", "Checkout commit" },
    d = {
      ":Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  l = {
    name = "LSP",
    a = { ":Lspsaga code_action<cr>", "Code Action" },
    f = { ":Format<cr>", "Format" },
    i = { ":LspInfo<cr>", "Info" },
    m = { ":Mason<cr>", "Mason Installer" },
    j = {
      ":Lspsaga diagnostic_jump_next<cr>",
      "Next Diagnostic",
    },
    k = {
      ":Lspsaga diagnostic_jump_prev<cr>",
      "Prev Diagnostic",
    },
    r = { ":Lspsaga rename<cr>", "Rename" },
    d = { ":Telescope diagnostics<cr>", "Diagnostics" },
    s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { ":Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
  },
  s = {
    name = "Search",
    b = { ":Telescope git_branches<cr>", "Checkout branch" },
    c = { ":Telescope colorscheme<cr>", "Colorscheme" },
    h = { ":Telescope help_tags<cr>", "Find Help" },
    k = { ":Telescope keymaps<cr>", "Keymaps" },
    C = { ":Telescope commands<cr>", "Commands" },
    H = { ":Telescope highlights<cr>", "Highlights" },
  },

  t = {
    name = "Terminal",
    f = { ":ToggleTerm direction=float<cr>", "Float" },
    h = { ":ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { ":ToggleTerm size=50 direction=vertical<cr>", "Vertical" },
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
