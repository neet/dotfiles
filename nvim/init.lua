-- shared clipboard with os
vim.opt.clipboard:append('unnamedplus,unnamed')

vim.opt.scrolloff = 3

vim.opt.whichwrap = 'b,s,h,l,<,>,[,],~'

vim.api.nvim_create_user_command(
    'InitLua',
    function()
        vim.cmd.edit(vim.fn.stdpath('config') .. '/init.lua')
    end,
    { desc = 'Open init.lua' }
)

local augroup = vim.api.nvim_create_augroup('init.lua', {})

local function create_autocmd(event, opts)
    vim.api.nvim_create_autocmd(event, vim.tbl_extend('force', {
        group = augroup,
    }, opts))
end

-- https://vim-jp.org/vim-users-jp/2011/02/20/Hack-202.html
create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function(event)
        local dir = vim.fs.dirname(event.file)
        local force = vim.v.cmdbang == 1
        if vim.fn.isdirectory(dir) == 0
            and (force or vim.fn.confirm('"' .. dir .. '" does not exist. Create?', "&Yes\n&No") == 1) then
            vim.fn.mkdir(vim.fn.iconv(dir, vim.opt.encoding:get(), vim.opt.termencoding:get()), 'p')
        end
    end,
    desc = 'Auto mkdir to save file'
})

vim.keymap.set({ 'n', 'x' }, 'x', '"_d', { desc = 'Delete using blackhole register' })
vim.keymap.set('n', 'X', '"_D', { desc = 'Delete using blackhole register' })
vim.keymap.set('o', 'x', 'd', { desc = 'Delete using x' })

-- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-deps.md#installation
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/nvim-mini/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup({ path = { package = path_package } })

MiniDeps.add({ name = 'mini.nvim', checkout = 'stable' })

MiniDeps.now(function()
    require('mini.icons').setup()
end)

MiniDeps.now(function()
    require('mini.basics').setup()
end)

MiniDeps.now(function()
    require('mini.statusline').setup()
    -- 画面を分割したときの表示をコンパクトにする
    vim.opt.laststatus = 3
    -- コマンドラインを非表示にする
    vim.opt.cmdheight = 0
end)

-- require('mini.statusline').setup()と同じlaterの中に追加
-- create_autocmd({ 'RecordingEnter', 'CmdlineEnter' }, {
--     pattern = '*',
--     callback = function()
--         vim.opt.cmdheight = 1
--     end,
-- })
-- create_autocmd('RecordingLeave', {
--     pattern = '*',
--     callback = function()
--         vim.opt.cmdheight = 0
--     end,
-- })
-- create_autocmd('CmdlineLeave', {
--     pattern = '*',
--     callback = function()
--         if vim.fn.reg_recording() == '' then
--             vim.opt.cmdheight = 0
--         end
--     end,
-- })

MiniDeps.now(function()
    require('mini.notify').setup()

    vim.notify = require('mini.notify').make_notify({
        ERROR = { duration = 10000 }
    })
end)

MiniDeps.now(function()
    vim.cmd.colorscheme('minicyan');
end)


MiniDeps.later(function()
    local hipatterns = require('mini.hipatterns')

    hipatterns.setup({
        highlighters = {
            -- #00ff00
            hex_color = hipatterns.gen_highlighter.hex_color(),
        }
    })
end)

MiniDeps.later(function()
    require('mini.cursorword').setup()
end)

MiniDeps.later(function()
    require('mini.indentscope').setup({
        draw = {
            delay = 0,
            animation = require('mini.indentscope').gen_animation.none(),
        }
    })
end)

-- MiniDeps.later(function()
--     require('mini.trailspace').setup()
-- end)

MiniDeps.later(function()
    require('mini.pairs').setup()
end)

MiniDeps.later(function()
    require('mini.surround').setup()
end)

MiniDeps.later(function()
    local miniclue = require('mini.clue')
    miniclue.setup({
        triggers = {
            -- Leader triggers
            { mode = 'n', keys = '<Leader>' },
            { mode = 'x', keys = '<Leader>' },

            -- Built-in completion
            { mode = 'i', keys = '<C-x>' },

            -- `g` key
            { mode = 'n', keys = 'g' },
            { mode = 'x', keys = 'g' },

            -- Marks
            { mode = 'n', keys = "'" },
            { mode = 'n', keys = '`' },
            { mode = 'x', keys = "'" },
            { mode = 'x', keys = '`' },

            -- Registers
            { mode = 'n', keys = '"' },
            { mode = 'x', keys = '"' },
            { mode = 'i', keys = '<C-r>' },
            { mode = 'c', keys = '<C-r>' },

            -- Window commands
            { mode = 'n', keys = '<C-w>' },

            -- `z` key
            { mode = 'n', keys = 'z' },
            { mode = 'x', keys = 'z' },
        },

        clues = {
            -- Enhance this by adding descriptions for <Leader> mapping groups
            miniclue.gen_clues.builtin_completion(),
            miniclue.gen_clues.g(),
            miniclue.gen_clues.marks(),
            miniclue.gen_clues.registers(),
            miniclue.gen_clues.windows(),
            miniclue.gen_clues.z(),
        },
    })
end)

MiniDeps.now(function()
    vim.diagnostic.config({
        virtual_text = true
    })
    vim.lsp.config('*', {
        root_markers = { '.git' },
    })
    vim.lsp.config('lua_ls', {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        on_init = function(client)
            if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
                    return
                end
            end
            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = { version = 'LuaJIT' },
                workspace = {
                    checkThirdParty = false,
                    library = vim.list_extend(vim.api.nvim_get_runtime_file('lua', true), {
                        "${3rd}/luv/library",
                        "${3rd}/busted/library",
                    }),
                }
            })
        end,
        settings = {
            Lua = {
                diagnostics = {
                    -- 未使用変数は冒頭に`_`をつけていれば警告なし
                    unusedLocalExclude = { '_*' }
                }
            }
        }
    })
    vim.lsp.enable('lua_ls')
end)

create_autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        vim.keymap.set('n', 'grd', function()
            vim.lsp.buf.definition()
        end, { buffer = args.buf, desc = 'vim.lsp.buf.definition()' })

        vim.keymap.set('n', '<space>i', function()
            vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end, { buffer = args.buf, desc = 'Format buffer' })
    end,
})

MiniDeps.later(function()
    require('mini.completion').setup()
end)
