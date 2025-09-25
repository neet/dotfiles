local vim = vim
local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.g.mapleader = ' ';

vim.keymap.set('n', '<leader>ff', builtin.find_files, {
    desc = 'Find Files'
})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
    desc = 'Live Grep'
})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {
    desc = 'Find Buffers'
})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
    desc = 'Find Help'
})

vim.keymap.set('n', '<leader>pd', builtin.lsp_definitions, {
    noremap = true,
    silent = true
})

vim.keymap.set('n', '<leader>pr', builtin.lsp_references, {
    noremap = true,
    silent = true
})

vim.keymap.set('n', '<leader>pe', vim.diagnostic.open_float)

vim.keymap.set('n', "<C-\\>", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local winnr = vim.api.nvim_get_current_win()
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local is_terminal = vim.api.nvim_buf_get_option(bufnr, 'buftype') == 'terminal'

    if is_terminal then
        vim.api.nvim_win_close(winnr, true)
    else
        vim.cmd('rightb 15split term://zsh')
    end
end)

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.opt_local.number = false
    end
})

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
