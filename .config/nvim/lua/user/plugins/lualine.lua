local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local null_ls = require "user.plugins.lsp.null-ls"
local C = require "user.highlights.palette"
local ofirkai_lualine = require "ofirkai.statuslines.lualine"

local mode_names = {
  ["n"] = "NORMAL",
  ["no"] = "PENDING",
  ["nov"] = "PENDING",
  ["noV"] = "PENDING",
  ["no\22"] = "PENDING",
  ["niI"] = "NORMAL",
  ["niR"] = "NORMAL",
  ["niV"] = "NORMAL",
  ["nt"] = "NORMAL",
  ["ntT"] = "NORMAL",
  ["v"] = "VISUAL",
  ["vs"] = "VISUAL",
  ["V"] = "V-LINE",
  ["Vs"] = "V-LINE",
  ["\22"] = "V-BLOCK",
  ["\22s"] = "V-BLOCK",
  ["s"] = "SELECT",
  ["S"] = "S-LINE",
  ["\19"] = "S-BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["ix"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rc"] = "REPLACE",
  ["Rx"] = "REPLACE",
  ["Rv"] = "V-REPLACE",
  ["Rvc"] = "V-REPLACE",
  ["Rvx"] = "V-REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "EX",
  ["ce"] = "EX",
  ["r"] = "REPLACE",
  ["rm"] = "MORE",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local mode = {
  function()
    local mode_name = vim.api.nvim_get_mode().mode
    if mode_names[mode_name] == nil then
      return mode_name
    end
    return mode_names[mode_name]
  end,
  color = function()
    local mode_color = {
      n = C.blue,
      no = C.blue,
      nov = C.blue,
      noV = C.blue,
      ["no\22"] = C.blue,
      niI = C.blue,
      niR = C.blue,
      ntT = C.blue,
      nt = C.blue,
      i = C.green,
      ic = C.yellow,
      ix = C.green,
      v = C.purple,
      vs = C.purple,
      Vs = C.purple,
      [""] = C.purple,
      ["\22s"] = C.purple,
      V = C.purple,
      s = C.orange,
      S = C.orange,
      [""] = C.orange,
      R = C.red,
      Rc = C.red,
      Rv = C.red,
      Rx = C.red,
      Rvc = C.red,
      Rvx = C.red,
      c = C.yellow,
      cv = C.blue,
      ce = C.blue,
      r = C.red,
      rm = C.cyan,
      ["r?"] = C.cyan,
      ["!"] = C.blue,
      t = C.blue,
    }
    return { fg = mode_color[vim.api.nvim_get_mode().mode], bg = "#252F3D" }
  end,
  separator = { right = "" },
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "hint" },
  symbols = { error = " ", warn = " ", hint = " " },
  diagnostics_color = {
    error = { fg = C.red },
    warn = { fg = C.yellow },
    hint = { fg = C.violet },
  },
  update_in_insert = false,
  always_visible = true,
  color = { bg = C.bg },
  separator = { right = "" },
}

local diff = {
  "diff",
  symbols = { added = " ", modified = " ", removed = " " },
  diff_color = {
    added = { fg = C.green },
    modified = { fg = C.blue },
    removed = { fg = C.red },
  },
  cond = hide_in_width,
  color = { bg = C.bg },
  separator = { left = "" },
}

local branch = {
  "branch",
  icons_enabled = true,
  color = { fg = C.fg, bg = "gray15" },
  icon = " ",
  separator = { right = "" },
}

local filesize = {
  function()
    local function format_file_size(file)
      local size = vim.fn.getfsize(file)
      if size <= 0 then
        return ""
      end
      local sufixes = { " B", " KB", " MB", " GB" }
      local i = 1
      while size > 1024 do
        size = size / 1024
        i = i + 1
      end
      return string.format("%.1f%s", size, sufixes[i])
    end

    local file = vim.fn.expand "%:p"
    if string.len(file) == 0 then
      return ""
    end
    return format_file_size(file)
  end,
  color = { fg = C.green, bg = "gray15" },
  separator = { left = "" },
}

local lsp = {
  function()
    local buf_clients = vim.lsp.buf_get_clients()
    local clients = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(clients, client.name)
      end
    end

    local supported_formatters = null_ls.list_registered_formatters(vim.bo.filetype)
    vim.list_extend(clients, supported_formatters)

    if #clients > 0 then
      return table.concat(clients, ", ")
    else
      return "LS Inactive"
    end
  end,
  -- icon = " :",
  color = { fg = C.fg, gui = "", bg = C.bg },
  separator = { right = "" },
}

-- cool function for progress
local progress = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  color = { fg = C.fg, bg = C.bg },
}

local percent = {
  "progress",
  separator = { left = "" },
  color = { fg = C.fg, bg = "gray22" },
}

local spaces = {
  function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  color = { fg = C.yellow, bg = "gray18" },
  separator = { left = "" },
}
local filetype = {
  "filetype",
  color = { fg = C.fg, bg = C.bg },
  separator = { left = "" },
  pading = 0,
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    -- theme = "auto",
    theme = ofirkai_lualine.theme,
    disabled_filetypes = {
      "dashboard",
      "lspinfo",
      "mason",
      "startuptime",
      "checkhealth",
      "help",
      "TelescopePrompt",
      "toggleterm",
    },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { branch, mode, diagnostics, lsp },
    lualine_x = { diff, filetype, spaces, filesize, percent, progress },
    lualine_y = {},
    lualine_z = {},
  },
}
