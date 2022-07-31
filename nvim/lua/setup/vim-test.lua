vim.g["test#strategy"] = "kitty"
vim.g.auto_test = 0

vim.cmd [[
  let g:kitty_spawned = 0
  command! Spawnkitty  if g:kitty_spawned == 0 | let ret_code = system("export KITTY_LISTEN_ON=unix:/tmp/mykitty && nohup kitty -o allow_remote_control=yes --listen-on unix:/tmp/mykitty &") | let g:kitty_spawned=1 | endif

  let g:auto_test = 0
  let g:test_root = "."
  autocmd BufWritePre *.py silent! if g:auto_test == 1  | execute "cd" fnameescape(g:test_root) | execute ':Spawnkitty' | execute ':TestLast' | execute ':lua require("coverage").load(true)' | endif
]]
