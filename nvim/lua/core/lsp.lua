-- Setup language servers.

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {"clangd", "pyright", "rust_analyzer", "cmake"}
}

local lspconfig = require('lspconfig')

lspconfig.pyright.setup {}
lspconfig.clangd.setup {}
lspconfig.cmake.setup {}
lspconfig.rust_analyzer.setup {}
