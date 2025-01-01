local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug("morhetz/gruvbox")

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {
    ['tag'] = '0.1.8'
})

Plug("vim-airline/vim-airline")
Plug("vim-airline/vim-airline-themes")

Plug('nvim-treesitter/nvim-treesitter', {
    ['do'] = ':TSUpdate'
})

Plug('williamboman/mason.nvim')
Plug('neovim/nvim-lspconfig')

Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

vim.call('plug#end')
