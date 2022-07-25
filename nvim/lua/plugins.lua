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

return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use({
      "nvim-treesitter/nvim-treesitter",
      config = function() require("setup/treesitter") end,
      run = ":TSUpdate",
    })
    use({ "neovim/nvim-lspconfig", config = function() require("setup/lsp") end })
    use({ "simnalamburt/vim-mundo" })
    use({ "vim-airline/vim-airline" })
    use({ "vim-airline/vim-airline-themes" })
    use({ "tpope/vim-vinegar" })
    use({ "tpope/vim-fugitive" })
    use({ "python-rope/ropevim" })
    use({ "vim-test/vim-test" })
    use({ "thirtythreeforty/lessspace.vim" })
    use({ "psf/black" })
    use({ "fisadev/vim-isort" })
    use({ "lervag/vimtex" })
    use({ "junegunn/fzf", run = "fzf#install" })
    use({ "junegunn/fzf.vim" })
    use({
        "andythigpen/nvim-coverage",
        config = function() require("setup/coverage") end,
        requires = { "nvim-lua/plenary.nvim" }
    })
    use({
	    "catppuccin/nvim",
	    as = "catppuccin"
    })
    use {
      "folke/which-key.nvim",
      config = function() require("setup/whichkey") end
    }
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
