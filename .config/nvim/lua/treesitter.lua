-- https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
MiniDeps.add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'main',
    hooks = {
        post_checkout = function()
            vim.cmd.TSUpdate()
        end
    },
})

MiniDeps.now(function()
    require('nvim-treesitter').install({
        'lua',
        'vimdoc',
        'typescript',
        'tsx',
        'ruby',
        'yaml',
        'terraform',
    })

    vim.api.nvim_create_autocmd('FileType', {
        callback = function()
            -- Enable treesitter highlighting and disable regex syntax
            pcall(vim.treesitter.start)
            -- Enable treesitter-based indentation
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    })
end)
