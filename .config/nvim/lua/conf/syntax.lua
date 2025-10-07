MiniDeps.add({
    source = 'nvim-treesitter/nvim-treesitter',
    hooks = {
        post_checkout = function()
            vim.cmd.TSUpdate()
        end
    },
})

require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vimdoc', 'typescript', 'ruby' },
    highlight = { enable = true },
})

