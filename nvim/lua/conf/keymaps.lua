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
