local function exec(command)
    local handle = io.popen(command)
    if handle == nil then
        return ""
    end
    local result = handle:read("*a")
    handle:close()
    return (result:gsub("%s+$", ""))
end

vim.api.nvim_create_user_command(
    "YankPath",
    function()
        local abs_filepath = vim.fs.abspath(vim.api.nvim_buf_get_name(0))
        local filepath = vim.fs.relpath(vim.fn.getcwd(), abs_filepath) or abs_filepath
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
        local filepath = vim.fs.abspath(vim.api.nvim_buf_get_name(0))
        vim.fn.setreg("+", filepath)
        vim.notify(filepath .. " has been copied")
    end,
    {
        desc = "現在のファイルの絶対パスをコピーします"
    }
)

vim.api.nvim_create_user_command(
    "YankPathGh",
    function()
        local abs_filepath = vim.fs.abspath(vim.api.nvim_buf_get_name(0))
        local filedir = vim.fn.shellescape(vim.fs.dirname(abs_filepath))

        local origin = exec("git -C " .. filedir .. " remote get-url origin")
        local base_url = origin:gsub("%.git$", "")
        local branch = exec("git -C " .. filedir .. " branch --show-current")
        local root = exec("git -C " .. filedir .. " rev-parse --show-toplevel")
        local relpath = vim.fs.relpath(root, abs_filepath)

        local permalink = string.format("%s/blob/%s/%s", base_url, branch, relpath)
        vim.fn.setreg("+", permalink)
        vim.notify(permalink .. " has been copied")
    end,
    {
        desc = "現在のファイルのGitHubにおけるパーマリンクを取得します",
    }
)
