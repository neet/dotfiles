require('mini.basics').setup()
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
local c = require("mellow.colors")["dark"]
vim.g.mellow_transparent = true
vim.g.mellow_highlight_overrides = {
    ["IblIndent"] = { fg = c.black }
}
vim.cmd("colorscheme mellow")

-- インデント
require("ibl").setup({
    indent = { char = "▏" },
    scope = {
        enabled = false
    }
})

require('gitsigns').setup {
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then
                vim.cmd.normal({ ']c', bang = true })
            else
                gitsigns.nav_hunk('next')
            end
        end)

        map('n', '[c', function()
            if vim.wo.diff then
                vim.cmd.normal({ '[c', bang = true })
            else
                gitsigns.nav_hunk('prev')
            end
        end)

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk)
        map('n', '<leader>hr', gitsigns.reset_hunk)

        map('v', '<leader>hs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end)

        map('v', '<leader>hr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end)

        map('n', '<leader>hS', gitsigns.stage_buffer)
        map('n', '<leader>hR', gitsigns.reset_buffer)
        map('n', '<leader>hp', gitsigns.preview_hunk)
        map('n', '<leader>hi', gitsigns.preview_hunk_inline)

        map('n', '<leader>hb', function()
            gitsigns.blame_line({ full = true })
        end)

        map('n', '<leader>hd', gitsigns.diffthis)

        map('n', '<leader>hD', function()
            gitsigns.diffthis('~')
        end)

        map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
        map('n', '<leader>hq', gitsigns.setqflist)

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
        map('n', '<leader>tw', gitsigns.toggle_word_diff)

        -- Text object
        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
    end
}

require('minuet').setup {
    virtualtext = {
        auto_trigger_ft = { "typescript" },
        keymap = {
            accept = '<A-A>',
            accept_line = '<A-a>',
            accept_n_lines = '<A-z>',
            prev = '<A-[>',
            next = '<A-]>',
            dismiss = '<A-e>',
        },
    },

    provider = 'openai_fim_compatible',
    n_completions = 1,
    context_window = 512,
    provider_options = {
        openai_fim_compatible = {
            api_key = 'TERM',
            name = 'vLLM',
            end_point = 'http://compute-mitaka-02.local:8000/v1/completions',
            model = 'qwen3.6-27b',
            optional = {
                max_tokens = 56,
                top_p = 0.9,
                reasoning_effort = "none"
            },
            template = {
                prompt = function(context_before_cursor, context_after_cursor, _)
                    return '<|fim_prefix|>'
                        .. context_before_cursor
                        .. '<|fim_suffix|>'
                        .. context_after_cursor
                        .. '<|fim_middle|>'
                end,
                suffix = false,
            },
        },
    },
}
