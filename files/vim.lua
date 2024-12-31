local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {
    ['tag'] = '0.1.8'
})
Plug('nvim-treesitter/nvim-treesitter', {
    ['do'] = ':TSUpdate'
})
Plug('williamboman/mason.nvim')
Plug('neovim/nvim-lspconfig')

Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
vim.call('plug#end')

-- https://github.com/williamboman/mason.nvim
require("mason").setup()

-- https://github.com/neovim/nvim-lspconfig
require("lspconfig").ts_ls.setup {}

-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#modules
require("nvim-treesitter.configs").setup {
    ensure_installed = {"lua", "vim", "vimdoc", "typescript", "javascript", "markdown", "markdown_inline"},

    auto_install = true,

    highlight = {
        enable = true
    }
}

-- Set up nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
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
    }}, {{
        name = 'buffer'
    }})
})

cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{
        name = 'buffer'
    }}
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{
        name = 'path'
    }}, {{
        name = 'cmdline'
    }}),
    matching = {
        disallow_symbol_nonprefix_matching = false
    }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['ts_ls'].setup {
    capabilities = capabilities
}
