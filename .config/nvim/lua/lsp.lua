vim.lsp.enable({
    "ansiblels",
    "biome",
    "eslint",
    "hls",
    "lua_ls",
    "pylsp",
    "ruby_lsp",
    "rust_analyzer",
    "ts_ls",
})

-- ESLint だけは Conform がサポートできないらしい。
-- https://github.com/stevearc/conform.nvim/issues/222
-- 設定はここから拝借:
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/eslint.lua
local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
    on_attach = function(client, bufnr)
        if not base_on_attach then return end
        base_on_attach(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "LspEslintFixAll",
        })
    end,
})

-- https://neovim.io/doc/user/lua/#vim.filetype.add()
vim.filetype.add({
    pattern = {
        [".*%.ya?ml"] = function(path, bufnr)
            -- https://neovim.io/doc/user/lua/#vim.fs.root()
            local root = vim.fs.root(bufnr, { "ansible.cfg" })
            if root then
                return "yaml.ansible"
            end
        end,
    },
})


-- https://github.com/stevearc/conform.nvim
local web_formatters = { "biome-check", "prettierd", stop_after_first = true }
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
        json = web_formatters,
        javascript = web_formatters,
        javascriptreact = web_formatters,
        typescript = web_formatters,
        typescriptreact = web_formatters,
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})
