-- こうなってしまうのを防ぐためのハック:
-- https://i.imgur.com/Hnctr8s.png
-- https://www.pandanoir.info/entry/2026/04/19/095000
local orig_complete_set = vim.api.nvim__complete_set
vim.api.nvim__complete_set = function(...)
    local result = orig_complete_set(...)
    if result and result.winid then
        pcall(vim.api.nvim_win_set_config, result.winid, { border = 'rounded' })
    end
    return result
end
