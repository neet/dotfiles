vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

MiniDeps.add("nvim-tree/nvim-tree.lua")

MiniDeps.now(function ()
    require("nvim-tree").setup()
end)
