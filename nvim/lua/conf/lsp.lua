
-- https://github.com/williamboman/mason.nvim
require("mason").setup()

-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#modules
require("mason-lspconfig").setup({
    ensure_installed = {"ts_ls"},
})

-- ぜんぶこれに統一したい
-- https://shopify.github.io/ruby-lsp/editors#built-in-vimlsp
-- vim.lsp.enable("ruby-lsp")
