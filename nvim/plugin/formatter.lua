require('formatter').setup {
    filetype = {
        cpp = {
            require("formatter.filetypes.cpp").clangformat
        },
        rust = {
            require("formatter.filetypes.cpp").rustfmt
        }
    }
}

