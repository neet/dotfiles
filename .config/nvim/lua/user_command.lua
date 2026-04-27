vim.api.nvim_create_user_command(
    "YankPath",
    function()
        -- https://neovim.io/doc/user/vimfn/#expand()
        local filepath = vim.fn.expand("%")
        vim.fn.setreg("+", filepath)
        vim.notify(filepath .. " has been copied")
    end,
    {
        desc = "現在のファイルの相対パスをコピーします"
    }
)

vim.api.nvim_create_user_command(
    "YankAbsolutePath",
    function()
        local filepath = vim.fn.expand("%:p")
        vim.fn.setreg("+", filepath)
        vim.notify(filepath .. " has been copied")
    end,
    {
        desc = "現在のファイルの絶対パスをコピーします"
    }
)
