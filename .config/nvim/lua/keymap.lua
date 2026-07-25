-- https://neovim.io/doc/user/lsp/#_lua-module%3a-vim.lsp.buf
vim.keymap.set("n", "<leader>pr", function()
    vim.notify("Use grr instead")
end)

vim.keymap.set("n", "<leader>pd", function()
    vim.notify("Use <C-]> instead")
end)

vim.keymap.set("n", "<leader>pe", function()
    vim.notify("Use <C-w>d instead")
end)

vim.keymap.set("n", "<F2>", function()
    vim.notify("Use grn instead")
end)

vim.keymap.set("n", "<leader>ca", function()
    vim.notify("Use gra instead")
end)

vim.keymap.set("n", "<leader>e", function()
    vim.cmd("Oil")
end, { silent = true })
