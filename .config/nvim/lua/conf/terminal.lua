MiniDeps.add("akinsho/toggleterm.nvim")

MiniDeps.later(function()
    -- https://github.com/akinsho/toggleterm.nvim
    require("toggleterm").setup({
        open_mapping = "<C-j>",
        direction = "float",
        float_opts = {
            border = "curved",
        },
    })
end)
