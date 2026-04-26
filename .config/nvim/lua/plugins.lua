MiniDeps.add('nvim-lua/plenary.nvim')
MiniDeps.add("neovim/nvim-lspconfig")
MiniDeps.add("rose-pine/neovim")
MiniDeps.add("stevearc/conform.nvim")
MiniDeps.add("lukas-reineke/indent-blankline.nvim")
MiniDeps.add("stevearc/oil.nvim")
MiniDeps.add("refractalize/oil-git-status.nvim", {
    depends = { "stevearc/oil.nvim" }
})
