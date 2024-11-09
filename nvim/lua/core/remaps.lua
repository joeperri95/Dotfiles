
-- Save me
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.keymap.set('n', '<leader>w', function () 
    vim.cmd(':w') 
end)

-- Move tabs
vim.keymap.set('n', '<leader><C-h>', function () 
    if (vim.fn.tabpagenr('$') > 1) then
        vim.cmd(':tabmove -1') 
    end
end)

vim.keymap.set('n', '<leader><C-l>', function () 
    if (vim.fn.tabpagenr('$') > 1) then
        vim.cmd(':tabmove +1') 
    end
end)

-- Copy/paste to clipboard
vim.keymap.set('n', '<leader>p', function () 
    vim.cmd(':normal "*p') 
end)

vim.keymap.set('n', '<leader>y', function () 
    vim.cmd(':normal "*yy') 
end)

vim.keymap.set('v', '<leader>y', function () 
    vim.cmd(':normal "*y') 
end)

-- Harpoon
vim.keymap.set('n', '<leader>hs', function () 
    vim.cmd(':lua require("harpoon.ui").toggle_quick_menu()') 
end)

vim.keymap.set('n', '<leader>ha', function () 
    vim.cmd(':lua require("harpoon.mark").add_file()') 
end)

vim.keymap.set('n', '<leader>1', function () 
    vim.cmd(':lua require("harpoon.ui").nav_file(1)') 
end)

vim.keymap.set('n', '<leader>2', function () 
    vim.cmd(':lua require("harpoon.ui").nav_file(2)') 
end)

vim.keymap.set('n', '<leader>3', function () 
    vim.cmd(':lua require("harpoon.ui").nav_file(3)') 
end)

vim.keymap.set('n', '<leader>4', function () 
    vim.cmd(':lua require("harpoon.ui").nav_file(4)') 
end)

-- Linting and formatting
local lint = require('lint')
vim.keymap.set('n', '<leader>ls', lint.try_lint, {})
vim.keymap.set('n', '<leader>lh', vim.diagnostic.hide, {})
vim.keymap.set('n', '<leader>lf', function () vim.cmd('Format') end, {})

-- Telescope
-- Install ripgrep to make this work
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fm', function()
    opt = {sections = {"1", "2", "5", "7"}}
    builtin.man_pages(opt)
end , {})

-- Packer
vim.keymap.set('n', '<leader>ps', function() vim.cmd('PackerSync') end, {})

-- Oil
vim.keymap.set('n', '-', require('oil').open, {desc = "Open parent directory "})

-- LSP
-- Taken from neovim/nvim-lspconfig
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})

-- Treesitter
-- Taken from https://github.com/nvim-treesitter/nvim-treesitter-textobjects
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

