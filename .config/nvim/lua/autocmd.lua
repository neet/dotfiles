-- https://github.com/nvim-treesitter/nvim-treesitter#supported-features
vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        if pcall(vim.treesitter.start) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

-- 不完全。本当は pnpm や yarn や bun に対応するべき。
vim.api.nvim_create_autocmd('FileType', {
    pattern = { "typescript", "typescriptreact" },
    callback = function()
        vim.cmd("compiler tsc")
        vim.opt.makeprg = "npm run build"
    end
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = "rust",
    command = "compiler cargo"
})

-- :grepしたあとに:cwindowする
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = "[^l]*",
    command = "cwindow"
})

-- :lgrepしたあとに:lwindowする
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = "l*",
    command = "lwindow"
})
