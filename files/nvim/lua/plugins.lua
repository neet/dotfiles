local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {
    ['tag'] = '0.1.8'
})

Plug("vim-airline/vim-airline")
Plug("vim-airline/vim-airline-themes")

Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-tree/nvim-tree.lua", {
    ['on'] = 'NeoTreeToggle'
})

Plug('nvim-treesitter/nvim-treesitter', {
    ['do'] = ':TSUpdate'
})

Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

Plug("lukas-reineke/indent-blankline.nvim")

vim.call('plug#end')
