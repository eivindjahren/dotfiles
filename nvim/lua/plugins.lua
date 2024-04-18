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
    use({ "neovim/nvim-lspconfig", config = function() require("setup/lsp") end, tag = "v0.1.6" })
    use({ "simnalamburt/vim-mundo" })
    use({ "vim-airline/vim-airline",
        config = function () require("setup/vim-airline") end,
        requires = { "vim-airline/vim-airline-themes" },
        tag = "v0.11"
    })
    use({ "vim-airline/vim-airline-themes" })
    use({ "tpope/vim-vinegar" })
    use({ "tpope/vim-fugitive" })
    use({ "tpope/vim-rhubarb" })
    use({
        "vim-test/vim-test",
        setup = function () require("setup/vim-test") end
    })
    use({
        "vimwiki/vimwiki",
        config = function () require("setup/vim-wiki") end,
        tag="v2023.04.04_1"
    })
    use {
       "hrsh7th/nvim-cmp",
       requires = {
         { "onsails/lspkind-nvim", module = "lspkind" },
         { "hrsh7th/cmp-buffer", module = "cmp_buffer" },
         { "hrsh7th/cmp-path", module = "cmp_path" },
         { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
         { "hrsh7th/cmp-nvim-lua", module = "cmp_nvim_lua" },
       },
       event = "InsertEnter",
       config = function()
         require "setup/cmp"
       end,
     }
    use({
      'nvim-telescope/telescope.nvim',
      tag = '0.1.6',
      config = function() require("setup/telescope") end,
      requires = {
          { "nvim-telescope/telescope-live-grep-args.nvim", 'nvim-lua/plenary.nvim'},
        },
    })
    use({
        "catppuccin/nvim",
        tag="v1.6.0",
        config = function() require("setup/catppuccin") end
    })
    use({"katawful/kat.nvim", tag="2.0"})
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
