MiniDeps.now(function()
    require('mini.basics').setup()
end)

MiniDeps.later(function()
    require('mini.diff').setup()
end)

MiniDeps.now(function()
    require('mini.files').setup()

    vim.keymap.set("n", "<space>e", MiniFiles.open, {
        desc = 'Open mini.files',
        silent = true,
    })
end)
