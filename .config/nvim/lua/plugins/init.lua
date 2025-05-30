return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require "configs.telescope"
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = require "configs.copilot-chat"
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },

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
