MiniDeps.now(function()
    require('mini.icons').setup()
end)

MiniDeps.now(function()
    require('mini.statusline').setup()
end)

MiniDeps.now(function()
    local palette = {
        base00 = "#000000",
        base01 = "#121212",
        base02 = "#222222",
        base03 = "#333333",
        base04 = "#999999",
        base05 = "#c1c1c1",
        base06 = "#999999",
        base07 = "#c1c1c1",
        base08 = "#5f8787",
        base09 = "#aaaaaa",
        base0A = "#a06666",
        base0B = "#dd9999",
        base0C = "#aaaaaa",
        base0D = "#888888",
        base0E = "#999999",
        base0F = "#444444"
    }

    require('mini.base16').setup({
        palette = palette,
    })
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

MiniDeps.later(function()
    local hipatterns = require('mini.hipatterns')

    hipatterns.setup({
      highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
end)

