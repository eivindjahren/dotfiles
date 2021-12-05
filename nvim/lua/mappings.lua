
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map("n", "th", ":tabfirst<CR>")
map("n", "tj", ":tabnext<CR>")
map("n", "tk", ":tabprev<CR>")
map("n", "tl", ":tablast<CR>")
map("n", "tt", ":tabedit<Space>")
map("n", "tn", ":tabnew<CR>")
map("n", "tm", ":tabm<Space>")
map("n", "td", ":tabclose<CR>")
map("n", "<F5>", ":MundoToggle<CR>")
map("t", "<Esc>", "<C-\\><C-n>")
