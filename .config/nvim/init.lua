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
require('plugins')

require('conf.mini.workflow')
require('conf.mini.text')
require('conf.mini.appearance')

require('conf.terminal')
require('conf.telescope')
require('conf.vim')
require('conf.lsp')
-- require('conf.syntax')
