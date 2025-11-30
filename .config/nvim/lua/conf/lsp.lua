vim.lsp.enable('lua_ls')

vim.lsp.enable('ts_ls')

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config('eslint', {
  on_attach = function(client, bufnr)
    if not base_on_attach then return end
    base_on_attach(client, bufnr)

    -- 下記がリリースされたらドキュメントに記載のある方法に戻す
    -- https://github.com/neovim/nvim-lspconfig/pull/4218
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        client:request_sync("workspace/executeCommand", {
          command = "eslint.applyAllFixes",
          arguments = {
            {
              uri = vim.uri_from_bufnr(bufnr),
              version = vim.lsp.util.buf_versions[bufnr],
            },
          },
        }, nil, bufnr)
      end,
    })
  end,
})
vim.lsp.enable('eslint')

vim.lsp.enable('ruby_lsp')
vim.lsp.enable('rubocop')

vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                ruff = { enabled = true },
            }
        }
    }
})
vim.lsp.enable('pylsp');
