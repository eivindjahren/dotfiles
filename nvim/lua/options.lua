local opt = vim.opt
opt.background = "dark"
opt.undofile = true
opt.undodir = vim.fn.stdpath("config") .. "/undo"
opt.undolevels = 1000
opt.undoreload = 10000
opt.autochdir = true
opt.number = true
opt.expandtab = true
opt.wrap = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.swapfile = false
opt.mouse = "a"
opt.smartindent = true
opt.linebreak = true
opt.termguicolors = true

vim.g.neoterm_autoscroll = 1

vim.cmd([[colorscheme catppuccin]])

vim.cmd [[
  autocmd BufWritePre *.py silent! execute ':Isort'
  autocmd BufWritePre *.py silent! execute ':Black'
]]
