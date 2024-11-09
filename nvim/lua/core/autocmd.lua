
-- spellcheck
vim.api.nvim_create_autocmd(
    { "Bufread", "BufNewFile" },
    { pattern = {"*.txt", "*.md", "*.tex", "*.org"}, command = ":setlocal spell" }
)

-- remove trailing whitespace 
vim.api.nvim_create_autocmd(
    { "BufWritePre" },
    { pattern = {"*.h", "*.cpp", "*.hpp", "*.c", "*.py"}, command = [[%s/\s\+$//e]] }
)

-- lint on save 
vim.api.nvim_create_autocmd(
    { "BufWritePost" },
    { pattern = {"*.h", "*.cpp", "*.hpp", "*.c"}, 
        callback = function()
            require('lint').try_lint()
        end,
    }
)
