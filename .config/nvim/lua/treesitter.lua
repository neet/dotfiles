MiniDeps.add({
    source = 'nvim-treesitter/nvim-treesitter',
    hooks = {
        post_checkout = function()
            vim.cmd.TSUpdate()
        end
    },
})

MiniDeps.now(function()
    require('nvim-treesitter.configs').setup({
        ensure_installed = { 'lua', 'vimdoc', 'typescript', 'tsx', 'ruby' },
        highlight = {
            enable = true,
        },
    })
end)
