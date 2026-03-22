local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {
    desc = "Find Files"
})

vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
    desc = "Live Grep"
})

vim.keymap.set("n", "<leader>fb", builtin.buffers, {
    desc = "Find Buffers"
})

vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
    desc = "Find Help"
})

vim.keymap.set("n", "<leader>pd", builtin.lsp_definitions, {
    desc = "Peek Definitions",
    silent = true
})

vim.keymap.set("n", "<leader>pr", builtin.lsp_references, {
    desc = "Peek References",
    silent = true
})

vim.keymap.set("n", "<leader>pe", vim.diagnostic.open_float, {
    desc = "Peek Errors",
})

vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {
    desc = "LSP Rename symbol",
})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
    desc = "Code Action",
})

-- Space → e = カレントディレクトリでNetrwを開く
vim.keymap.set("n", "<leader>e", ":Ex<CR>", {
    desc = "Netrwを開く",
    silent = true
})

-- TODO: キーマップにしたりしたい
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
