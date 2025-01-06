-- https://github.com/williamboman/mason.nvim
require("mason").setup()

-- https://github.com/neovim/nvim-lspconfig
require("lspconfig").ts_ls.setup {}

-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#modules
require("nvim-treesitter.configs").setup {
    ensure_installed = {"lua", "vim", "vimdoc", "typescript", "javascript", "markdown", "markdown_inline"},

    auto_install = true,

    highlight = {
        enable = true
    }
}
