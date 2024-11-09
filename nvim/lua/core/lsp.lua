-- Setup language servers.

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {"clangd", "pylsp", "rust_analyzer", "gopls", "cmake"}
}

local lspconfig = require('lspconfig')

lspconfig.pyright.setup {}
lspconfig.clangd.setup {
    cmd = {
        "clangd",
        "--clang-tidy",
    }
}

lspconfig.cmake.setup {}
lspconfig.gopls.setup {}
lspconfig.rust_analyzer.setup {}

-- Mason installation utils
function file_exists(name)
    local f=io.open(name, "r")
    if f~=nil then
        io.close(f)
        return true
    else
        return false
    end
end

mason_install_root_dir = vim.fn.resolve(vim.fn.stdpath("data").."/mason")

function ensure_mason_package_installed(mason_package)
    if file_exists(vim.fn.resolve (mason_install_root_dir.."/packages/"..mason_package)) == false then
        vim.cmd(":MasonInstall "..mason_package)
    end
end

-- Ensure linters installed
ensure_mason_package_installed("pylint")
ensure_mason_package_installed("clang-format")
ensure_mason_package_installed("shellcheck")

-- Ensure formatters installed
ensure_mason_package_installed("black")
ensure_mason_package_installed("stylua")

-- Setup formatters
require("formatter").setup {
    filetype = {
        lua = { require("formatter.filetypes.lua").stylua },
        cpp = { require("formatter.filetypes.cpp").clangformat},
        python = { require("formatter.filetypes.python").black},
        rust = { require("formatter.filetypes.rust").rustfmt},
    }
}
