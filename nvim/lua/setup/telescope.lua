local wk = require("which-key")

local function map(mode, lhs, rhs, description)
  wk.register(mode, {
    [lhs] = {rhs, description},
  })
  local options = { noremap = true }
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


map("n", "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "live grep with telescope")
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files with telescope")
map("n", "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<cr>", "search for word under cursor with telescope")
