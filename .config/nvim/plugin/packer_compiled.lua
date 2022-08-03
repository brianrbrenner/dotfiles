-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/brian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\2Ó\3\0\1\6\0\22\00066\1\0\0009\1\1\0019\1\2\1\a\1\3\0X\0010€6\1\4\0'\2\5\0B\1\2\0029\2\6\0009\3\6\0019\3\a\3\5\2\3\0X\2\2€'\2\b\0X\3\1€'\2\t\0+\3\0\0009\4\6\0009\5\6\0019\5\n\5\5\4\5\0X\4\a€6\4\4\0'\5\v\0B\4\2\0029\4\f\4B\4\1\2\18\3\4\0X\4\16€9\4\r\0009\5\r\0019\5\14\5\4\4\5\0X\4\5€9\4\r\0009\5\r\0019\5\15\5\5\4\5\0X\4\6€6\4\4\0'\5\v\0B\4\2\0029\4\16\4B\4\1\2\18\3\4\0006\4\4\0'\5\17\0B\4\2\0029\4\18\0045\5\19\0=\2\20\5=\3\21\5D\4\2\0K\0\1\0\rlocation\bkey\1\0\0\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\16__multiline\14__default\tline\nctype\18Comment.utils\frequire\bvue\rfiletype\abo\bvimN\1\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0003\2\3\0=\2\5\1B\0\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\2ã\1\0\0\3\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\1B\0\2\1K\0\1\0\15treesitter\1\0\1\17update_delay\3d\rbackends\1\0\6\17manage_folds\1\23link_folds_to_tree\1\23link_tree_to_folds\1\19close_behavior\nclose\14min_width\3\20\14max_width\3(\1\2\0\0\15treesitter\nsetup\vaerial\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\0029\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\30ag.plugin-conf.catppuccin\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["editorconfig-vim"] = {
    config = { '\27LJ\2\2Q\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\18fugitive://.*"EditorConfig_exclude_patterns\6g\bvim\0' },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2ž\3\0\1\a\0\16\0+5\1\0\0=\0\1\0016\2\2\0009\2\3\0029\2\4\2'\3\5\0'\4\6\0'\5\a\0\18\6\1\0B\2\5\0016\2\2\0009\2\3\0029\2\4\2'\3\5\0'\4\b\0'\5\t\0\18\6\1\0B\2\5\0016\2\2\0009\2\3\0029\2\4\2'\3\5\0'\4\n\0'\5\v\0\18\6\1\0B\2\5\0016\2\2\0009\2\3\0029\2\4\2'\3\5\0'\4\f\0'\5\r\0\18\6\1\0B\2\5\0016\2\2\0009\2\3\0029\2\4\2'\3\5\0'\4\14\0'\5\15\0\18\6\1\0B\2\5\1K\0\1\0 <cmd>Gitsigns prev_hunk<CR>\15<Leader>gp <cmd>Gitsigns next_hunk<CR>\15<Leader>gn!<cmd>Gitsigns stage_hunk<CR>\15<Leader>sh!<cmd>Gitsigns reset_hunk<CR>\15<Leader>rh#<cmd>Gitsigns preview_hunk<CR>\6=\6n\bset\vkeymap\bvim\vbuffer\1\0\2\fnoremap\2\vsilent\2ð\1\1\0\3\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0013\2\6\0=\2\a\1B\0\2\1K\0\1\0\14on_attach\0\28current_line_blame_opts\1\0\3\14virt_text\2\ndelay\3è\a\18virt_text_pos\16right_align\1\0\5\20update_debounce\3ô\3\15signcolumn\2\24attach_to_untracked\2\23current_line_blame\1\nnumhl\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hydra.nvim"] = {
    config = { "\27LJ\2\0024\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\25ag.plugin-conf.hydra\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/hydra.nvim",
    url = "https://github.com/anuvyklack/hydra.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2Õ\1\0\0\2\0\6\0\r6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0K\0\1\0)indent_blankline_disable_with_nolist$indent_blankline_use_treesitter\1\6\0\0\flspinfo\vpacker\16checkhealth\thelp\rstartify&indent_blankline_filetype_exclude\6g\bvim\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\0026\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\27ag.plugin-conf.lualine\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2K\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\vmap_cr\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\0029\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\30ag.plugin-conf.completion\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23ag.plugin-conf.dap\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeRefresh" },
    config = { "\27LJ\2\2\1\0\0\3\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\1B\0\2\1K\0\1\0\bgit\1\0\2\vignore\1\venable\2\tview\1\0\3\18adaptive_size\2\tside\tleft\nwidth\3\30\1\0\1\18hijack_cursor\2\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  tabular = {
    after_files = { "/home/brian/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    commands = { "Tab" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\0028\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\29ag.plugin-conf.telescope\frequire\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "Gdiffsplit" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/brian/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\2Ò\4\0\0\6\0\26\00086\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0004\1\4\0005\2\n\0005\3\t\0=\3\v\2>\2\1\0015\2\r\0005\3\f\0=\3\1\2>\2\2\0015\2\15\0005\3\14\0=\3\16\2>\2\3\1=\1\b\0006\0\0\0009\0\1\0)\1\5\0=\1\17\0006\0\0\0009\0\1\0004\1\3\0005\2\19\0005\3\20\0=\3\21\2>\2\1\0015\2\22\0004\3\3\0'\4\23\0006\5\0\0009\5\24\0059\5\25\5B\5\1\2&\4\5\4>\4\1\3=\3\21\2>\2\2\1=\1\18\0K\0\1\0\vgetcwd\afn\r    MRU \1\0\1\ttype\bdir\vheader\1\2\0\0\17    Commands\1\0\1\ttype\rcommands\19startify_lists\26startify_files_number\6c\1\0\0\1\3\0\0\20Checkout Branch\27Telescope git_branches\1\0\0\1\3\0\0\14Live Grep\24Telescope live_grep\6f\1\0\0\1\3\0\0\15Find Files\25Telescope find_files\22startify_commands\acd\24startify_change_cmd startify_change_to_vcs_root\27startify_change_to_dir\r~/.sesh/\25startify_session_dir\6g\bvim\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\2o\0\0\2\0\5\0\r6\0\0\0009\0\1\0009\0\2\0)\1\1\0B\0\2\2\15\0\0\0X\1\3€'\0\3\0L\0\2\0X\0\2€'\0\4\0L\0\2\0K\0\1\0\n<C-j>\28<Plug>(vsnip-jump-next)\19vsnip#jumpable\afn\bvimo\0\0\2\0\5\0\r6\0\0\0009\0\1\0009\0\2\0)\1ÿÿB\0\2\2\15\0\0\0X\1\3€'\0\3\0L\0\2\0X\0\2€'\0\4\0L\0\2\0K\0\1\0\n<C-k>\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvimí\1\1\0\5\0\16\0\0256\0\0\0009\0\1\0006\1\0\0009\1\3\0019\1\4\1'\2\5\0B\1\2\2=\1\2\0006\0\0\0009\0\6\0009\0\a\0005\1\b\0'\2\t\0003\3\n\0005\4\v\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0005\1\f\0'\2\r\0003\3\14\0005\4\15\0B\0\5\1K\0\1\0\1\0\2\texpr\2\vsilent\2\0\n<C-k>\1\3\0\0\6i\6s\1\0\2\texpr\2\vsilent\2\0\n<C-j>\1\3\0\0\6i\6s\bset\vkeymap\25~/.config/nvim/snips\vexpand\afn\22vsnip_snippet_dir\6g\bvim\0" },
    loaded = true,
    path = "/home/brian/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cmp"] = "nvim-cmp"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\2ã\1\0\0\3\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\1B\0\2\1K\0\1\0\15treesitter\1\0\1\17update_delay\3d\rbackends\1\0\6\17manage_folds\1\23link_folds_to_tree\1\23link_tree_to_folds\1\19close_behavior\nclose\14min_width\3\20\14max_width\3(\1\2\0\0\15treesitter\nsetup\vaerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\0028\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\29ag.plugin-conf.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: editorconfig-vim
time([[Config for editorconfig-vim]], true)
try_loadstring('\27LJ\2\2Q\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\18fugitive://.*"EditorConfig_exclude_patterns\6g\bvim\0', "config", "editorconfig-vim")
time([[Config for editorconfig-vim]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\2o\0\0\2\0\5\0\r6\0\0\0009\0\1\0009\0\2\0)\1\1\0B\0\2\2\15\0\0\0X\1\3€'\0\3\0L\0\2\0X\0\2€'\0\4\0L\0\2\0K\0\1\0\n<C-j>\28<Plug>(vsnip-jump-next)\19vsnip#jumpable\afn\bvimo\0\0\2\0\5\0\r6\0\0\0009\0\1\0009\0\2\0)\1ÿÿB\0\2\2\15\0\0\0X\1\3€'\0\3\0L\0\2\0X\0\2€'\0\4\0L\0\2\0K\0\1\0\n<C-k>\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvimí\1\1\0\5\0\16\0\0256\0\0\0009\0\1\0006\1\0\0009\1\3\0019\1\4\1'\2\5\0B\1\2\2=\1\2\0006\0\0\0009\0\6\0009\0\a\0005\1\b\0'\2\t\0003\3\n\0005\4\v\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0005\1\f\0'\2\r\0003\3\14\0005\4\15\0B\0\5\1K\0\1\0\1\0\2\texpr\2\vsilent\2\0\n<C-k>\1\3\0\0\6i\6s\1\0\2\texpr\2\vsilent\2\0\n<C-j>\1\3\0\0\6i\6s\bset\vkeymap\25~/.config/nvim/snips\vexpand\afn\22vsnip_snippet_dir\6g\bvim\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\2Õ\1\0\0\2\0\6\0\r6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0K\0\1\0)indent_blankline_disable_with_nolist$indent_blankline_use_treesitter\1\6\0\0\flspinfo\vpacker\16checkhealth\thelp\rstartify&indent_blankline_filetype_exclude\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\0029\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\30ag.plugin-conf.catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\2\2Ò\4\0\0\6\0\26\00086\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0004\1\4\0005\2\n\0005\3\t\0=\3\v\2>\2\1\0015\2\r\0005\3\f\0=\3\1\2>\2\2\0015\2\15\0005\3\14\0=\3\16\2>\2\3\1=\1\b\0006\0\0\0009\0\1\0)\1\5\0=\1\17\0006\0\0\0009\0\1\0004\1\3\0005\2\19\0005\3\20\0=\3\21\2>\2\1\0015\2\22\0004\3\3\0'\4\23\0006\5\0\0009\5\24\0059\5\25\5B\5\1\2&\4\5\4>\4\1\3=\3\21\2>\2\2\1=\1\18\0K\0\1\0\vgetcwd\afn\r    MRU \1\0\1\ttype\bdir\vheader\1\2\0\0\17    Commands\1\0\1\ttype\rcommands\19startify_lists\26startify_files_number\6c\1\0\0\1\3\0\0\20Checkout Branch\27Telescope git_branches\1\0\0\1\3\0\0\14Live Grep\24Telescope live_grep\6f\1\0\0\1\3\0\0\15Find Files\25Telescope find_files\22startify_commands\acd\24startify_change_cmd startify_change_to_vcs_root\27startify_change_to_dir\r~/.sesh/\25startify_session_dir\6g\bvim\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\2ž\3\0\1\a\0\16\0+5\1\0\0=\0\1\0016\2\2\0009\2\3\0029\2\4\2'\3\5\0'\4\6\0'\5\a\0\18\6\1\0B\2\5\0016\2\2\0009\2\3\0029\2\4\2'\3\5\0'\4\b\0'\5\t\0\18\6\1\0B\2\5\0016\2\2\0009\2\3\0029\2\4\2'\3\5\0'\4\n\0'\5\v\0\18\6\1\0B\2\5\0016\2\2\0009\2\3\0029\2\4\2'\3\5\0'\4\f\0'\5\r\0\18\6\1\0B\2\5\0016\2\2\0009\2\3\0029\2\4\2'\3\5\0'\4\14\0'\5\15\0\18\6\1\0B\2\5\1K\0\1\0 <cmd>Gitsigns prev_hunk<CR>\15<Leader>gp <cmd>Gitsigns next_hunk<CR>\15<Leader>gn!<cmd>Gitsigns stage_hunk<CR>\15<Leader>sh!<cmd>Gitsigns reset_hunk<CR>\15<Leader>rh#<cmd>Gitsigns preview_hunk<CR>\6=\6n\bset\vkeymap\bvim\vbuffer\1\0\2\fnoremap\2\vsilent\2ð\1\1\0\3\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0013\2\6\0=\2\a\1B\0\2\1K\0\1\0\14on_attach\0\28current_line_blame_opts\1\0\3\14virt_text\2\ndelay\3è\a\18virt_text_pos\16right_align\1\0\5\20update_debounce\3ô\3\15signcolumn\2\24attach_to_untracked\2\23current_line_blame\1\nnumhl\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23ag.plugin-conf.dap\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: hydra.nvim
time([[Config for hydra.nvim]], true)
try_loadstring("\27LJ\2\0024\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\25ag.plugin-conf.hydra\frequire\0", "config", "hydra.nvim")
time([[Config for hydra.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\2Ó\3\0\1\6\0\22\00066\1\0\0009\1\1\0019\1\2\1\a\1\3\0X\0010€6\1\4\0'\2\5\0B\1\2\0029\2\6\0009\3\6\0019\3\a\3\5\2\3\0X\2\2€'\2\b\0X\3\1€'\2\t\0+\3\0\0009\4\6\0009\5\6\0019\5\n\5\5\4\5\0X\4\a€6\4\4\0'\5\v\0B\4\2\0029\4\f\4B\4\1\2\18\3\4\0X\4\16€9\4\r\0009\5\r\0019\5\14\5\4\4\5\0X\4\5€9\4\r\0009\5\r\0019\5\15\5\5\4\5\0X\4\6€6\4\4\0'\5\v\0B\4\2\0029\4\16\4B\4\1\2\18\3\4\0006\4\4\0'\5\17\0B\4\2\0029\4\18\0045\5\19\0=\2\20\5=\3\21\5D\4\2\0K\0\1\0\rlocation\bkey\1\0\0\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\16__multiline\14__default\tline\nctype\18Comment.utils\frequire\bvue\rfiletype\abo\bvimN\1\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0003\2\3\0=\2\5\1B\0\2\1K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\2K\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\vmap_cr\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\0026\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\27ag.plugin-conf.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tab lua require("packer.load")({'tabular'}, { cmd = "Tab", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'nvim-ts-context-commentstring', 'nvim-ts-autotag', 'nvim-lsp-ts-utils'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
