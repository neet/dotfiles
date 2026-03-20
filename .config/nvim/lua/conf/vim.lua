vim.opt.clipboard:append('unnamedplus,unnamed')

vim.opt.scrolloff = 3

vim.opt.whichwrap = 'b,s,h,l,<,>,[,],~'

-- 画面を分割したときの表示をコンパクトにする
vim.opt.laststatus = 3

-- コマンドラインを非表示にする
vim.opt.cmdheight = 0

vim.opt.winborder = 'single'

MiniDeps.now(function()
    require('rose-pine').setup()
    vim.cmd("colorscheme rose-pine")
end)

MiniDeps.later(function()
    require('mini.completion').setup()
end)

MiniDeps.later(function()
    -- https://github.com/nvim-mini/mini.nvim/blob/main/doc/mini-keymap.txt#L85
    local map_multistep = require('mini.keymap').map_multistep
    map_multistep('i', '<Tab>', { 'pmenu_next' })
    map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
    map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
    map_multistep('i', '<BS>', { 'minipairs_bs' })
end)

vim.opt.signcolumn = "yes"

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

vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, {
    desc = "Code Action",
})
