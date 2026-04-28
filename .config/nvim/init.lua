vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    -- :TSUpdateを手動で実行しなければいけないかも
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    "https://github.com/stevearc/conform.nvim",

    "https://github.com/rose-pine/neovim",
    "https://github.com/lukas-reineke/indent-blankline.nvim",

    "https://github.com/stevearc/oil.nvim",
    "https://github.com/refractalize/oil-git-status.nvim",

    "https://github.com/nvim-mini/mini.basics",
    "https://github.com/nvim-mini/mini.diff",
    "https://github.com/nvim-mini/mini.completion",
    "https://github.com/nvim-mini/mini.keymap",
    "https://github.com/nvim-mini/mini.cursorword",
    "https://github.com/nvim-mini/mini.notify",
    "https://github.com/nvim-mini/mini.animate",
    "https://github.com/nvim-mini/mini.hipatterns",
})

require('lsp')
require('treesitter')
require('completion')
require('vim')
require('keymap')
require('autocmd')
require('user_command')
