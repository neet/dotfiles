local vim = vim

vim.g.mapleader = ' ';

-- Telescopeの設定
local telescope = require('telescope')
local builtin = require('telescope.builtin')

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
