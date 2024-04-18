local opt = vim.opt
opt.background = "dark"
opt.undofile = true
opt.undodir = vim.fn.stdpath("config") .. "/undo"
opt.undolevels = 1000
opt.undoreload = 10000
opt.autochdir = false
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
opt.laststatus = 3

vim.g.neoterm_autoscroll = 1
local group = vim.api.nvim_create_augroup("ruff", { clear = true })
vim.api.nvim_create_autocmd("bufWritePost", {
	pattern = "*.py",
	command = "silent !ruff format %",
	group = group,
})

