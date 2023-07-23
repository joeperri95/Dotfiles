
local cmp = require('cmp')
cmp.setup({

-- cmp
 mapping = cmp.mapping.preset.insert({
     ['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
     ['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
     ['<CR>'] = cmp.mapping.confirm({select = true}),
     ['<C-space>'] = cmp.mapping.complete(),
 }),
 sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
 }, {
    { name = 'buffer' }
 })

})
