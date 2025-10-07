MiniDeps.add({
    source = 'nvim-treesitter/nvim-treesitter',
    hooks = {
        post_checkout = function()
            vim.cmd.TSUpdate()
        end
    },
})
