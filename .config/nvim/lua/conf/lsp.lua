-- shared clipboard with os
MiniDeps.now(function()
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('ts_ls')

    vim.lsp.enable('ruby_lsp')

    vim.lsp.enable('pylsp', {
        settings = {
            pylsp = {
                plugins = {
                    ruff = { enabled = true },
                }
            }
        }
    })
end)

