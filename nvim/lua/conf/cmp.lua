local cmp = require('cmp')

-- Roughly borrowed from the official README https://github.com/hrsh7th/nvim-cmp
-- but with modification on removing `buffer` and `cmdline` sources
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true
        })
    }),
    sources = cmp.config.sources({{
        name = 'nvim_lsp'
    }, {
        name = 'vsnip'
    }})
})
