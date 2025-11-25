local builtin = require('telescope.builtin')

vim.keymap.set('n', '<space>ff', builtin.find_files, {
    desc = 'Find Files'
})

vim.keymap.set('n', '<space>fg', builtin.live_grep, {
    desc = 'Live Grep'
})

vim.keymap.set('n', '<space>fb', builtin.buffers, {
    desc = 'Find Buffers'
})

vim.keymap.set('n', '<space>fh', builtin.help_tags, {
    desc = 'Find Help'
})

vim.keymap.set('n', '<space>pd', builtin.lsp_definitions, {
    desc = 'Peek Definitions',
    noremap = true,
    silent = true
})

vim.keymap.set('n', '<space>pr', builtin.lsp_references, {
    desc = 'Peek References',
    noremap = true,
    silent = true
})

vim.keymap.set('n', '<space>pe', vim.diagnostic.open_float, {
    desc = 'Peek Errors',
})

vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {
    desc = "LSP Rename symbol",
})

