local plugins = {
   -- format & linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
       require "custom.configs.null-ls"
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

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ansible-language-server",
        "bash-language-server",
        "black",
        "dockerfile-language-server",
        "lua-language-server",
        "pyright",
        "stylua",
        "shfmt",
        "shellcheck",
        "terraform-ls",
      },
    },
  },
}

return plugins
