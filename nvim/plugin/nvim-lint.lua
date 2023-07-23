require('lint').linters_by_ft = {
    cpp = {'cpplint',},
}

-- Convenience ex command 
vim.api.nvim_create_user_command('Lint', function () require('lint').try_lint() end, { nargs = 0 })
