-- https://neovim.io/doc/user/lsp/#_lua-module%3a-vim.lsp.buf
vim.keymap.set("n", "<leader>pr", function()
    vim.lsp.buf.references(nil)
end)

vim.keymap.set("n", "<leader>pd", function()
    vim.lsp.buf.definition()
end)

vim.keymap.set("n", "<leader>pe", vim.diagnostic.open_float, {
    desc = "Peek Errors",
})

vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {
    desc = "LSP Rename symbol",
})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
    desc = "Code Action",
})

-- Space → e = カレントディレクトリを開く
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", {
    silent = true
})

-- LSPのエラーをQuickfixとして出す
vim.keymap.set("n", "<leader>qf", vim.diagnostic.setqflist)
