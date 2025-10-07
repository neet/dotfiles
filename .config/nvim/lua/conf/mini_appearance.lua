MiniDeps.now(function()
    require('mini.icons').setup()
end)

MiniDeps.now(function()
    require('mini.statusline').setup()
    -- 画面を分割したときの表示をコンパクトにする
    vim.opt.laststatus = 3
    -- コマンドラインを非表示にする
    vim.opt.cmdheight = 0
end)

MiniDeps.now(function()
    vim.cmd.colorscheme('minicyan');
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
  animate.setup({})
end)

