-- oとoptの違い:
-- https://neovim.io/doc/user/lua/#lua-options

vim.opt.clipboard:append('unnamedplus')

vim.opt.scrolloff = 3

-- 画面端の折り返しを乗り越えられるキー
vim.opt.whichwrap = 'b,s,h,l,<,>,[,],~'

-- 画面を分割したときの表示をコンパクトにする
vim.opt.laststatus = 3

-- コマンドラインを非表示にする
vim.opt.cmdheight = 0

-- window (といっても floating window 限定) のボーダーを指定できる
vim.opt.winborder = 'single'

vim.g.netrw_banner = 0
