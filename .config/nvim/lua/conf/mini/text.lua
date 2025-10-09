MiniDeps.later(function()
    require('mini.completion').setup()
end)

MiniDeps.later(function()
    -- https://github.com/nvim-mini/mini.nvim/blob/main/doc/mini-keymap.txt#L85
    local map_multistep = require('mini.keymap').map_multistep
    map_multistep('i', '<Tab>',   { 'pmenu_next' })
    map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
    map_multistep('i', '<CR>',    { 'pmenu_accept', 'minipairs_cr' })
    map_multistep('i', '<BS>',    { 'minipairs_bs' })

    map_multistep.setup({})
end)
