local plugins = {
   -- format & linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
       require "custom.configs.null-ls"
    end,
  },

  {
    "Pocco81/AutoSave.nvim",
    module = "autosave",
    lazy = false,
    config = function()
      require("custom.configs.autosave").autosave()
    end,
   },

  {"hashivim/vim-terraform"},

  {
    "goolord/alpha-nvim",
    disable = false,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {"watzon/vim-edge-template"},

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- shell
        "bash-language-server",
        "shfmt",
        "shellcheck",

        -- python
        "pyright",
        "black",

        -- terraform
        "terraform-ls",

        -- ansible
        "ansible-language-server",
        -- docker
        "dockerfile-language-server"
      },
    },
  },
}

return plugins
