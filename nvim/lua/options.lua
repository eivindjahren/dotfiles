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

vim.g.tex_flavor = "latex"
vim.g["test#strategy"] = "kitty"
vim.g.auto_test = 0
vim.g.neoterm_autoscroll = 1

vim.cmd([[colorscheme catppuccin]])

vim.cmd [[
  let g:vim_isort_config_overrides = {'multi_line_output': 3}
  command! -bang -nargs=* GGrep  call fzf#vim#grep(    'git grep --line-number -- '.shellescape(<q-args>), 0,    fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
  command! Spawnkitty  !export KITTY_LISTEN_ON=unix:/tmp/mykitty && nohup kitty -o allow_remote_control=yes --listen-on unix:/tmp/mykitty &

  autocmd BufWritePre silent! if get(g:, 'auto_test', 1) | execute ':TestSuite' | endif
  autocmd BufWritePre *.py silent! execute ':Isort'
  autocmd BufWritePre *.py silent! execute ':Black'
]]
