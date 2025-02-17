return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "towolf/vim-helm",
    ft = "helm",
  },

  {
    "hashivim/vim-terraform",
    ft = "terraform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
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
        "helm-ls",
        "lua-language-server",
        "pyright",
        "prettier",
        "stylua",
        "shfmt",
        "shellcheck",
        "terraform-ls",
        "tflint",
        "yaml-language-server",
      },
    },
  },
}
