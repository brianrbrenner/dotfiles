require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "tsserver", "eslint_d", "prettierd" }
})
