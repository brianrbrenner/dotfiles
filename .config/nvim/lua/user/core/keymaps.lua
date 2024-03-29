local opts = { silent = true }
local command_opts = { expr = true }
local fn = vim.fn

local modes = {
  normal_mode = "n",
  insert_mode = "i",
  terminal_mode = "t",
  visual_mode = "v",
  visual_block_mode = "x",
  command_mode = "c",
}

local function forward_search()
  if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
    return "<CR>/<C-r>/"
  end
  return "<C-z>"
end

local function backward_search()
  if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
    return "<CR>?<C-r>/"
  end
  return "<S-Tab>"
end

local keymaps = {
  normal_mode = {
    -- Better window navigation
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-h>"] = "<C-w>h",
    ["<C-l>"] = "<C-w>l",
    -- Move Next Window
    ["<Leader>w"] = "<C-w>w",
    -- Close Window
    ["Q"] = ":Bdelete!<CR>",
    -- Center screen on up and down half page
    ["<C-u>"] = "<C-u>zz",
    ["<C-d>"] = "<C-d>zz",

    -- Resize with arrows
    ["<C-Up>"] = ":resize +2<CR>",
    ["<C-Down>"] = ":resize -2<CR>",
    ["<C-Left>"] = ":vertical resize +2<CR>",
    ["<C-Right>"] = ":vertical resize -2<CR>",
    -- Navigate buffers
    ["L"] = ":bnext<CR>",
    ["H"] = ":bprevious<CR>",
    -- Indent lines
    ["<"] = "<<",
    [">"] = ">>",

    -- Move text up and down
    ["<A-j>"] = ":m .+1<CR>==",
    ["<A-k>"] = ":m .-2<CR>==",
  },
  insert_mode = {
    -- exit other mode
    ["jk"] = "<Esc>",
    ["kj"] = "<Esc>",
    -- Move text up and down
    ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
    ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
  },
  terminal_mode = {
    -- Terminal Navigation
    ["C-j"] = "<C-\\><C-n><C-W>j",
    ["C-k"] = "<C-\\><C-n><C-W>k",
    ["C-h"] = "<C-\\><C-n><C-W>h",
    ["C-l"] = "<C-\\><C-n><C-W>l",
    -- exit other modes
    ["jk"] = "<C-\\><C-n>",
  },
  visual_mode = {
    -- Better Paste
    ["p"] = '"_dP',
    -- exit other modes
    ["jk"] = "<Esc>",
    -- Indent lines
    ["<"] = "<gv",
    [">"] = ">gv",
    -- Move text up and down
    ["<A-j>"] = ":m '>+1<CR>gv=gv",
    ["<A-k>"] = ":m '<-2<CR>gv=gv",
  },
  visual_block_mode = {
    -- Move text up and down
    ["<A-j>"] = ":m '>+1<CR>gv=gv",
    ["<A-k>"] = ":m '<-2<CR>gv=gv",
    ["<leader>p"] = "\"_dP",
  },

  -- buffers
  ["<leader>b"] = ":BufferLinePick<CR>",
  ["<leader>B"] = ":FzfLua buffers<CR>",
  command_mode = {
    -- Word Search Increment and Decrement
    ["<Tab>"] = forward_search,
    ["<S-Tab>"] = backward_search,
  },
}

for i, k in pairs(keymaps.normal_mode) do
  vim.keymap.set(modes.normal_mode, i, k, opts)
end

for i, k in pairs(keymaps.insert_mode) do
  vim.keymap.set(modes.insert_mode, i, k, opts)
end

for i, k in pairs(keymaps.terminal_mode) do
  vim.keymap.set(modes.terminal_mode, i, k, opts)
end

for i, k in pairs(keymaps.visual_mode) do
  vim.keymap.set(modes.visual_mode, i, k, opts)
end

for i, k in pairs(keymaps.visual_block_mode) do
  vim.keymap.set(modes.visual_block_mode, i, k, opts)
end

for i, k in pairs(keymaps.command_mode) do
  vim.keymap.set(modes.command_mode, i, k, command_opts)
end
