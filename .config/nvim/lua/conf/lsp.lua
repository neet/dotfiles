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

vim.lsp.enable('pylsp');


-- https://github.com/stevearc/conform.nvim
local js_formatters = { "prettierd", "prettier", stop_after_first = true }
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        ruby = { "rubocop" },
        python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format" }
            else
                return { "isort", "black" }
            end
        end,
        rust = { "rustfmt", lsp_format = "fallback" },
        json = js_formatters,
        javascript = js_formatters,
        javascriptreact = js_formatters,
        typescript = js_formatters,
        typescriptreact = js_formatters,
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})
