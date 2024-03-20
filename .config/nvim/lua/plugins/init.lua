return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
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

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "dockerfile",
        "go",
        "hcl",
        "helm",
        "json",
        "lua",
        "make",
        "ninja",
        "python",
        "rst",
        "regex",
        "terraform",
        "toml",
        "vimdoc",
        "vim",
        "yaml",
      },
    },
  },
}

