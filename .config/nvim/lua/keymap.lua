-- https://neovim.io/doc/user/lsp/#_lua-module%3a-vim.lsp.buf
vim.keymap.set("n", "<leader>e", function()
    vim.cmd("Oil")
end, { silent = true })
