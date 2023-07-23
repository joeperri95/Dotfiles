-- Base nvim QOL

-- toggle hlsearch
vim.keymap.set('n', '<leader>hs', function () vim.cmd(':set hlsearch!') end)

-- move tabs
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
vim.keymap.set('n', '<leader>fc', builtin.commands, {})

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
