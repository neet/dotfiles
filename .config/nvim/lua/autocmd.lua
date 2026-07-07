vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

-- https://github.com/nvim-treesitter/nvim-treesitter#supported-features
vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

-- :grepしたあとに:cwindowする
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = "[^l]*",
    callback = function()
        vim.cmd("cwindow")
    end,
})

-- :lgrepしたあとに:lwindowする
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = "l*",
    callback = function()
        vim.cmd("lwindow")
    end,
})
