-- shared clipboard with os
vim.opt.clipboard:append('unnamedplus,unnamed')

vim.opt.scrolloff = 3

vim.opt.whichwrap = 'b,s,h,l,<,>,[,],~'

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

require('mini_text')
require('mini_workflow')
require('mini_appearance')

require('tree')
require('terminal')
require('telescope')

MiniDeps.add("neovim/nvim-lspconfig")
MiniDeps.now(function()

    vim.lsp.enable('lua_ls')
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('ruby_lsp')
end)
