MiniDeps.now(function()
    require('mini.icons').setup()
end)

MiniDeps.now(function()
    require('mini.statusline').setup()
end)

MiniDeps.now(function()
    require('rose-pine').setup({
        styles = {
            transparency = true,
        }
    })
    vim.cmd("colorscheme rose-pine");
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

