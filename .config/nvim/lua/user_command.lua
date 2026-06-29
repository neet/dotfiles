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
    "YankPathAbs",
    function()
        local filepath = vim.fn.expand("%:p")
        vim.fn.setreg("+", filepath)
        vim.notify(filepath .. " has been copied")
    end,
    {
        desc = "現在のファイルの絶対パスをコピーします"
    }
)

function exec(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

vim.api.nvim_create_user_command(
    "YankPathGh",
    function()
        local origin = exec("git remote get-url origin")
        local base_url = string.sub(origin, 1, -6);
        local branch = exec("git branch --show-current")
        local filepath = vim.fn.expand("%")

        local parmalink = string.format("%s/blob/%s/%s", base_url, branch, filepath);
        vim.fn.setreg("+", parmalink)
        vim.notify(parmalink .. " has been copied")
    end,
    {
        desc = "現在のファイルのGitHubにおけるパーマリンクを取得します",
    }
)
