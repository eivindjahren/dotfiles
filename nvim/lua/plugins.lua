vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end
vim.api.nvim_command("packadd packer.nvim")
-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use({
      "nvim-treesitter/nvim-treesitter",
      config = get_setup("treesitter"),
      run = ":TSUpdate",
    })
    use("nvim-treesitter/nvim-treesitter-textobjects")
    -- use({ "neovim/nvim-lspconfig", config = get_setup("lsp") })
    use({ "simnalamburt/vim-mundo" })
    use({ "w0rp/ale" })
    use({ "vim-airline/vim-airline" })
    use({ "vim-airline/vim-airline-themes" })
    use({ "tpope/vim-vinegar" })
    use({ "tpope/vim-fugitive" })
    use({ "rhysd/vim-clang-format" })
    use({ "vim-test/vim-test" })
    use({ "thirtythreeforty/lessspace.vim" })
    use({ "psf/black" })
    use({ "fisadev/vim-isort" })
    use({ "lervag/vimtex" })
    use({ "junegunn/fzf", run = "fzf#install" })
    use({ "junegunn/fzf.vim" })
    use({
	    "catppuccin/nvim",
	    as = "catppuccin"
    })
    -- use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })
    -- use({
    --   "hrsh7th/nvim-cmp",
    --   requires = {
    --     { "hrsh7th/cmp-nvim-lsp" },
    --     { "hrsh7th/cmp-buffer" },
    --     { "hrsh7th/cmp-path" },
    --     { "hrsh7th/cmp-cmdline" },
    --     { "hrsh7th/cmp-vsnip" },
    --     { "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
    --   },
    --   config = get_setup("cmp"),
    -- })
    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
  },
})
