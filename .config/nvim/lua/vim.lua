require('mini.basics').setup()
require('mini.diff').setup()
require('mini.cursorword').setup()

require('mini.animate').setup({
    cursor = { enable = false },
    resize = { enable = false },
    open = { enable = false },
    close = { enable = false }
})

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
    highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
})

local notify = require('mini.notify')
notify.setup()
vim.notify = notify.make_notify({
    ERROR = { duration = 10000 }
})

require('oil').setup({
    view_options = {
        -- `g.` で切り替えられる
        show_hidden = true,

        -- show_hidden の切り替え状態とは関係なしに常に隠す
        is_always_hidden = function(name, bufnr)
            local always_hidden_names = {
                "^%.git$",
                "^%.direnv$",
                "^%.pytest_cache$",
                "^%.mypy_cache$",
                "^%.ruff_cache$",
                "^%.?venv$",
                "^%.next$",
                "%.egg-info$",
                "^%.DS_Store$",
            }

            for index, value in ipairs(always_hidden_names) do
                if string.match(name, value) ~= nil then
                    return true
                end
            end

            return false
        end

    },
    win_options = {
        signcolumn = "yes:2",
    },
})

require("oil-git-status").setup({
    -- gitignoreされたものについて!!と表示するのをやめる
    show_ignored = false
})

-- oとoptの違い:
-- https://neovim.io/doc/user/lua/#lua-options
vim.opt.clipboard:append("unnamed")

vim.opt.scrolloff = 3

-- 画面端の折り返しを乗り越えられるキー
vim.opt.whichwrap = "b,s,h,l,<,>,[,],~"

-- window (といっても floating window 限定) のボーダーを指定できる
vim.opt.winborder = 'rounded'
vim.opt.pumborder = 'rounded'

-- :grep を :silent grep! のエイリアスにする
-- デフォルトだとアウトプットが出力されて「Press ENTER or type command to continue」と言われるし
-- 一件目の検索結果を勝手に開く
vim.cmd("cnoreabbrev grep silent grep!")
vim.cmd("cnoreabbrev lgrep silent lgrep!")

-- デフォルトの設定だと `-uu` フラグが付いているので消している
vim.opt.grepprg = "rg --vimgrep --smart-case"

-- カラースキーム
require('rose-pine').setup()
vim.cmd("colorscheme rose-pine")

-- インデント
require("ibl").setup({
    indent = { char = "▏" },
    scope = {
        enabled = false
    }
})
