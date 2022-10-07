local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local servers = {
  -- "jsonls",
  "sumneko_lua",
  "clangd",
  -- "intelephense",
  -- "cssls",
  -- "html",
  -- "tsserver",
  -- "emmet_ls",
  "pyright",
  -- "omnisharp",
  -- "yamlls",
  -- "gopls",
  -- "lemminx",
  "vimls",
  -- "cmake",
  -- "powershell_es",
}

mason.setup {
  ui = {
    border = "single",
    icons = {
      package_installed = "✓",
      package_pending = "",
      package_uninstalled = "➜",
    },
  },
}

mason_lspconfig.setup {
  ensure_installed = servers,
}

mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = {
      on_attach = require("user.plugins.lsp.handlers").on_attach,
      capabilities = require("user.plugins.lsp.handlers").capabilities,
    }

    local require_ok, server = pcall(require, "user.plugins.lsp.settings." .. server_name)
    if require_ok then
      opts = vim.tbl_deep_extend("force", server, opts)
    end

    lspconfig[server_name].setup(opts)
  end,
}

local home = vim.env.HOME
local jdtls_path = vim.fn.stdpath "data" .. "/mason/packages/jdtls/"
local equinox_version = "1.6.400.v20210924-0641"

if vim.fn.has "mac" == 1 then
  WORKSPACE_PATH = home .. "/workspace/"
  OS_NAME = "mac"
elseif vim.fn.has "unix" == 1 then
  WORKSPACE_PATH = home .. "/workspace/"
  OS_NAME = "linux"
else
  WORKSPACE_PATH = home .. "/workspace/"
  OS_NAME = "win"
end

local java_opts = {
  on_attach = require("user.plugins.lsp.handlers").on_attach,
  capabilities = require("user.plugins.lsp.handlers").capabilities,
  cmd = {
    -- 💀
    "java", -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    -- 💀
    "-jar",
    jdtls_path .. "plugins/org.eclipse.equinox.launcher_" .. equinox_version .. ".jar",
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    "-configuration",
    jdtls_path .. "config_" .. OS_NAME,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    "-data",
    WORKSPACE_PATH,
  },
}

local require_ok, jdtls = pcall(require, "user.plugins.lsp.settings.jdtls")
if require_ok then
  java_opts = vim.tbl_deep_extend("force", jdtls, java_opts)
end

lspconfig.jdtls.setup(java_opts)
