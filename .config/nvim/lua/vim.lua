MiniDeps.now(function()
    require('mini.basics').setup()
end)

-- oとoptの違い:
-- https://neovim.io/doc/user/lua/#lua-options
vim.opt.clipboard:append("unnamedplus")

vim.opt.scrolloff = 3

-- 画面端の折り返しを乗り越えられるキー
vim.opt.whichwrap = "b,s,h,l,<,>,[,],~"

-- コマンドラインを非表示にする
vim.opt.cmdheight = 0

-- window (といっても floating window 限定) のボーダーを指定できる
vim.opt.winborder = "single"

vim.g.netrw_banner = 0

vim.g.netrw_list_hide = table.concat({
    [[^\./$]],
    [[^\.\./$]],
    [[^\.git/$]],
    [[^\.DS_Store$]],
    [[^\.direnv/$]],
    [[^\.pytest_cache/$]],
    [[^__pycache__/$]],
    [[^\.mypy_cache/$]],
    [[^\.ruff_cache/$]],
    [[^\.?venv/$]],
    [[^\.next/$]],
    [[\.egg-info/$]]
}, ",")

MiniDeps.later(function()
    require('mini.diff').setup()
end)

-- :grep を :silent grep! のエイリアスにする
-- デフォルトだとアウトプットが出力されて「Press ENTER or type command to continue」と言われるし
-- 一件目の検索結果を勝手に開く
vim.cmd("cnoreabbrev grep silent grep!")
vim.cmd("cnoreabbrev lgrep silent lgrep!")

-- デフォルトの設定だと `-uu` フラグが付いているので消している
vim.opt.grepprg = "rg --vimgrep --smart-case"

-- :grepしたあとに:cwindowする
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = "[^l]*",
    callback = function()
        vim.cmd("cwindow")
    end,
})

-- :lgrepしたあとに:lwindowする
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = "l*", -- lで始まるもの = lgrep, lmakeなど
    callback = function()
        vim.cmd("lwindow")
    end,
})

vim.api.nvim_create_user_command(
    "YankPath",
    function()
        -- https://neovim.io/doc/user/vimfn/#expand()
        local filepath = vim.fn.expand("%")
        vim.fn.setreg("+", filepath)
        vim.notify(filepath .. " has been copied")
    end,
    {
        desc = "現在のファイルの相対パスをコピーします"
    }
)

vim.api.nvim_create_user_command(
    "YankAbsolutePath",
    function()
        local filepath = vim.fn.expand("%:p")
        vim.fn.setreg("+", filepath)
        vim.notify(filepath .. " has been copied")
    end,
    {
        desc = "現在のファイルの絶対パスをコピーします"
    }
)
