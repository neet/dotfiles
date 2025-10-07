MiniDeps.now(function()
    require('mini.icons').setup()
end)

MiniDeps.now(function()
    require('mini.statusline').setup()
end)

MiniDeps.now(function()
    local rose_pine = {
        base00 = "#191724",
        base01 = "#1f1d2e",
        base02 = "#26233a",
        base03 = "#6e6a86",
        base04 = "#908caa",
        base05 = "#e0def4",
        base06 = "#e0def4",
        base07 = "#524f67",
        base08 = "#eb6f92",
        base09 = "#f6c177",
        base0A = "#ebbcba",
        base0B = "#31748f",
        base0C = "#9ccfd8",
        base0D = "#c4a7e7",
        base0E = "#f6c177",
        base0F = "#524f67"
    }

    require('mini.base16').setup({
        palette = rose_pine,
    })

    -- transparent background
    -- https://github.com/basecamp/omakub/issues/64#issuecomment-2158192365
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
end)

MiniDeps.now(function()
    local notify = require('mini.notify')
    notify.setup()

    vim.notify = notify.make_notify({
        ERROR = { duration = 10000 }
    })
end)

MiniDeps.later(function()
    require('mini.cursorword').setup()
end)

MiniDeps.later(function()
    local indentscope = require('mini.indentscope');

    indentscope.setup({
        draw = {
            delay = 0,
            animation = indentscope.gen_animation.none(),
        }
    })
end)

MiniDeps.later(function()
  local animate = require('mini.animate')
  animate.setup({
    cursor = { enable = false },
    resize = { enable = false },
    open = { enable = false },
    close = { enable = false }
  })
end)
