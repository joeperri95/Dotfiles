

-- spellcheck
vim.api.nvim_create_autocmd(
    { "Bufread", "BufNewFile" },
    { pattern = {"*.txt", "*.md", "*.tex", "*.org"}, command = "setlocal spell" }
)

-- remove trailing whitespace 
vim.api.nvim_create_autocmd(
    { "BufWritePre" },
    { pattern = {"*.h", "*.cpp", "*.hpp", "*.c"}, command = [[%s/\s\+$//e]] }
)
