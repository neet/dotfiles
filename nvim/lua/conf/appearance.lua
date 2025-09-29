vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.background = 'dark'

require("github-theme").setup({
    options = {
        terminal_colors = false,
    },
})

vim.cmd("colorscheme github_dark_default")
