-- https://neovim.io/doc/user/lsp/#_lua-module%3a-vim.lsp.buf
vim.keymap.set("n", "<leader>e", function()
    vim.cmd("Oil")
end, { silent = true })

-- インラインモードで貼り付けをするときに " レジスタを使うのが癖になっているが、
-- OS のクリップボードと動悸するために unnamedplus レジスタを使っている
vim.keymap.set({ 'i', 'c' }, '<C-r>"', '<C-r>+')
