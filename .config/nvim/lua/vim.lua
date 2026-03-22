MiniDeps.now(function()
    require('mini.basics').setup()
end)

-- oとoptの違い:
-- https://neovim.io/doc/user/lua/#lua-options
vim.opt.clipboard:append("unnamedplus")

vim.opt.scrolloff = 3

-- 画面端の折り返しを乗り越えられるキー
vim.opt.whichwrap = "b,s,h,l,<,>,[,],~"

-- ステータスラインを消す
vim.opt.laststatus = 0

-- コマンドラインを非表示にする
vim.opt.cmdheight = 0

-- window (といっても floating window 限定) のボーダーを指定できる
vim.opt.winborder = "single"

vim.g.netrw_banner = 0

vim.g.netrw_list_hide = table.concat({
    [[^\.git/$]],
    [[^\.DS_Store$]],
    [[^\.direnv/$]],
    [[^\.pytest_cache/$]],
    [[^__pycache__/$]],
    [[^\.mypy_cache/$]],
    [[^\.ruff_cache/$]],
    [[^\.?venv/$]],
    [[\.egg-info/$]]
}, ",")

MiniDeps.later(function()
    require('mini.diff').setup()
end)
